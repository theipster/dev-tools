#!/bin/sh
IMAGE=theipster/serverless

dir=`dirname "$0"`

# Build
cat $dir/Dockerfile | docker build -t $IMAGE:latest -

# Install
install -v $dir/run.sh /usr/bin/serverless
