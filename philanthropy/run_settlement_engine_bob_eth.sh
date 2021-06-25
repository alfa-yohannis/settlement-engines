# BOB ETH
export RUST_LOG=interledger=debug

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 0cf64d77c19c598bd2151dc0e6f4464955f7a682021cbf26e95afc3eaefd373c \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://127.0.0.1:7545 \
  --connector_url http://127.0.0.1:8771 \
  --redis_url redis://127.0.0.1:6379/1 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3001 \
  --watch_incoming


  

