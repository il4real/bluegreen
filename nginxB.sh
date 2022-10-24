#!/bin/bash
sudo apt update
sudo apt install nginx -y
echo "This is BLUE at $(hostname)" > /var/www/html/index.nginx-debian.html