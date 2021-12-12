#!/bin/sh
set -e

chown -R 1001:1001 /data
echo starting container with command:
echo "$@"
echo
exec su-exec ganache "$@"