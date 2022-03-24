# BOB ETH
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 07ec3f8e15ec6aefa2c296dc3e6ea0ff43af80ba80700a3f99e7d29eb3e7d870 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.23:8545 \
  --connector_url http://127.0.0.1:8771 \
  --redis_url redis://127.0.0.1:6379/1 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3001 \
  --watch_incoming


  

