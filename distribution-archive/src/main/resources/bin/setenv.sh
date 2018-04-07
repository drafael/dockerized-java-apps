#!/bin/bash

if [ "$(id -u)" == "0" ]; then
   echo "======================================================="
   echo "  This script must be run as normal user (not root)!" 1>&2
   echo "======================================================="
   exit 1
fi

BIN_DIR=$(dirname "$0")
export BASE_DIR=$(dirname "$BIN_DIR")

for env_file in "$BASE_DIR"/env.d/*; do
  export $(cat "$env_file")
done

if [[ "$OSTYPE" =~ linux ]]; then
  export HOST_UID=$(id -u)
  export HOST_GID=$(id -g)
fi

if [ ! -x "$(command -v docker-compose)" ]; then
  if [ ! -f "$BIN_DIR/docker-compose" ]; then
    curl -L https://github.com/docker/compose/releases/download/1.15.0/docker-compose-`uname -s`-`uname -m` > "$BIN_DIR/docker-compose"
    chmod +x "$BIN_DIR/docker-compose"
  fi
  export PATH="$PATH":"$BIN_DIR"
fi