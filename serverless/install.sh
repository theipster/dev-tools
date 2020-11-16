#!/bin/sh
IMAGE=theipster/serverless
if [ -z $TAG ]; then
    TAG=`curl -L --silent https://api.github.com/repos/serverless/serverless/releases/latest 2>&1 | grep 'tag_name' | grep -oE "[0-9]+\.[0-9]+\.[0-9]+"`
fi

dir=`dirname "$0"`

# Build
cat $dir/Dockerfile | docker build --build-arg TAG=$TAG -t $IMAGE:latest -t $IMAGE:$TAG -

# Install
install -v $dir/run.sh /usr/bin/serverless
