#!/bin/sh

# Get version
echo "Getting latest stable version..."
tag=`curl https://storage.googleapis.com/kubernetes-release/release/stable.txt`

# Download
echo "Downloading kubectl $tag..."
curl -LO http://storage.googleapis.com/kubernetes-release/release/$tag/bin/windows/amd64/kubectl.exe

# Install
install -v kubectl.exe /usr/bin/kubectl
rm kubectl.exe

# Add completion
target=/etc/bash_completion.d/kubectl
kubectl completion bash > $target
echo "Added completion to $target."
