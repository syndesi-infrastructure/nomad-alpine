#!/bin/sh

docker build -t nomad:local .
CONTAINER_ID=$(docker create nomad:local)
docker cp $CONTAINER_ID:/nomad/bin/nomad ./nomad
docker rm $CONTAINER_ID
