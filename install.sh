#!/bin/sh

user=web
home=/home/$user

# INSTALL CORE SOFT
cp sources.list /etc/apt
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
aptitude update && aptitude full-upgrade
aptitude install sudo git vim-gtk dpkg-dev dwm suckless-tools xclip mongodb-10gen xserver-xorg-core xorg sakura

# INSTALL DWM
dir_dwm=~/Dwm
dir_workspace=~/Workspace
file_config=$dir_workspace/config.h
if [ ! -d $dir_dwm ]
then
  mkdir $dir_dwm
fi
cd $dir_dwm && apt-get source dwm && cd dwm-* && cp $file_config .
apt-get build-dep dwm
cd $dir_dwm/dwm*
make clean install

# INSTALL CONFIG
cp ./sudoers /etc
cp ./xinitrc $home/.xinitrc
cp ./sakura.conf $home/.config/sakura
chown -R $user:$user $home/*

