#!/usr/bin/env bash

set -e

VERSION=V$1
GIT_SHA=$(git rev-parse HEAD)
IMAGE_NAME=wx-cruise-control

./gradlew jar

docker build --build-arg IMAGE_VERSION=$VERSION --build-arg GIT_SHA=$GIT_SHA -t $IMAGE_NAME:$VERSION .
docker tag -f $IMAGE_NAME:$VERSION 494665118910.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME:$VERSION
docker push 494665118910.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME:$VERSION