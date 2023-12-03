#!/bin/bash

# Install Apache2
sudo apt-get install apache2 -y

# Verify laravel.conf
sudo a2enmod rewrite
sudo a2ensite laravel.conf

sudo systemctl restart apache2
