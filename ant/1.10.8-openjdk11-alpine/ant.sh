#!/bin/sh
docker run \
    --init \
    --rm \
    --volume "$(pwd)":/ant \
    theipster/ant:1.10.8-openjdk11-alpine "$@"
