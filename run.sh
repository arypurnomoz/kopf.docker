#!/bin/bash

if [ "$KOPF_CONFIG" ]; then 
  echo "$KOPF_CONFIG" > /kopf/kopf_external_settings.json
fi

if [ -f "/config/kopf_external_settings.json" ]; then
  mv -f /config/kopf_external_settings.json /kopf/kopf_external_settings.json
fi


exec run.sh
