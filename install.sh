#!/bin/sh

user=web
home=/home/$user
dwm=~/Dwm
dir=~/Workspace

# INSTALL CORE SOFT
cp ~/Workspace/sources.list /etc/apt
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
aptitude update && aptitude full-upgrade
aptitude install sudo git vim-gtk dpkg-dev dwm suckless-tools xclip mongodb-10gen xserver-xorg-core xorg sakura

# INSTALL DWM
if [ ! -d $dwm ]
then
  mkdir $dwm
fi
cd $dwm && apt-get source dwm && cd dwm-* && cp $dir/config.h .
apt-get build-dep dwm
cd $dwm/dwm*
make clean install

# INSTALL CONFIG
cp ~/Workspace/sudoers /etc
cp ~/Workspace/xinitrc $home/.xinitrc
cp ~/Workspace/sakura.conf $home/.config/sakura
chown -R $user:$user $home/*

