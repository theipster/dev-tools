#!/bin/sh
dir=`dirname "$0"`

# Build docker image
. $dir/build.sh

# Install docker run
install -v $dir/ant.sh /usr/bin/ant
