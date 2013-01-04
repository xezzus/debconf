#!/bin/sh

wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10

aptitude install git vim-gtk dpkg-dev dwm suckless-tools xclip mongodb-10gen
