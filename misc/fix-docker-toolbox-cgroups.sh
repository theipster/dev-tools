#!/bin/sh
machine=`docker-machine active`

# See https://github.com/docker/toolbox/issues/816
docker-machine ssh $machine -- "sudo mkdir /sys/fs/cgroup/systemd -v"
docker-machine ssh $machine -- "sudo mount -t cgroup -o none,name=systemd cgroup /sys/fs/cgroup/systemd -v"
