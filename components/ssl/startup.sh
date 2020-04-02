#!/usr/bin/env sh

function create_tls() {
  echo "Generating SSL cert for $1"
  openssl req -newkey rsa:2048 -nodes \
    -keyout ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/ssl/certificates/${1}.key -x509 -days 365 \
    -out ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/ssl/certificates/${1}.crt \
    -subj "/C=SE/ST=Stockholm/L=Stockholm/O=Company/OU=Development/CN=${1}.test"
}

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"
    domain=${array[0]}

    create_tls $domain

done
