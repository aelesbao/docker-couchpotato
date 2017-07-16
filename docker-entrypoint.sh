#!/bin/ash
set -e

if [ "$1" = 'CouchPotato.py' -a "$(id -u)" = '0' ]; then
    chown -R couchpotato:couchpotato /opt/couchpotato
    exec su-exec couchpotato "$@"
fi

exec "$@"
