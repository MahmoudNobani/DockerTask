#!/bin/bash

container_name="client-server"

sudo docker exec "$container_name" /bin/bash -c '
if yum info httpd &>/dev/null; then
    if yum info httpd | grep -qi "From repo   : MAINserver"; then
        echo "true"
    else
        echo "false1"
    fi
else
    echo "false2"
fi
'


