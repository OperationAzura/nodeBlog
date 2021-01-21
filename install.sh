#! /bin/bash

apt-get update -y;
apt-get upgrade -y;
apt-get dist-upgrade -y;

##install mongoDB

#import gpg key
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -;

#create list file
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list;

#reload  package database
apt-get update -y;

#Install mongoDB
apt-get install mongodb-org -y;

#start mongod
systemctl enable mongod
systemctl start mongod
##node.js

#install mongoDB PPA for version 14.x
curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh;
bash nodesource_setup.sh;
apt install nodejs;


##install ftp server
apt install vsftpd;

##install golang
snap install go --classic;

##install pip for python 
apt-get python3-pip -y;

##install other packages for python
apt-get install build-essential libssl-dev libffi-dev python3-dev -y;

##install open cv
#dependancies
apt-get install cmake -y;
apt-get install gcc g++ -y;
apt-get install python-dev python-numpy -y;
apt-get install libavcodec-dev libavformat-dev libswscale-dev -y;
apt-get install libgstreamer-plugins-base1.0-dev libgstreamer1.0-dev -y;
apt-get install libgtk2.0-dev -y;
apt-get install libgtk-3-dev -y;
apt-get install libpng-dev -y;
apt-get install libjpeg-dev -y;
apt-get install libopenexr-dev -y;
apt-get install libtiff-dev -y;
apt-get install libwebp-dev -y;
apt-get install git -y;

##Clone git repository
git clone https://github.com/opencv/opencv.git;

#Build
cd opencv;
mkdir build;
cd build;
cmake ../;
make;
make install;

##setup some of my repos
cd ~
mkdir projects
cd projects
git clone https://github.com/OperationAzura/videoCompressor.git
git clone https://github.com/OperationAzura/nodeBlog.git

##setup FTP folders
cd ~
mkdir -p securityCams/CarPort
mkdir -p securityCams/FrontDoor
mkdir -p securityCams/cmpVids

#get ffmpeg for encoding videos
snap install ffmpeg;
#get pip
apt-get install python3-pip -y;

#get numpy for python
pip install numpy;
##move video encoding scripts for security cameras
cp ~/projects/videoCompressor/cmpVids.py ~/securityCams/cmpVids.py
