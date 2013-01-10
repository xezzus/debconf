#!/bin/sh
user=web
home=/home/$user
dwm=~/dwm
dir=~/debconf
vim=vim72

# PURGE
aptitude purge exim4 exim4-base exim4-config exim4-daemon-light

# SOURCES
cp $dir/sources.list /etc/apt

# KEY dotdeb
wget http://www.dotdeb.org/dotdeb.gpg && cat dotdeb.gpg | apt-key add -

# KEY GOOGLE
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

# UPDATE
aptitude update && aptitude full-upgrade

# INSTALL
aptitude install sudo git vim-gtk dpkg-dev dwm \
suckless-tools xclip xserver-xorg-core \
xorg sakura google-chrome-stable nginx bind9 \
xfonts-terminus ttf-liberation gthumb gtk2-engines \
postfix ca-certificates evince gimp \
inkscape mc php5-cli php5-fpm php-pear php5-dev \
slim conky dzen2 xfs xfsprogs unzip zip rar unrar

# PHP PECL
pecl install mongo 

# INSTALL DWM
mkdir -p $dwm
cd $dwm && apt-get source dwm && cd dwm-* && cp $dir/config.h . && cp $dir/dwm.c .
apt-get build-dep dwm
cd $dwm/dwm*
make clean install

# INSTALL NGINX
cp $dir/nginx.conf /etc/nginx

# INSTALL BIND
cp $dir/named.conf.local /etc/bind
cp $dir/named.conf.options /etc/bind
cp $dir/db.dev /etc/bind

# INSTALL THEMES
cp -r $dir/elementary /usr/share/icons
cp -r $dir/default /usr/share/icons
cp -r $dir/Xeonyx /usr/share/icons
cp -r $dir/BSMsdm /usr/share/themes
cp $dir/gtkrc /etc/gtk-2.0

# INSTALL POSTFIX
cp $dir/main.cf /etc/postfix
cp $dir/sasl_password /etc/postfix/
cp $dir/transport /etc/postfix
chmod 400 /etc/postfix/sasl_password
postmap /etc/postfix/sasl_password
postmap /etc/postfix/transport
ln -s /etc/ssl/certs/Equifax_Secure_CA.pem /etc/postfix/cacert.pem
#sendmail -bv xezzus@gmail.com
#tail /var/log/mail.log

# INSTALL PHP
cp $dir/php.ini /etc/php5/fpm
rm /etc/php5/cli/php.ini
ln -s /etc/php5/fpm/php.ini /etc/php5/cli
cp $dir/php-fpm.conf /etc/php5/fpm
mkdir -p $home/public/use && cp -r $dir/info $home/public/use

# INSTALL DZEN
cp $dir/conkyrc $home/.conkyrc
cp -r $dir/dzen $home/.dzen

# INSTALL CONFIG
cp $dir/dhclient.conf /etc/dhcp
cp $dir/sudoers /etc
cp $dir/xinitrc $home/.xinitrc
cp -r $dir/config $home/.config
cp $dir/vide /usr/bin && chown root:root /usr/bin/vide && chmod +x /usr/bin/vide
cp $dir/vimrc /etc/vim
cp $dir/jellybeans.vim /usr/share/vim/$vim/colors
cp $dir/slim.conf /etc
cp $dir/mc.ext /etc/mc
cp -r $dir/mplayer $home/.mplayer
cp $dir/gitconfig $home/.gitconfig
cp $dir/rtorrent.rc $home/.rtorrent.rc

# CHOWN
chown -R $user:$user $home

# INSTALL FSTAB
echo "tmpfs   /tmp        tmpfs   size=100M   0   0" >> /etc/fstab
echo "tmpfs   /mnt        tmpfs   size=100M   0   0" >> /etc/fstab
echo "tmpfs   /var/tmp    tmpfs   size=100M   0   0" >> /etc/fstab
echo "tmpfs   /var/log    tmpfs   size=100M   0   0" >> /etc/fstab
echo "tmpfs   /var/lock   tmpfs   size=100M   0   0" >> /etc/fstab
echo "tmpfs   /var/run    tmpfs   size=100M   0   0" >> /etc/fstab
