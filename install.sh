#!/bin/sh
user=web
home=/home/$user
dwm=~/Dwm
dir=~/Workspace
vim=vim72

# INSTALL CORE SOFT
cp ~/Workspace/sources.list /etc/apt
wget http://www.dotdeb.org/dotdeb.gpg
cat dotdeb.gpg | apt-key add -
apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10
gpg --keyserver subkeys.pgp.net --recv A040830F7FAC5991 && gpg --export --armor A040830F7FAC5991 | sudo apt-key add -
wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | sudo apt-key add -
aptitude update && aptitude full-upgrade
aptitude install sudo git vim-gtk dpkg-dev dwm \
suckless-tools xclip mongodb-10gen xserver-xorg-core \
xorg sakura google-chrome-stable nginx bind9 \
xfonts-terminus ttf-liberation gthumb gtk2-engines \
mysql-server postfix ca-certificates evince gimp \
inkscape mc php5-cli php5-fpm php-pear php5-dev
pecl install mongo slim conky dzen2

# INSTALL DWM
mkdir -p $dwm
cd $dwm && apt-get source dwm && cd dwm-* && cp $dir/config.h . && cp $dir/dwm.c .
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
cp -r $dir/info $home/public/use

# INSTALL DZEN
cp $dir/conkyrc $home/.conkyrc
cp -r $dir/dzen $home/.dzen

# INSTALL CONFIG
cp $dir/dhclient.conf /etc/dhcp
cp $dir/sudoers /etc
cp $dir/xinitrc $home/.xinitrc
cp $dir/sakura.conf $home/.config/sakura
cp $dir/vide /usr/bin && chown root:root /usr/sbin/vide && chmod +x /usr/sbin/vide
cp $dir/vimrc /etc/vim
cp $dir/jellybeans.vim /usr/share/vim/$vim/colors
cp $dir/slim.conf /etc
chown -R $user:$user $home
