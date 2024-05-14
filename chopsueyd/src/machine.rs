/// Machine management
use std::net::IpAddr;

use log::trace;
use serde::Deserialize;

use crate::wol::MagicPacket;

#[derive(Clone, Debug, Deserialize)]
pub struct MacAddr([u8; 6]);

/// Describes a single machine that can be woken up
#[derive(Clone, Debug, Deserialize)]
pub struct Machine {
    /// MAC address
    mac: MacAddr,

    /// Broadcast IP address of a network this machine belongs to
    broadcast_ip: IpAddr,
}

impl Machine {
    /// Wakes up machine
    pub async fn wake_up(&self) -> Result<(), std::io::Error> {
        trace!("sending magic packet to {:?}", self);
        
        MagicPacket::new(&self.mac.0, &self.broadcast_ip)
            .send()
            .await?;
        Ok(())
    }
}
