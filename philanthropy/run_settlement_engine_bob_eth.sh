# BOB
export RUST_LOG=interledger=trace

cargo run --bin ilp-settlement-ethereum -- \
  --private_key 5714ad5f65fb27cb0d0ab914db9252dfe24cf33038a181555a7efc3dcf863ab3 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://192.168.0.23:8545 \
  --connector_url http://127.0.0.1:6771 \
  --redis_url redis://127.0.0.1:6379/7 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3004 \
  --watch_incoming \
  --contract_address 0x427F8156eD910bF2C5F253d089785d29FE3673F4
