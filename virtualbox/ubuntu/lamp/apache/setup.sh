#!/bin/bash

# Install Apache2
sudo apt-get install apache2 -y

# Verify laravel.conf
sudo a2enmod rewrite
sudo cp /vagrant/apache/laravel.conf /etc/apache2/sites-available/laravel.conf
sudo a2ensite laravel.conf
sudo systemctl restart apache2
