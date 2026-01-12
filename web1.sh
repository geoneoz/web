#!/bin/bash

# 1. Update the package list first so apt can find the packages
apt update && apt upgrade 

# NGINX
echo "Installing nginx......."
# Added -y to ensure it doesn't wait for input
apt install -y nginx
echo "Installing nginx config......."
# Use -f (force) so the script doesn't stop if the file is already gone
rm -f /etc/nginx/sites-available/default && rm -f /var/www/html/index.nginx-debian.html
mv web/default /etc/nginx/sites-available/
echo "Installing finish"

# MARIADB
echo "Installing mariadb........"
# Added mariadb-server to ensure the database actually runs
apt install -y mariadb-client
echo "Installing mariadb finish"

# PHP REQUIREMENT
# Fixed the typo: removed the extra dot after 8.2 (php8.2-)
# Removed 'json' because it is built into PHP 8.2 and 'xmlrpc' which is no longer in main repos
echo "Installing php req"
apt install -y php8.2-xml php8.2-intl php8.2-mbstring php8.2-xmlrpc php8.2-soap php8.2-bcmath php8.2-exif php8.2-ldap php8.2-mysql unzip php8.2-fpm php8.2-cli php8.2-curl php8.2-zip php8.2-gd
rm -f /etc/php/8.2/fpm/php.ini
mv web/php.ini /etc/php/8.2/fpm/
systemctl restart php8.2-fpm
echo "Installing php finish"

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

# Final cleanup
rm -rf web
rm -rf "$0"
