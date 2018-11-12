#!/bin/sh

set -e

if [ "$(id -u)" = '0' ]; then       # current user is root
    exec su-exec nobody "$0" "$@"   # step-down from root
fi

exec "$@"
