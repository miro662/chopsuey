use std::{collections::HashMap, fs::File};

use serde_derive::Deserialize;
use snafu::{ResultExt, Whatever};

use crate::machine::Machine;

/// Describes configuration of chopsueyd
#[derive(Debug, Deserialize)]
pub struct Config {
    /// List of machines handled by this instance
    machines: HashMap<String, Machine>,
}

impl Config {
    pub fn load() -> Result<Config, Whatever> {
        let file = File::open("config.yml")
            .with_whatever_context(|_| "Cannot open config file".to_string())?;
        let config = serde_yaml::from_reader(file)
            .with_whatever_context(|err| format!("Config deserialization error: {:?}", err))?;
        Ok(config)
    }
}