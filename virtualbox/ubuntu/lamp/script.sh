#!/bin/bash

# Update & install some packages
sudo apt-get update && sudo apt-get install htop neofetch -y

# Install Apache2
sudo apt-get install apache2 -y

# Verify laravel.conf
sudo a2enmod rewrite
sudo cp /vagrant/apache/laravel.conf /etc/apache2/sites-available/laravel.conf
sudo a2ensite laravel.conf
sudo systemctl restart apache2

# Install MySQL
sudo apt-get install mysql-server -y

# Database Credential
DB_NAME="lamp"
DB_USER="onomi"
DB_PASSWORD="7weZ41oW"

# Create new user & database
sudo mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
sudo mysql -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
sudo mysql -e "FLUSH PRIVILEGES;"
echo "Database is success creating..."

# Config MySQL
sudo sed -i 's/bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mysql.conf.d/mysqld.cnf
sudo service mysql restart

# Install PHP
sudo add-apt-repository -y ppa:ondrej/php
sudo apt-get install libapache2-mod-php php8.2 php8.2-common php8.2-xml php8.2-mysql php8.2-gd php8.2-mbstring php8.2-tokenizer php8.2-bcmath php8.2-curl php8.2-zip unzip -y

# Install Composer
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version

# Create Laravel project
sudo mkdir /var/www/html/app && cd /var/www/html/app
sudo git clone https://github.com/laravel/laravel.git && cd laravel
sudo composer install --no-dev -n | echo "yes"
sudo cp /vagrant/php/.env.example /var/www/html/app/laravel/.env

# Set permission
sudo chown -R www-data:www-data /var/www/html/app/laravel
sudo chmod -R 775 /var/www/html/app/laravel
sudo chmod -R 775 /var/www/html/app/laravel/storage
sudo chmod -R 775 /var/www/html/app/laravel/bootstrap/cache