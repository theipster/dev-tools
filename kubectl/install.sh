#!/bin/sh
TAG=${TAG:-`curl https://storage.googleapis.com/kubernetes-release/release/stable.txt`}
IMAGE=theipster/kubectl

dir=`dirname "$0"`

build_image() {
    cat $dir/Dockerfile | docker build --build-arg TAG=$TAG -t $IMAGE:$TAG -t $IMAGE:latest -
}

do_install() {
    install -v $dir/kubectl.sh /usr/bin/kubectl
}

add_completion() {
    local target=/etc/bash_completion.d/kubectl
    kubectl completion bash > $target
    echo "Added completion to $target."
}

main() {
    build_image && do_install && add_completion
}

main
