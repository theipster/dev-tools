#!/bin/sh
MSYS_NO_PATHCONV=1 docker run \
    --env KUBECONFIG \
    --init \
    --rm \
    --volume "$HOME/.kube/config":/home/kubectl/.kube/config \
    theipster/kubectl:latest "$@"
