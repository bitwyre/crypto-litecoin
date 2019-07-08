# Bitwyre's Litecoin Container

[![Docker Stars](https://img.shields.io/docker/stars/bitwyre/crypto-litecoin.svg)](https://hub.docker.com/r/bitwyre/crypto-litecoin/)
[![Docker Pulls](https://img.shields.io/docker/pulls/bitwyre/crypto-litecoin.svg)](https://hub.docker.com/r/bitwyre/crypto-litecoin/)
[![ImageLayers](https://images.microbadger.com/badges/image/bitwyre/crypto-litecoin.svg)](https://microbadger.com/images/bitwyre/crypto-litecoin)

Runs the Litecoin Core litecoind full-node in a container.

## Use Environment Variables to Configure Litecoind

If there is no `litecoin.conf` file in (`/litecoin`), a new `litecoin.conf` will be created based on the Environment Variables supplied to the container.

By default, wallet is disabled and litecoind runs on testnet.

The following variables are configureable:

- `TESTNET`: Defaults to `1`, which will run `litecoind` on `testnet`. Set to `0` to run on `mainnet`.
- `ENABLE_WALLET`: Defaults to `0`, set to `1` to enable the wallet and the `litecoind` daemon will create one.
- `GEN`: Defaults to `0`, set to `1` to attempt to generate litecoins (mining).
- `PRUNE`: Defaults to `0`. Reduce storage requirements by enabling pruning (deleting) of old blocks. Set to `1` to allow manual pruning via RPC. Set to an integer value to automatically prune block files to keep the stored block size under the specified value in MiB.
- `MAX_CONNECTIONS`: When set (should be an integer), it overrides the max connections value.
- `RPC_SERVER`: Defaults to `0`, set to `1` to enable the JSON RPC server on port 9332. If no `RPC_USER` is given, the user will be set to `litecoinrpc` and if no `RPC_PASSWORD` is given a random password will be generated.
On run, the configuration file will be printed by the container and the password can be read from the logs.
  - `RPC_USER`: Sets the username for the JSON RPC server.
  - `RPC_PASSWORD`: Sets the password for the JSON RPC server.
