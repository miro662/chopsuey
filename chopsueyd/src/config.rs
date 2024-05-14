use std::{collections::HashMap, fs::File};

use log::info;
use serde::Deserialize;
use snafu::{ResultExt, Whatever};

use crate::{machine::Machine, server::ServerSettings};

/// Describes configuration of chopsueyd
#[derive(Debug, Deserialize)]
pub struct Config {
    /// Server settings
    server: ServerSettings,

    /// List of machines handled by this instance
    machines: HashMap<String, Machine>,
}

impl Config {
    pub fn load() -> Result<Config, Whatever> {
        let path = "config.yml";
        let file = File::open(path)
            .with_whatever_context(|_| "Cannot open config file".to_string())?;
        info!("using config file from {}", path);
        let config = serde_yaml::from_reader(file)
            .with_whatever_context(|err| format!("Config deserialization error: {:?}", err))?;
        Ok(config)
    }

    pub fn server(&self) -> &ServerSettings {
        &self.server
    }

    pub fn machines(&self) -> &HashMap<String, Machine> {
        &self.machines
    }
}
