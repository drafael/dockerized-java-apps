#!/bin/bash

source $(dirname "$0")/setenv.sh

echo ""
docker-compose -f "$BASE_DIR/docker-compose.yml" ps

echo ""
docker-compose -f "$BASE_DIR/docker-compose.yml" top