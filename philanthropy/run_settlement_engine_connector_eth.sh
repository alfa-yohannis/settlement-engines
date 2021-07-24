# CONNECTOR ETH
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key eeed5b1fc503bd2d9ea7cd2098794bcd4ee9c2f3a07ccab3401a263e02c36f71 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://127.0.0.1:8545 \
  --connector_url http://127.0.0.1:8771 \
  --redis_url redis://127.0.0.1:6379/1 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3001 \
  --watch_incoming


  

