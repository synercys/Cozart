#!/bin/bash
itr=1
reqcnt=5000

source benchmark-scripts/general-helper.sh
source benchmark-scripts/docker-helper.sh
mount_fs
randomd
enable_network
mark_start
rm -rf /run/docker* /var/run/docker*
docker_start
sleep 5;
docker system prune --all --force;
docker run -dit --name my-nginx-app -p 80:80 nginx:1.15
for i in `seq $itr`; do
    ab -n $reqcnt -c 100 127.0.0.1:80/index.html;
done
docker stop my-nginx-app
write_modules
mark_end
