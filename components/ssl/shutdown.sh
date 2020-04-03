#!/usr/bin/env sh


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove certificates for $domain"

    rm $COMPONENTS_PATH/ssl/certificates/${domain}.key
    rm $COMPONENTS_PATH/ssl/certificates/${domain}.crt

done
