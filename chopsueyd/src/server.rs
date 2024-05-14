use std::{collections::HashMap, net::SocketAddr};

use log::info;
use serde::Deserialize;
use snafu::{ResultExt, Whatever};
use tonic::{Request, Response, Status};

use crate::machine::Machine;

use tonic::transport::Server as TonicServer;

use chopsuey::chop_suey_server::{ChopSuey, ChopSueyServer};
use chopsuey::{ListMachinesReply, ListMachinesRequest, Machine as ProtoMachine};

use self::chopsuey::{WakeUpReply, WakeUpRequest};

mod chopsuey {
    tonic::include_proto!("chopsuey");
}

pub struct ChopSueyService {
    machines: HashMap<String, Machine>,
}

#[tonic::async_trait]
impl ChopSuey for ChopSueyService {
    async fn list_machines(
        &self,
        request: Request<ListMachinesRequest>,
    ) -> Result<Response<ListMachinesReply>, Status> {
        info!("recieved ListMachines RPC call from {:?}", request.local_addr());
        let response = ListMachinesReply {
            machines: self
                .machines
                .keys()
                .map(|k| ProtoMachine {
                    identifier: k.to_string(),
                })
                .collect(),
        };

        Ok(Response::new(response))
    }

    async fn wake_up(
        &self,
        request: Request<WakeUpRequest>,
    ) -> Result<Response<WakeUpReply>, Status> {
        info!("recieved WakeUp RPC call from {:?}", request.local_addr());
        let machine_id = &request
            .get_ref()
            .machine
            .as_ref()
            .ok_or_else(|| Status::invalid_argument("Machine to be waken up not specified"))?
            .identifier;

        let machine = self.machines.get(machine_id).ok_or_else(|| {
            Status::invalid_argument("Machine with this identifier does not exist")
        })?;

        let _ = machine.wake_up().await;

        Ok(Response::new(WakeUpReply {}))
    }
}

#[derive(Debug, Deserialize)]
pub struct ServerSettings {
    address: SocketAddr,
}

pub struct Server {
    machines: HashMap<String, Machine>,
}

impl Server {
    pub fn for_machines(machines: HashMap<String, Machine>) -> Server {
        Server { machines }
    }

    pub async fn serve(self, settings: &ServerSettings) -> Result<(), Whatever> {
        let service = ChopSueyService {
            machines: self.machines,
        };
        
        info!("starting gRPC server at {}...", settings.address);
        TonicServer::builder()
            .add_service(ChopSueyServer::new(service))
            .serve(settings.address)
            .await
            .with_whatever_context(|err| format!("Error serving tonic: {:?}", err))?;
        Ok(())
    }
}
