#!/bin/sh

aptitude install git vim-gtk dpkg-dev dwm suckless-tools
cd && mkdir Dwm && cd Dwm && apt-get source dwm

wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | sudo apt-key add -
