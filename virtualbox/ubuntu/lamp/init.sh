#!/bin/bash

# Update & install some packages
sudo apt-get update && sudo apt-get install htop neofetch -y

# Import all utilites
. apache/setup.sh
. mysql/setup.sh
. php/setup.sh


