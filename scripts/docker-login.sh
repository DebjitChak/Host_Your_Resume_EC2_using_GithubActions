#!/bin/bash
sudo -i
aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 568245924140.dkr.ecr.us-west-2.amazonaws.com