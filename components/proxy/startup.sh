#!/usr/bin/env sh

function assemble_proxy_site_configuration() {
    echo "Creating proxy vhost for $1"
    if [ $USE_VARNISH -eq 1 ]; then
        envsubst < $COMPONENTS_PATH/proxy/varnish.conf.dist > $COMPONENTS_PATH/proxy/sites/${1}.conf
    else
        envsubst < $COMPONENTS_PATH/proxy/httpd.conf.dist > $COMPONENTS_PATH/proxy/sites/${1}.conf
    fi
    
}

function append_proxy_certificate_instructions() {
    echo "Append certificate for $1"
    sed -i "s:NEEDLE_CRT:ssl_certificate     /etc/nginx/certificates/${1}.crt;:g" $COMPONENTS_PATH/proxy/sites/${1}.conf
    sed -i "s:NEEDLE_KEY:ssl_certificate_key /etc/nginx/certificates/${1}.key;:g" $COMPONENTS_PATH/proxy/sites/${1}.conf
}

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    assemble_proxy_site_configuration $domain

    sed -i "s:NEEDLE_DOMAIN:$domain:g" $COMPONENTS_PATH/proxy/sites/$domain.conf

    append_proxy_certificate_instructions $domain

done