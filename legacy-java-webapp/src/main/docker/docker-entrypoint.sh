#!/bin/sh

set -e

if [ "$(id -u)" = '0' ]; then                # current user is root
  chown -R tomcat:tomcat $CATALINA_HOME      # fix permissions
  exec su-exec tomcat "$0" "$@"              # step-down from root
fi

exec "$@"
