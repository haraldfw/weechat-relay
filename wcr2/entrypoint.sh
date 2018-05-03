#!/bin/bash

set -e

if [ ! -f /weechat/.weechat/ssl/relay.pem ]
then
	echo "Creating self-signed certificate. This may take a while..."
	mkdir -p /weechat/.weechat/ssl/ && \
	openssl req -x509 -nodes -newkey rsa:2048 -keyout /weechat/.weechat/ssl/relay.pem \
        -subj "/O=weechat/CN=weechat" \
        -config <(cat /etc/ssl/openssl.cnf <(printf "\n[v3_ca]\nsubjectAltName = @alternate_names\n[alternate_names]\nIP.1 = \${ENV::IP}")) \
        -days 365 -out /weechat/.weechat/ssl/relay.pem
fi

exec "$@"