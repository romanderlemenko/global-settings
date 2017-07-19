#!/usr/bin/env bash

USER=$1

createFolders() {
    if [ ! -d ~/Software/ ]; then
        sudo -u ${USER} mkdir ~/Software
    fi

    if [ ! -d ~/Projects/ ]; then
        sudo -u ${USER} mkdir ~/Projects
    fi
}
installPhp() {
    apt -y install php7.1
    apt -y install php7.1-common php7.1-xml php7.1-dom php7.1-json php7.1-pdo php7.1-mysql php7.1-mysqli php7.1-gd
    apt -y install php7.1-dba php7.1-bcmath php7.1-zip php7.1-soap php7.1-pgsql php7.1-mbstring php7.1-cli php7.1-mcrypt
}

installComposer() {
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
    php -r "if (hash_file('SHA384', 'composer-setup.php') === '669656bab3166a7aff8a7506b8cb2d1c292f042046c5a994c43155c0be6190fa0355160742ab2e1c88d40d5be660b410') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
    php composer-setup.php
    php -r "unlink('composer-setup.php');"

    mv composer.phar /usr/local/bin/composer
}

installPhpStorm() {
    sudo -u ${USER} wget https://download.jetbrains.com/webide/PhpStorm-2017.2.tar.gz
    sudo -u ${USER} tar -xvzf PhpStorm-2017.2.tar.gz
    rm PhpStorm-2017.2.tar.gz
    sudo -u ${USER} mv PhpStorm-172.3317.83 ~/Software
}

apt -y install python-software-properties

add-apt-repository -y ppa:ondrej/php

apt -y update

installPhp

apt -y install mysql
apt -y install htop
apt -y install lm-sensors
apt -y install curl
apt -y install wget

apt-get autoremove
apt -f install

if [ ! -f /usr/local/bin/composer ]; then
    installComposer
fi

sudo -u ${USER} composer install

createFolders
installPhpStorm

chmod -R 755 ../global-settings
chown -R ${USER}:${USER} ../global-settings
