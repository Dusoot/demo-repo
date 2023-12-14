#! /bin/bash

docker stop demo-repo-db-1 demo-repo-redis-1 demo-repo-demo-1
docker rm demo-repo-db-1 demo-repo-redis-1 demo-repo-demo-1

set -e

docker build -t demo-app .

docker-compose up
