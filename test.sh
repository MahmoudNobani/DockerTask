#!/bin/bash

container_name="apache-server"

docker exec "$container_name" /bin/bash -c '
if yum info httpd &>/dev/null; then
    echo "true"
else
    echo "false2"
fi
'
