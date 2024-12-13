#!/bin/bash

echo "Starting ssh-server"
service ssh start

cp -r /server/* /app_data 

tail -f /dev/null
