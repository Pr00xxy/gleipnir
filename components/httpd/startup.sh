#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "Creating vhost for $1"
    envsubst < ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/domain.conf.dist > ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/${1}.conf
}

function append_certificate_instructions() {
    echo "Append certificate for $1"
    sed -i "s:NEEDLE_CRT:ssl_certificate     /etc/nginx/certificates/${1}.crt;:g" ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/${1}.conf
    sed -i "s:NEEDLE_KEY:ssl_certificate_key /etc/nginx/certificates/${1}.key;:g" ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/${1}.conf
}


for config in ${MULTISITE[@]} ; do

    IFS=':' read -r -a array <<< "$config"

    domain=${array[0]}
    code=${array[1]}
    scope=${array[2]}

    assemble_site_configuration $domain

    sed -i "s:NEEDLE_DOMAIN:$domain:g" ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_CODE:$code:g" ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/$domain.conf
    sed -i "s:NEEDLE_SCOPE:$scope:g" ${PROJECTPATH}/vendor/prooxxy/gleipnir/components/httpd/sites/$domain.conf

    append_certificate_instructions $domain

done
