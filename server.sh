#!/bin/bash

container_name="apache-server"
if docker ps -a --format "{{.Names}}" | grep -q "$container_name"; then
    docker stop "$container_name" && sudo docker rm "$container_name"
fi

docker build -t apache-server .
docker run -d --name apache-server -p 8899:80 apache-server
