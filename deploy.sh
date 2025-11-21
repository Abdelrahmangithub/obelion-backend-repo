#!/bin/bash

set -e

sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.2 php8.2-cli php8.2-fpm php8.2-mysql php8.2-xml php8.2-mbstring php8.2-bcmath curl unzip git
sudo apt install -y php8.2-dev

sudo update-alternatives --set php /usr/bin/php8.2
sudo update-alternatives --set phar /usr/bin/phar8.2
sudo update-alternatives --set phar.phar /usr/bin/phar.phar8.2
sudo update-alternatives --set phpize /usr/bin/phpize8.2
sudo update-alternatives --set php-config /usr/bin/php-config8.2

php -v


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
  git clone -b 12.x https://github.com/Abdelrahmangithub/obelion-backend-repo .
else
  git pull origin 12.x
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
