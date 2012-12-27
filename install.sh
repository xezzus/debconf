#!/bin/sh

aptitude install git vim-gtk dpkg-dev dwm suckless-tools
apt-get source dwm

wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
