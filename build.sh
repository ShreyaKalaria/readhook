#!/bin/bash
docker build --no-cache -t redhook .

# Extract the library from the container
docker run -d --rm --name redhook redhook sleep 10
docker cp redhook:/root/redhook.so $PWD/redhook.so
docker kill redhook
