#!bin/bash

curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker ubuntu
echo added user to docker group

sudo apt-get update -y
sudo apt-get install git -y

# cd /home/ubuntu
# git clone  
# sudo make docker-run
