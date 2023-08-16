
use cosmwasm_schema::cw_serde;
use cosmwasm_std::{Addr, Uint128};
use cw721_base::Extension;
use cw_storage_plus::{Item, Map};

#[cw_serde]
pub struct Config{
    pub admin: Addr,
    pub extension: Extension,
    pub fee: Uint128,
    pub registeration_open: bool,
    pub next_reply_id: u64,
    pub denom: String,
}

pub const CONFIG: Item<Config> = Item::new("config");

#[cw_serde]
pub struct Collection {
    pub admin: Addr,
    pub cw721_address: Option<Addr>,
    pub name: String,
    pub symbol: String,
    pub supply: u32,
    pub token_uri: String,
    pub royalty_percent: u64,
    pub royalty_wallet: String,
    pub creator_wallet: String,
    pub next_token_id: u32,
    pub mint_groups: Vec<MintGroup>,
    pub extension: Extension,
    pub iterated_uri: bool,
    pub claimed:u64
}

#[cw_serde]
pub struct MintGroup {
    pub name: String,
    pub merkle_root: Option<Vec<u8>>,
    pub max_tokens: u32,
    pub unit_price: Uint128,
    pub start_time: u64,
    pub end_time: u64,
}

pub const COLLECTIONS: Map<String, Collection> = Map::new("collections");

#[cw_serde]
pub struct MintInfo {
    pub mints: Vec<u32>,
}

#[cw_serde]
pub struct MintInfoDetail {
    pub group_name:String,
    pub mints: Vec<u32>,
}

#[cw_serde]
pub struct MintInfoDetailResponse {
    pub mints: Vec<MintInfoDetail>
}

pub const MINT_INFO: Map<String, MintInfo> = Map::new("mint_info");

pub const MINT_LOG: Map<String, Addr> = Map::new("mint_log");

pub const INSTANTIATE_INFO: Map<u64, Collection> = Map::new("instantiate_info");