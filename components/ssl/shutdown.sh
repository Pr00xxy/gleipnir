#!/usr/bin/env sh


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove certificates for $domain"

    rm ./gleipnir/ssl/certificates/${domain}.key
    rm ./gleipnir/ssl/certificates/${domain}.crt

done
