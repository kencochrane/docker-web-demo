#!/bin/bash

set -e

DOCKER_IMAGE_NAME="kencochrane/aws-demo"
DOCKER_CONTAINER_NAME="docker-demo-build-container"
TAG="latest"

if [[ $(docker ps -a | grep $DOCKER_CONTAINER_NAME) != "" ]]; then
  docker rm -f $DOCKER_CONTAINER_NAME 2>/dev/null
fi

docker build -t $DOCKER_IMAGE_NAME:$TAG -f Dockerfile.build .

docker run --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME:$TAG ./compile.sh

docker cp $DOCKER_CONTAINER_NAME:/go/bin/web bin/web

docker build -t $DOCKER_IMAGE_NAME:text -f Dockerfile.run .
