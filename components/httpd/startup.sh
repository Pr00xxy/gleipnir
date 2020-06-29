#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "Creating httpd vhost for $1"
    envsubst < $COMPONENTS_PATH/httpd/domain.conf.dist > $COMPONENTS_PATH/httpd/sites/${1}.conf
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

done
