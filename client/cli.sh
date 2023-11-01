#!/bin/bash
sudo docker build -t client-server .
#sudo docker run -d --name client-server --network myN --ip 172.18.0.3 -p 8890:80 client-server
sudo docker run -d --name client-server -p 8890:80 client-server
