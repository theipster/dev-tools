#!/bin/bash
VERSION=`docker version -f {{.Client.GitCommit}}`
TARGET=/etc/bash_completion.d/docker

add_completion() {
    curl https://raw.githubusercontent.com/docker/docker-ce/$VERSION/components/cli/contrib/completion/bash/docker -o $TARGET
    echo "Added completion to $TARGET."
}

add_completion
