#!/bin/sh
dir=`dirname "$0"`

install -v "$dir/deploy-function.sh" /usr/bin/serverless-deploy-function
