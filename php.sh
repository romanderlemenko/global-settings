#!/usr/bin/env bash

#
# Add PHP repository
#
add-apt-repository -y ppa:ondrej/php

#
# Install PHP
#
apt -y install php7.1
apt -y install php7.1-zip php7.1-xml php7.1-dba php7.1-mysql php7.1-mysqli php7.1-soap php7.1-mbstring
apt -y install php7.1-pdo php7.1-dom php7.1-cli php7.1-pgsql php7.1-common php7.1-json php7.1-mcrypt

#
# Install Composer
#
wget    https://getcomposer.org/installer       &> /dev/null
php     installer                               &> /dev/null
mv      composer.phar /usr/local/bin/composer
rm      installer* composer*                    &> /dev/null
