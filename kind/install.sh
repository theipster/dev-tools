#!/bin/sh
TAG=${TAG:-v0.7.0}
IMAGE=theipster/kind

dir=`dirname "$0"`

# Build image
cat $dir/Dockerfile | docker build --build-arg TAG=$TAG -t $IMAGE:$TAG -t $IMAGE:latest -

# Install executable
install -v $dir/kind.sh /usr/bin/kind
