#!bin/bash

curl -sSL https://get.docker.com/ | sh

sudo usermod -aG docker ubuntu
echo added user to docker group

sudo apt-get update -y
sudo apt-get install git -y
sudo apt-get install build-essential -y

cd /home/ubuntu
git clone  https://github.com/skypeter1/FlaskServiceTerraform.git
cd FlaskServiceTerraform
make docker-run
