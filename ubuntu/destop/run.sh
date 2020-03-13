#!/usr/bin/env bash

# 8084 http
# 8085 VNC
# 18.0.4 ubuntu

echo 'Start ubuntu desktop ...'

docker run --name ud -d -p 8084:80 -p 8085:5900 -e VNC_PASSWORD=vnc4best!!! -e HTTP_PASSWORD=http4best!!! -e RESOLUTION=1920x1080 -e USER=root -e PASSWORD=root4best!!!  -v /dev/shm:/dev/shm dorowu/ubuntu-desktop-lxde-vnc:bionic

echo 'Stared ubuntu desktop ...'

docker container stats ud
