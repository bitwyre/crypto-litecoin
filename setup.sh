#!/bin/sh

set -e

if [ -e "/litecoin/litecoin.conf" ]; then
    exit 0
fi

if [ -z ${TESTNET:+x} ]; then
    echo "testnet=1" >> "/litecoin/litecoin.conf"
fi

if [ -z ${ENABLE_WALLET:+x} ]; then
    echo "disablewallet=1" >> "/litecoin/litecoin.conf"
fi

if [ ! -z ${PRUNE:+x} ]; then
    echo "prune=${PRUNE}" >> "/litecoin/litecoin.conf"
fi

if [ ! -z ${MAX_CONNECTIONS:+x} ]; then
    echo "maxconnections=${MAX_CONNECTIONS}" >> "/litecoin/litecoin.conf"
fi

if [ ! -z ${RPC_SERVER:+x} ]; then
    RPC_USER=${RPC_USER:-litecoinrpc}
    RPC_PASSWORD=${RPC_PASSWORD:-$(dd if=/dev/urandom bs=20 count=1 2>/dev/null | base64)}

    echo "server=1" >> "/litecoin/litecoin.conf"
    echo "rpcuser=${RPC_USER}" >> "/litecoin/litecoin.conf"
    echo "rpcpassword=${RPC_PASSWORD}" >> "/litecoin/litecoin.conf"
fi;
