#!/usr/bin/env sh

function assemble_site_configuration() {
    echo "assemble_site_configuration"
    envsubst < ./gleipnir/httpd/domain.conf.dist > ./gleipnir/httpd/${PROJECT_NAME}.conf
}


function append_certificate_instructions() {
    echo "append_certificate_instructions"
    sed -i "s:NEEDLE_CRT:ssl_certificate     /etc/nginx/${PROJECT_NAME}.crt;:g" ./gleipnir/httpd/${PROJECT_NAME}.conf
    sed -i "s:NEEDLE_KEY:ssl_certificate_key /etc/nginx/${PROJECT_NAME}.key;:g" ./gleipnir/httpd/${PROJECT_NAME}.conf
}

assemble_site_configuration
append_certificate_instructions
