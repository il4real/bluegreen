#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "This is GREEN at $(hostname)" > /var/www/html/index.nginx-debian.html