#!/usr/bin/env sh

function create_tls() {
  echo "Generating SSL cert for $1"

  path=$VAR_PATH/ssl/certificates/

    if [ ! -d $path ]; then
        mkdir -p $path/
    fi

  openssl req -newkey rsa:2048 -nodes \
    -keyout $VAR_PATH/ssl/certificates/${1}.key -x509 -days 365 \
    -out $VAR_PATH/ssl/certificates/${1}.crt \
    -subj "/C=SE/ST=Stockholm/L=Stockholm/O=Company/OU=Development/CN=${1}.test"
}

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"
    domain=${array[0]}

    create_tls $domain

done
