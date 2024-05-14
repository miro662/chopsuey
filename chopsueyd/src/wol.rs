/// Facilities for sending Wake-on-lAN message
use std::net::IpAddr;

use bytes::{BufMut, Bytes, BytesMut};
use tokio::net::UdpSocket;

/// Describes a magic packet to be sent
pub struct MagicPacket {
    mac: Bytes,
    ip: IpAddr,
    port: u16,
}

impl MagicPacket {
    /// Creates a magic packet to be sent to a given MAC address
    ///
    /// Uses port 0
    pub fn new(mac: &[u8; 6], ip: &IpAddr) -> MagicPacket {
        MagicPacket {
            mac: Bytes::copy_from_slice(mac),
            ip: *ip,
            port: 0,
        }
    }

    /// Sends this magic packet via given UDP socket
    pub async fn send(&self) -> Result<(), std::io::Error> {
        let socket = UdpSocket::bind("0.0.0.0:0").await?;
        socket.set_broadcast(true)?;
        let bytes = self.bytes();
        socket.send_to(&bytes, (self.ip, self.port)).await?;
        Ok(())
    }

    fn bytes(&self) -> Bytes {
        let mut bytes = BytesMut::with_capacity(102);
        bytes.put_bytes(0xFF, 6); // header
        for _ in 0..16 {
            bytes.put_slice(&self.mac);
        }
        debug_assert_eq!(102, bytes.len());
        bytes.into()
    }
}
