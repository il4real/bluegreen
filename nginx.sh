#!/bin/bash
sudo apt update
sudo apt install nginx -y
sudo hostname check1
echo "This is $(hostname)" > /var/www/html/index.nginx-debian.html