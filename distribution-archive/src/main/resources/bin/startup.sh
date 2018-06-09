#!/bin/bash

source $(dirname "$0")/setenv.sh

docker-compose -f "$COMPOSE_FILE" down
docker-compose -f "$COMPOSE_FILE" up -d
