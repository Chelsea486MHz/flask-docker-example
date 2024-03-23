#!/bin/bash

# Checking for DOMAIN and EMAIL environment variables
if [ -z "$DOMAIN" ] || [ -z "$EMAIL" ]; then
    echo "Please set the DOMAIN and EMAIL environment variables"
    exit 1
fi

# Create the strongest DH parameter
echo "Generating strong DH parameters..."
openssl dhparam -out /certs/dhparam.pem 4096

# Requesting SSL certificates from Let's Encrypt using Certbot
echo "Obtaining Let's Encrypt certificates for $DOMAIN..."
certbot certonly --non-interactive --agree-tos --email $EMAIL --webroot -w /usr/share/nginx/html -d $DOMAIN

# Copying the obtained certificates to the volume mounted at /certs
cp /etc/letsencrypt/live/$DOMAIN/fullchain.pem /certs/fullchain.pem
cp /etc/letsencrypt/live/$DOMAIN/privkey.pem /certs/privkey.pem

echo "Certificates obtained successfully for $DOMAIN"