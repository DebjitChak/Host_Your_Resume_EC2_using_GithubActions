#!/bin/bash
old_tag="v1.0"
new_tag="v1.0"
old_image="568245924140.dkr.ecr.us-west-2.amazonaws.com/devops-repo-dc:${old_tag}"
new_image="568245924140.dkr.ecr.us-west-2.amazonaws.com/devops-repo-dc:${new_tag}"
docker_image=$(sudo docker ps | grep -i ${old_image})
if [[ $? != 0 ]]
then
docker run -d -p 80:80 $old_image
else
docker stop $docker_image
docker rm $(docker ps -qa)
docker run -d -p 80:80 $new_image
fi
