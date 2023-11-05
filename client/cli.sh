#!/bin/bash

container_name="client-server"

if sudo docker ps -a --format "{{.Names}}" | grep -q "$container_name"; then
    sudo docker stop "$container_name" && sudo docker rm "$container_name"
fi

sudo docker build -t client-server .
sudo docker run -d --name client-server -p 8890:80 client-server
