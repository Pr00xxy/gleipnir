#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "Creating httpd vhost for $1"

    path=$VAR_PATH/httpd/sites/

    if [ ! -d $path ]; then
        mkdir -p $path/
    fi

    envsubst < $COMPONENTS_PATH/httpd/domain.conf.dist > $path/${1}.conf
}

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}
    code=${array[1]}
    scope=${array[2]}

    assemble_site_configuration $domain

    sed -i "s:NEEDLE_DOMAIN:$domain:g" $VAR_PATH/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_CODE:$code:g" $VAR_PATH/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_SCOPE:$scope:g" $VAR_PATH/httpd/sites/$domain.conf

done
