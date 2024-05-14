mod wol;

use std::{fs::File, net::IpAddr};

use serde_derive::Deserialize;
use snafu::{ResultExt, Whatever};
use wol::MagicPacket;

#[derive(Deserialize)]
struct Machine {
    /// MAC address
    mac: [u8; 6],

    /// Broadcast IP address of a network this machine belongs to
    broadcast_ip: IpAddr,
}

impl Machine {
    async fn wake_up(&self) -> Result<(), std::io::Error> {
        MagicPacket::new(&self.mac, &self.broadcast_ip)
            .send()
            .await?;
        Ok(())
    }
}

fn load_config() -> Result<Machine, Whatever> {
    let file = File::open("config.yml")
        .with_whatever_context(|_| "Cannot open config file".to_string())?;
    let config = serde_yaml::from_reader(file)
        .with_whatever_context(|err| format!("Config deserialization error: {:?}", err))?;
    Ok(config)
}

#[tokio::main]
async fn main() -> Result<(), Whatever> {
    let machine = load_config()?;
    machine
        .wake_up()
        .await
        .with_whatever_context(|_| "Cannot wake up defined machine".to_string())?;
    Ok(())
}
