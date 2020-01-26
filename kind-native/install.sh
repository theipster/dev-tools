#!/bin/sh
TAG=${TAG:-v0.7.0}

# Download
curl -Lo /tmp/kind https://github.com/kubernetes-sigs/kind/releases/download/$TAG/kind-windows-amd64

# Install
install -v /tmp/kind /usr/bin/kind
rm /tmp/kind

# Add completion
target=/etc/bash_completion.d/kind
kind completion bash > $target
echo "Added completion to $target."
