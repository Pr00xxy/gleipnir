#!/usr/bin/env sh

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove httpd vhost for $domain"

    rm $COMPONENTS_PATH/httpd/sites/${domain}.conf

done
