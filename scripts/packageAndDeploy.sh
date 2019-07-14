#!/usr/bin/env bash

set -e

VERSION=V$1
GIT_SHA=$(git rev-parse HEAD)
IMAGE_NAME=wx-cruise-control

./gradlew compileScala jar copyDependantLibs

docker build -t $IMAGE_NAME:$VERSION .
docker tag $IMAGE_NAME:$VERSION 494665118910.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME:$VERSION
docker push 494665118910.dkr.ecr.us-east-1.amazonaws.com/$IMAGE_NAME:$VERSION