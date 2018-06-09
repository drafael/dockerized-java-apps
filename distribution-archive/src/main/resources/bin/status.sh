#!/bin/bash

source $(dirname "$0")/setenv.sh

echo ""
docker-compose -f "$COMPOSE_FILE" ps

echo ""
docker-compose -f "$COMPOSE_FILE" top