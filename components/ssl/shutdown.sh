#!/usr/bin/env sh


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}

    echo "Remove certificates for $domain"

    rm ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/ssl/certificates/${domain}.key
    rm ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/ssl/certificates/${domain}.crt

done
