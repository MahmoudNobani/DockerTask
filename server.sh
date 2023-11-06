#!/bin/bash



docker build -t apache-server .
docker run -d --name apache-server -p 8899:80 apache-server
