#!/bin/sh
set -e

./home/scripts/setup.sh

echo "###############################################"
echo "# Configuration file: /litecoin/litecoin.conf #"
echo "###############################################"
echo ""
cat /litecoin/litecoin.conf
echo ""
echo "###############################################"

exec litecoind -datadir=/litecoin -conf=/litecoin/litecoin.conf -printtoconsole "$@"
