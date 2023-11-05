#!/bin/bash

container_name="apache-server"
if sudo docker ps -a --format "{{.Names}}" | grep -q "$container_name"; then
    sudo docker stop "$container_name" && sudo docker rm "$container_name"
fi

sudo docker build -t apache-server .
sudo docker run -d --name apache-server -p 8899:80 apache-server
