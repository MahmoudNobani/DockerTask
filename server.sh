#!/bin/bash
sudo docker build -t apache-server .
sudo docker run -d --name apache-server -p 8899:80 apache-server
#sudo docker run -d --name apache-server --network myN --ip 172.18.0.2 -p 8899:80 apache-server
