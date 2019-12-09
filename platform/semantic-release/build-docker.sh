#!/bin/bash
# create docker image of semantic-release
# with gradle support - write gradle.properties version=
#
DOCKER_GROUP="jghamburg"
BUILD_VERSION="1.0.0"
APP_NAME="git-semantic-release"

echo "Current build version: ${BUILD_VERSION} ..."
docker build --no-cache=true --pull=true -t ${DOCKER_GROUP}/${APP_NAME}:${BUILD_VERSION} .
docker tag  ${DOCKER_GROUP}/${APP_NAME}:${BUILD_VERSION} ${DOCKER_GROUP}/${APP_NAME}:latest
docker push ${DOCKER_GROUP}/${APP_NAME}:${BUILD_VERSION}
docker push ${DOCKER_GROUP}/${APP_NAME}:latest

echo "The End"