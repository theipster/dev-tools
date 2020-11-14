#!/bin/sh
MSYS_NO_PATHCONV=1 docker run \
    --init \
    --rm \
    --volume $(pwd):/home/serverless/workspace \
    --workdir /home/serverless/workspace \
    theipster/serverless:latest "$@"
