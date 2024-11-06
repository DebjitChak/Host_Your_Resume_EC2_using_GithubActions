#!/bin/bash
tag="v1.0"
sudo -i
docker run -d -p 80:80 568245924140.dkr.ecr.us-west-2.amazonaws.com/devops-repo-dc:${tag}