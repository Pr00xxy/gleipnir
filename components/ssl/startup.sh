#!/usr/bin/env sh

function create_tls() {
  echo "create_tls"
  openssl req -newkey rsa:2048 -nodes \
    -keyout ${PROJECTPATH}/gleipnir/ssl/${PROJECT_NAME}.key -x509 -days 365 \
    -out ${PROJECTPATH}/gleipnir/ssl/${PROJECT_NAME}.crt \
    -subj "/C=SE/ST=Stockholm/L=Stockholm/O=Company/OU=Development/CN=${FQDN}"
}

create_tls
