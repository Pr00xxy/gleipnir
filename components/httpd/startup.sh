#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "Creating vhost for $1"
    envsubst < $COMPONENTS_PATH/httpd/domain.conf.dist > $COMPONENTS_PATH/httpd/sites/${1}.conf
}

function append_certificate_instructions() {
    echo "Append certificate for $1"
    sed -i "s:NEEDLE_CRT:ssl_certificate     /etc/nginx/certificates/${1}.crt;:g" $COMPONENTS_PATH/httpd/sites/${1}.conf
    sed -i "s:NEEDLE_KEY:ssl_certificate_key /etc/nginx/certificates/${1}.key;:g" $COMPONENTS_PATH/httpd/sites/${1}.conf
}


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}
    code=${array[1]}
    scope=${array[2]}

    assemble_site_configuration $domain

    sed -i "s:NEEDLE_DOMAIN:$domain:g" $COMPONENTS_PATH/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_CODE:$code:g" $COMPONENTS_PATH/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_SCOPE:$scope:g" $COMPONENTS_PATH/httpd/sites/$domain.conf

    append_certificate_instructions $domain

done
