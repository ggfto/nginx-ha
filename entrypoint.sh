#!/bin/sh
if [ ! -n "$DOMAIN" ] && [ ! -n "$HA_ADDRESS" ]; then
    echo "DOMAIN and/or HA_ADDRESS not set..."
    echo "This will not work!"
else
    sed "s|HA_ADDRESS_HERE|$HA_ADDRESS|g" /etc/nginx/conf.d/ha.conf >> /etc/nginx/conf.d/ha1.conf
    sed "s|YOUR_DOMAIN_HERE|$DOMAIN|g" /etc/nginx/conf.d/ha1.conf >> /etc/nginx/conf.d/default.conf
    rm /etc/nginx/conf.d/ha.conf
    rm /etc/nginx/conf.d/ha1.conf
fi
exec nginx -g "daemon off;"
