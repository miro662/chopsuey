mod config;
mod machine;
mod server;
mod wol;

use std::process::exit;

use log::{error, info};
use snafu::Whatever;

use crate::{config::Config, server::Server};

async fn run_server() -> Result<(), Whatever> {
    let config = Config::load()?;
    let server = Server::for_machines(config.machines().clone());
    server.serve(config.server()).await
}



#[tokio::main]
async fn main() {
    env_logger::init();
    info!("chopsueyd, version {}", env!("CARGO_PKG_VERSION"));

    match run_server().await {
        Ok(_) => {},
        Err(err) => {
            error!("{}", err);
            exit(1);
        }
    }
}
