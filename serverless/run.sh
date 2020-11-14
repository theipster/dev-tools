#!/bin/sh
MSYS_NO_PATHCONV=1 docker run \
    --init \
    --rm \
    theipster/serverless:latest "$@"
