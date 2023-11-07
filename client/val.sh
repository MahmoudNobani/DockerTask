#!/bin/bash

container_name="client-server"

sudo docker exec "$container_name" /bin/bash -c '
if yum info httpd &>/dev/null; then
    if yum info httpd | grep -qi "From repo   : MAINerver"; then
        echo "true"
        exit 0
    else
        echo "false1"
        exit 1
    fi
else
    echo "false2"
    exit 2
fi
'


