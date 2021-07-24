# BOB
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 07ec3f8e15ec6aefa2c296dc3e6ea0ff43af80ba80700a3f99e7d29eb3e7d870 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://127.0.0.1:8545 \
  --connector_url http://127.0.0.1:6771 \
  --redis_url redis://127.0.0.1:6379/7 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3004 \
  --watch_incoming \
  --contract_address 0xe4d826F5083da2ce8995E326d319682CF598D481
