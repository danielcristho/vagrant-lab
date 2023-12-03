#!/bin/bash

sudo apt-get install mysql-server -y

# Database Credential
DB_NAME="lamp"
DB_USER="onomi"
DB_PASSWORD="7weZ41oW"

# Create database
if [ -z "$DB_PASSWORD" ]; then
    MYSQL_CMD="mysql"
else
    MYSQL_CMD="mysql -u root -p$DB_PASSWORD"
fi

$MYSQL_CMD -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"

# Create ne user
$MYSQL_CMD -e "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
$MYSQL_CMD -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%';"
$MYSQL_CMD -e "FLUSH PRIVILEGES;"