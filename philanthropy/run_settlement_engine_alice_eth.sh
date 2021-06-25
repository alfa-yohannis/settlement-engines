# ALICE
export RUST_LOG=interledger=debug

cargo run --bin ilp-settlement-ethereum -- \
  --private_key e9c10413ba16e0d4dfad33a820f0a09fceca96b3e181a0db417a32bd2a55d8a1 \
  --confirmations 0 \
  --poll_frequency 1000 \
  --ethereum_url http://127.0.0.1:7545 \
  --connector_url http://127.0.0.1:7771 \
  --redis_url redis://127.0.0.1:6379/0 \
  --asset_scale 18 \
  --settlement_api_bind_address 127.0.0.1:3000 \
  --watch_incoming \
  --contract_address 0x50Dd787a2768E0a5cbB057b94ee1cfEAf84556E5
