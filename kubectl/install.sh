#!/bin/sh
dir=`dirname "$0"`

# Install executable
install -v $dir/kubectl.sh /usr/bin/kubectl

# Add completion
target=/etc/bash_completion.d/kubectl
kubectl completion bash > $target
echo "Added completion to $target."
