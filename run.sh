#!/bin/bash

set -e

echo '{"elasticsearch_root_path": "/es"}' > /kopf/kopf_external_settings.json

if [ "$KOPF_CONFIG" ]; then 
  echo "$KOPF_CONFIG" > /kopf/kopf_external_settings.json
fi

if [ -f "/config/kopf_external_settings.json" ]; then
  mv -f /config/kopf_external_settings.json /kopf/kopf_external_settings.json
fi

envtpl /etc/nginx/nginx.conf.tpl

if [ ! -z "${KOPF_BASIC_AUTH_LOGIN}" ]; then
    echo "${KOPF_BASIC_AUTH_LOGIN}:${KOPF_BASIC_AUTH_PASSWORD}" > /etc/nginx/kopf.htpasswd
fi

exec nginx
