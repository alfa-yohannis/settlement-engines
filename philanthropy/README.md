# Interledger: Transfer Money directly to a Smart Contract (not ETH Account)

- [Interledger: Transfer Money directly to a Smart Contract (not ETH Account)](#interledger-transfer-money-directly-to-a-smart-contract-not-eth-account)
  - [Introduction](#introduction)
  - [Requirements](#requirements)
  - [Build](#build)
  - [Troubleshooting](#troubleshooting)

## Introduction
This is a modified version of the Interledger's Ethereum settlement engine. By design, Interledger is intended to send money from an account to another account, **not** from an account directly to a **smart contract**. This version is to allow such transfer, only by supplying the smart contract's address as a parameter.

In order to start running the settlement engine, it needs the private key of an Ethereum account. The engine then infers the private to obtain the account's address. This address is used to send and receive ETH. 

I have added some code that overrides the account's address with the smart contract's address. If there is a smart contract's address passed through the parameters,the account's address will be overridden. Therefore, every transfer to the account will go to the smart contract's address. If there is no smart contract's address supplied, the transfer will go to the account's address.  

Also, I have commented -- turned off -- some validation that checks if the current account's address is correct and tries to recover the real address. We did this, so that the account's address can be overridden by the smart contract's address.

To supply the contract's addresses, just add parameter:
```
--contract_address <contract-address>
```

An example complete command would be like the following code:
```
ilp-settlement-ethereum -- \
  --private_key e9c10413ba16e0d4dfad33a820f0a09fceca96b3e181a0db417a32bd2a55d8a1 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.2:7545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0x50Dd787a2768E0a5cbB057b94ee1cfEAf84556E5
```
## Requirements
1. **Redis Server**
   
   Follow the instructions [here](https://www.digitalocean.com/community/tutorials/how-to-install-and-secure-redis-on-ubuntu-20-04)or [here](https://redis.io/topics/quickstart) to install Redis Server. Run it using the following command:
   ```
   sudo systemctl start redis-server
   ```
   Or on Windows Subsystem Linux (WSL):
   ```
   redis-server
   ```
   Add `&` at the end of the command to run it on the background but sometimes this will require you to use the `kill` command to end the process later.  
2. **Ganache (ganache-cli or ganache-gui)**
   
   Install and run Ganache (either the `ganache-cli` or `ganache-gui`). The link is [here](https://www.trufflesuite.com/docs/ganache/quickstart). Make sure to set the RPC server to run at http://0.0.0.0:port, so that it is accessible from WSL. The default port of `ganache-cli` is `8545` and `ganache-gui` is 7545. Make sure to make some adjustment later when running the settlement egine later depending on the ganache versions you use.
   For example:
   ```
   ganache-cli --host 0.0.0.0 --port 7545
   ```
3. **Deploy your smart contract**
   
   Deploy your smart contract. Make sure your smart contract can receive ETH directly. Add the `receive() external payable` or `fallback() external payable` into your smart contract. Test it first.

## Build
Install Rust on your operating system using the instructions on the [Rust's website](https://www.rust-lang.org/tools/install).
```
gh repo clone alfa-yohannis/settlement-engines
```
Clone this repo to your local machine and go inside the directory.
```
cd settlement-engines
```
Install the following dependencies:
```
sudo apt install pkg-config libssl-dev
```
Build the code using the command below:
```
cargo build
```
Run the settlement engine using `cargo`:
```
export RUST_LOG=interledger=debug

cargo run --bin ilp-settlement-ethereum -- \
  --private_key e9c10413ba16e0d4dfad33a820f0a09fceca96b3e181a0db417a32bd2a55d8a1 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.2:7545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0x50Dd787a2768E0a5cbB057b94ee1cfEAf84556E5
```
Or directly using the target binary, without `cargo`:
```
export RUST_LOG=interledger=debug

./target/debug/ilp-settlement-ethereum \
  --private_key e9c10413ba16e0d4dfad33a820f0a09fceca96b3e181a0db417a32bd2a55d8a1 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.2:7545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0x50Dd787a2768E0a5cbB057b94ee1cfEAf84556E5
```
## Troubleshooting
1. The private key supplied above is the private of the first user generated by Ganache. You could replace it with the private key of the account that you are going to use.
2. Replace the contract address supplied above with the smart contract's address you are going to use.
3. Make sure all the ip addresses and ports are accessible from the client/requester, usually by using 0.0.0.0 or the real ip addresses, not 127.0.0.1 since it only works locally.
