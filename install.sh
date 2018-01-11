#!/usr/bin/env bash

sudo add-apt-repository -y ppa:ondrej/php;

sudo apt-get update;
sudo apt-get -y upgrade;

sudo apt-get -y purge php*;

sudo apt-get -y install php php-common php-cli libapache2-mod-php openssl php-cgi php-xml php-xmlrpc php-soap php-json php-zip php-mbstring php-mysql php-gd php-apcu;

sudo service apache2 restart;

sudo apt-get -y autoremove;

sudo apt-get -y upgrade;

gem update --system;
gem install sass --no-user-install;
gem install compass --no-user-install;

## Install TYPO3
cd /var/www/;
mkdir typo3-sources && cd typo3-sources;

wget -O typo3.tar.gz http://get.typo3.org/7;

tar -xzf typo3.tar.gz;

yes | rm -f typo3.tar.gz;

cd /var/www/public;

mv index.php index-scotchbox.php;

ln -s ../typo3-sources/typo3_src-7.6.23 typo3_src;
ln -s typo3_src/index.php;
ln -s typo3_src/typo3;

cp typo3_src/_.htaccess .htaccess;

touch FIRST_INSTALL