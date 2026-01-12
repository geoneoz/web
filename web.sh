#!/bin/bash

# NGINX
echo "Installing nginx......."
apt install -y nginx
echo "Installing nginx config......."
rm /etc/nginx/sites-available/default
mv web/default /etc/nginx/sites-available/
echo "Installing finish"

# MARIADB
echo "Installing mariadb........"
apt install -y mariadb-client
echo "Installing mariadb-client finish"

# PHP REQUIREMENT
apt install -y php8.2.-{fpm,bcmath,bz2,cli,common,curl,dev,fpm,gd,gmp,imagick,imap,intl,json,mbstring,mysql,opcache,soap,ssh2,xml,xmlrpc,zip}
rm /var/php/8.2/fpm/php.ini
mv web/php.ini /var/php/8.2/fpm/

# MOODLE
echo "Installing moodle...."
apt install wget zip -y
wget https://download.moodle.org/download.php/stable403/moodle-4.3.12.zip unzip /var/www/html
rm /var/www/html/moodle/config.php
mv web/config.php /var/www/html/moodle/
echo "Instaling finish"
echo "Setelah install edit ip di dalam file config.php di dalam moodle"

echo "thanks for using ALVIN'S PRODUCT"
echo "initiate self destruction"
echo "5"
echo "4"
echo "3"
echo "2"
echo "1"
echo "good bye"
rm -rf web
rm -rf web.sh



