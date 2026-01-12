#!/bin/bash

# 1. Update the package list first so apt can find the packages
apt update

# NGINX
echo "Installing nginx......."
# Added -y to ensure it doesn't wait for input
apt install -y nginx
echo "Installing nginx config......."
# Use -f (force) so the script doesn't stop if the file is already gone
rm -f /etc/nginx/sites-available/default
mv web/default /etc/nginx/sites-available/
echo "Installing finish"

# MARIADB
echo "Installing mariadb........"
# Added mariadb-server to ensure the database actually runs
apt install -y mariadb-client mariadb-server
echo "Installing mariadb-client finish"

# PHP REQUIREMENT
# Fixed the typo: removed the extra dot after 8.2 (php8.2-)
# Removed 'json' because it is built into PHP 8.2 and 'xmlrpc' which is no longer in main repos
apt install -y php8.2-{fpm,bcmath,bz2,cli,common,curl,dev,gd,gmp,imagick,imap,intl,mbstring,mysql,opcache,soap,ssh2,xml,zip}

# Fixed the path: PHP config is in /etc/, not /var/
rm -f /etc/php/8.2/fpm/php.ini
mv web/php.ini /etc/php/8.2/fpm/
# Added a restart to apply the new php.ini
systemctl restart php8.2-fpm

# MOODLE
echo "Installing moodle...."
apt install wget zip unzip -y
# Split the wget and unzip commands so they execute separately
wget https://download.moodle.org/download.php/stable403/moodle-4.3.12.zip
unzip moodle-4.3.12.zip -d /var/www/html

# Clean up existing config if it exists
rm -f /var/www/html/moodle/config.php
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

# Final cleanup as per your logic
rm -rf web
rm -rf "$0"
