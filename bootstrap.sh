sudo apt-get update
sudo apt-get -y install git
sudo apt-get -y install docker.io
source /etc/bash_completion.d/docker.io

git clone http://github.com/lawrencetaylor/DockerSamples.git
cd DockerSamples

ruby tocker.rb -c DockerFileConfigs/redis_on_ubuntu_14_10.json -t Redis
sudo docker build -t lawrencetaylor/redis Redis/

ruby tocker.rb -c DockerFileConfigs/mongo_on_ubuntu_14_10.json -t MongoDB
sudo docker build -t lawrencetaylor/mongo MongoDB/