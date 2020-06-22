#!/bin/sh
dir=`dirname "$0"`

docker build \
    -f $dir/Dockerfile \
    -t theipster/ant:1.10.8-openjdk11-alpine \
    .
