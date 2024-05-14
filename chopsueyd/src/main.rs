mod config;
mod machine;
mod wol;

use snafu::Whatever;

use crate::config::Config;

#[tokio::main]
async fn main() -> Result<(), Whatever> {
    let config = Config::load()?;
    println!("{:#?}", config);
    Ok(())
}
