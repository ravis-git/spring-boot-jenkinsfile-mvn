#!/usr/bin/env bash

set -e

# Export the active docker machine IP
# export DOCKER_IP=$(docker-machine ip $(docker-machine active))
#moved to MAC native docker app
export DOCKER_IP=0.0.0.0

# docker-machine doesn't exist in Linux, assign default ip if it's not set
DOCKER_IP=${DOCKER_IP:-0.0.0.0}

echo 'Docker Ip set to ' $DOCKER_IP

# Remove existing containers
docker-compose stop

docker-compose rm -f

# Start the other containers
docker-compose up -d

# Attach to the log output of the cluster
docker-compose logs -f