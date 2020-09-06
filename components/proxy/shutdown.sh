#!/usr/bin/env sh

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove proxy vhost for $domain"

done

rm $COMPONENTS_PATH/proxy/sites/*.conf