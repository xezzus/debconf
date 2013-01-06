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
gpg --keyserver subkeys.pgp.net --recv A040830F7FAC5991 && gpg --export --armor A040830F7FAC5991 | sudo apt-key add -
aptitude update && aptitude full-upgrade
aptitude install sudo git vim-gtk dpkg-dev dwm suckless-tools xclip mongodb-10gen xserver-xorg-core xorg sakura google-chrome-stable nginx bind9

# INSTALL DWM
mkdir -p $dwm
cd $dwm && apt-get source dwm && cd dwm-* && cp $dir/config.h .
apt-get build-dep dwm
cd $dwm/dwm*
make clean install

# INSTALL NGINX
cp $dir/nginx.conf /etc/nginx
mkdir -p $home/public/use/mysql/public
mkdir -p $home/public/use/pgadmin/public
mkdir -p $home/public/use/mongo/public
mkdir -p $home/public/use/joomla/public
mkdir -p $home/public/use/ocstore/public
mkdir -p $home/public/use/opencart/public
mkdir -p $home/public/use/oscommerce/public
mkdir -p $home/public/use/wordpress/public
mkdir -p $home/public/webcmf/public

# INSTALL BIND
cp $home/named.conf.local /etc/bind
cp $home/db.dev /etc/bind

# INSTALL CONFIG
cp $dir/sudoers /etc
cp $dir/xinitrc $home/.xinitrc
cp $dir/sakura.conf $home/.config/sakura
chown -R $user:$user $home/*
