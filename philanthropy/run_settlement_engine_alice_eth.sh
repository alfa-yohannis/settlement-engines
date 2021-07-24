# ALICE
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 4a2cb86c7d3663abebf7ab86a6ddc3900aee399750f35e65a44ecf843ec39116 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://127.0.0.1:8545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0x7B3e2b43f99237449574Fc161EF881FD3e2C7E24
