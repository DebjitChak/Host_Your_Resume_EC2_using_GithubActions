#!/bin/bash
sudo yum install docker -y
sudo systemctl start docker.service
sudo systemctl enable docker.service