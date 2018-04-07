#!/bin/bash

source $(dirname "$0")/setenv.sh

docker-compose -f "$BASE_DIR/docker-compose.yml" down