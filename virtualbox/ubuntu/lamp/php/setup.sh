#!/bin/bash

# Install PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install libapache2-mod-php php8.2 php8.2-common php8.2-xml php8.2-mysql php8.2-gd php8.2-mbstring php8.2-tokenizer php8.2-json php8.2-bcmath php8.2-curl php8.2-zip unzip -y

# Create Laravel project
mkdir /var/www/html/laravel && cd /var/www/html/laravel
git clone https://github.com/laravel/laravel.git
composer install --no-dev

# Set permission
sudo chown -R www-data:www-data /var/www/html/laravel
sudo chmod -R 775 /var/www/html/laravel
sudo chmod -R 775 /var/www/html/laravel/storage
sudo chmod -R 775 /var/www/html/laravel/bootstrap/cache

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version
