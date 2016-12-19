#!/bin/bash
#
# just a simple script if you throw this in the folder of the docker image you want to build it just does a local build

NAME=$1
DOCKER_TAG=$2

ORG=uberguru
DOCKER_IMAGE=$NAME

echo "Enter dockerhub credentials"
echo "---------------------------"

echo -n Username:
read USERNAME

echo -n Password:
read -s PASSWORD

# Set these environment variables
${DOCKER_TAG:="latest"}
DOCKER_USER=$USERNAME
DOCKER_AUTH=$PASSWORD

# Build image
docker build --tag="$ORG/$DOCKER_IMAGE:$DOCKER_TAG" .
docker login -u $DOCKER_USER -p $DOCKER_AUTH 
docker push $ORG/$DOCKER_IMAGE:$DOCKER_TAG
docker tag $ORG/$DOCKER_IMAGE:$DOCKER_TAG $ORG/$DOCKER_IMAGE:$DOCKER_TAG
docker push $ORG/$DOCKER_IMAGE:$DOCKER_TAG
