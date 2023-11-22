#! /bin/bash

docker build --progress=plain -t demo-app .

docker-compose up
 
