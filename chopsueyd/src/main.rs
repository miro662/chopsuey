mod config;
mod machine;
mod server;
mod wol;

use snafu::Whatever;

use crate::{config::Config, server::Server};

#[tokio::main]
async fn main() -> Result<(), Whatever> {
    let config = Config::load()?;
    let server = Server::for_machines(config.machines().clone());
    server.serve(config.server()).await
}
