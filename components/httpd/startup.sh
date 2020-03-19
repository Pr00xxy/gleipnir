#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "Creating vhost for $1"
    envsubst < ./gleipnir/httpd/domain.conf.dist > ./gleipnir/httpd/sites/${1}.conf
}

function append_certificate_instructions() {
    echo "Append certificate for $1"
    sed -i "s:NEEDLE_CRT:ssl_certificate     /etc/nginx/certificates/${1}.crt;:g" ./gleipnir/httpd/sites/${1}.conf
    sed -i "s:NEEDLE_KEY:ssl_certificate_key /etc/nginx/certificates/${1}.key;:g" ./gleipnir/httpd/sites/${1}.conf
}


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}
    code=${array[1]}
    scope=${array[2]}

    assemble_site_configuration $domain

    sed -i "s:NEEDLE_DOMAIN:$domain:g" ./gleipnir/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_CODE:$code:g" ./gleipnir/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_SCOPE:$scope:g" ./gleipnir/httpd/sites/$domain.conf

    append_certificate_instructions $domain

done
