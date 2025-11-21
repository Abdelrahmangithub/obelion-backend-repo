#!/bin/bash

set -e

sudo apt update -y
sudo apt install -y git unzip curl php php-cli php-fpm php-mbstring php-xml php-bcmath php-mysql

# Install composer
# if not command exists ,  /dev/null to make the o/p clean 
if ! command -v composer &> /dev/null
then
  curl -sS https://getcomposer.org/installer -o composer-setup.php
  php composer-setup.php
  sudo mv composer.phar /usr/local/bin/composer
fi

# Prepare project folder
sudo mkdir -p /var/www/backend
sudo chown -R $USER:$USER /var/www/backend

cd /var/www/backend

# Clone / Pull Project
# if not dirctory exists
if [ ! -d ".git" ]; then
  git clone https://github.com/Abdelrahmangithub/obelion-backend-repo .
else
  git pull origin main
fi

composer install --no-interaction --prefer-dist --optimize-autoloader

if [ ! -f .env ]; then
  cp .env.example .env
fi

php artisan key:generate --force
php artisan migrate --force

# Kills the process and make it true as it possible to no process so the pipeline continue
pkill -f "php artisan serve" || true

# To mkae the process running even the session closed    /dev/null clean o/p      2>&1 hide errors          & in background
nohup php artisan serve --host=0.0.0.0 --port=8000 > /dev/null 2>&1 &
