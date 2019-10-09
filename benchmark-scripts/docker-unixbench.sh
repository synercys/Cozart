#!/bin/bash
itr=1
reqcnt=5000

source benchmark-scripts/general-helper.sh
source benchmark-scripts/docker-helper.sh
bootstrap;
mark_start
docker_start
sleep 5;
docker container prune --force
docker run -it --name my-unixbench-app tutum/unixbench;
write_modules
mark_end

