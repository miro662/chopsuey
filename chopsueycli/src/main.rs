use std::process::exit;

use chopsuey::{chop_suey_client::ChopSueyClient, ListMachinesRequest, Machine, WakeUpRequest};
use clap::{Parser, Subcommand};

mod chopsuey {
    tonic::include_proto!("chopsuey");
}

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Cli {
    #[arg(short, long, value_name = "ADDR")]
    server: String,

    #[command(subcommand)]
    command: CliCommand,
}

#[derive(Subcommand, Debug)]

enum CliCommand {
    List,
    WakeUp { machine_id: String },
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let cli = Cli::parse();
    let mut client = ChopSueyClient::connect(cli.server.clone()).await?;

    match cli.command {
        CliCommand::List => {
            let response = client.list_machines(ListMachinesRequest {}).await?;
            let machine_names: Vec<_> = response
                .get_ref()
                .machines
                .iter()
                .map(|m| m.identifier.clone())
                .collect();
            println!("{}", machine_names.join("\n"));
        }
        CliCommand::WakeUp { machine_id } => {
            let response = client
                .wake_up(WakeUpRequest {
                    machine: Some(Machine {
                        identifier: machine_id,
                    }),
                })
                .await;

            if let Err(error) = response {
                eprintln!("{}", error.message());
                exit(1);
            }
        }
    };

    Ok(())
}
