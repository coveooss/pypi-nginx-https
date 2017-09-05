#!/bin/bash

set -e

sed -i "s/SERVERNAME/${SERVERNAME}/g" /etc/nginx/sites-available/pypi.conf

if [ ! -f /certs/$SERVERNAME.crt ]; then
    openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /certs/$SERVERNAME.key -out /certs/$SERVERNAME.crt -subj "/C=CA/ST=Quebec/L=Quebec/O=TestCorp/CN=$SERVERNAME"
fi

exec "$@"
