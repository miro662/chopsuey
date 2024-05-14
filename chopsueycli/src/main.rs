use clap::{Parser, Subcommand};
use chopsuey::{chop_suey_client::ChopSueyClient, ListMachinesRequest};

mod chopsuey {
    tonic::include_proto!("chopsuey");
}

#[derive(Parser, Debug)]
#[command(version, about, long_about = None)]
struct Cli {
    #[arg(short, long, value_name = "ADDR")]
    server: String,

    #[command(subcommand)]
    command: CliCommand
}

#[derive(Subcommand, Debug)]

enum CliCommand {
    List
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn std::error::Error>> {
    let cli = Cli::parse();
    let mut client = ChopSueyClient::connect(cli.server.clone()).await?;
    
    match cli.command {
        CliCommand::List => {
            let response = client.list_machines(ListMachinesRequest {}).await?;
            let machine_names: Vec<_> = response.get_ref().machines.iter().map(|m| m.identifier.clone()).collect();
            println!("{}", machine_names.join("\n"));
        }
    }

    Ok(())
}
