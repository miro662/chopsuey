/// Machine management
use std::net::IpAddr;

use serde_derive::Deserialize;

use crate::wol::MagicPacket;

#[derive(Debug, Deserialize)]
pub struct MacAddr([u8; 6]);

/// Describes a single machine that can be woken up
#[derive(Debug, Deserialize)]
pub struct Machine {
    /// MAC address
    mac: MacAddr,

    /// Broadcast IP address of a network this machine belongs to
    broadcast_ip: IpAddr,
}

impl Machine {
    /// Wakes up machine
    pub async fn wake_up(&self) -> Result<(), std::io::Error> {
        MagicPacket::new(&self.mac.0, &self.broadcast_ip)
            .send()
            .await?;
        Ok(())
    }
}
