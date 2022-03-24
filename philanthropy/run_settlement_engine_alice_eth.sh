# ALICE
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 5714ad5f65fb27cb0d0ab914db9252dfe24cf33038a181555a7efc3dcf863ab3 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.23:8545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0xf38B59a1a73d76de228baC9f63B9760e3b4fD0FD
