#!/bin/sh

cp sources.list /etc/apt

aptitude update && aptitude full-upgrade

wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

aptitude install sudo git vim-gtk dpkg-dev dwm suckless-tools xclip mongodb-10gen

cp sudoers /etc


