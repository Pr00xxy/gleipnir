#!/usr/bin/env sh

for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove vhost for $domain"

    rm ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/${domain}.conf

done
