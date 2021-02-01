#!/bin/bash

echo "Provisioning virtual machine..."
echo "=========================================="
echo "Updating Ubuntu"
sudo apt-get update -y
sudo apt-get upgrade -y

# Git
#echo "Installing Git"
#sudo apt-get install git -y > /dev/null

# Apache
echo "Installing nginx"
sudo apt-get install nginx -y > /dev/null

# PHP
echo "Updating PHP repository"
sudo apt-get install software-properties-common -y
sudo add-apt-repository ppa:ondrej/php -y
sudo apt-get update -y

echo "Installing PHP"
sudo apt-get install php7.4 -y

echo "Installing PHP extensions"
sudo apt-get install -y php7.4-cli -y
sudo apt-get install -y php7.4-common -y
sudo apt-get install -y php7.4-bcmath -y
sudo apt-get install -y php7.4-ctype -y
sudo apt-get install -y php7.4-curl -y
sudo apt-get install -y php7.4-dom -y
sudo apt-get install -y php7.4-gd -y
sudo apt-get install -y php7.4-hash -y
sudo apt-get install -y php7.4-iconv -y
sudo apt-get install -y php7.4-intl -y
sudo apt-get install -y php7.4-mbstring -y
sudo apt-get install -y php7.4-openssl -y
sudo apt-get install -y php7.4-pdo_mysql -y
sudo apt-get install -y hp7.4-mysql -y
sudo apt-get install -y php7.4-simplexml -y
sudo apt-get install -y php7.4-soap -y
sudo apt-get install -y php7.4-xsl -y
sudo apt-get install -y php7.4-zip -y
sudo apt-get install -y php7.4-sockets -y
sudo apt-get install -y php7.4-fpm -y

#sudo a2enmod rewrite
#sudo service apache2 restart

# echo "Creating xdebug log directory: /var/log/xdebug"
# sudo mkdir /var/log/xdebug > /dev/null
# echo "Changing xdebug log directory owner to www-data"
# sudo chown www-data:www-data /var/log/xdebug > /dev/null

# echo "Installing xdebug"
# sudo pecl install xdebug > /dev/null
# #echo "Configuring xdebug"
# #sudo cp /var/www/html/config/php.ini /etc/php5/apache2/php.ini > /dev/null
# sudo service apache2 restart > /dev/null
# echo "Xdebug installation completeted"

# MySQL 
# echo "Preparing MySQL"
# sudo apt-get install debconf-utils -y > /dev/null
# sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
# sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"

# echo "Installing MySQL"
wget -c https://repo.mysql.com//mysql-apt-config_0.8.13-1_all.deb
sudo dpkg -i mysql-apt-config_0.8.13-1_all.deb
sudo apt-get update -y > /dev/null
sudo apt-get install mysql-server -y -f > /dev/null
sudo mysql_secure_installation
# sudo apt-get install -y mysql-client > /dev/null


# Apache Configuration
# echo "Configuring Apache"
# cp /var/www/html/config/servername.conf /etc/apache2/conf-available/servername.conf > /dev/null
# sudo a2enconf servername > /dev/null
# cp /var/www/html/config/dir.conf /etc/apache2/mods-enabled/dir.conf > /dev/null
# sudo service apache2 restart > /dev/null

# Install Git
# echo "Installing Git"
# sudo apt-get install git -y

# Installing Composer
echo "Installing Composer"
sudo curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer self-update --1

# Installing MariaDB 10.4
# echo "Installing MariaDB 10.4"
# sudo apt-get install udo
# sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8
# sudo add-apt-repository "deb [arch=amd64,arm64,ppc64el] http://mariadb.mirror.liquidtelecom.com/repo/10.4/ubuntu $(lsb_release -cs) main"
# sudo apt-get update
# sudo -y apt-get install mariadb-server mariadb-client
# sudo mysql_secure_installation

# sudo systemctl status mariadb

# Installing Node
# echo "Installing Node"
# sudo curl -sL https://deb.nodesource.com/setup | sudo bash - > /dev/null
# sudo sudo apt-get install -y nodejs > /dev/null
# sudo npm install npm -g

# echo "Installing Bower"
# sudo npm install bower -g > /dev/null

# echo "Installing Gulp"
# sudo npm install Gulp -g > /dev/null

echo "Install Elasticsearch"
sudo apt-get update -y
sudo apt-get install apt-transport-https -y
sudo apt-get install openjdk-8-jdk -y
java -version
wget -qO - https://artifacts.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -
sudo sh -c 'echo "deb https://artifacts.elastic.co/packages/7.x/apt stable main" > /etc/apt/sources.list.d/elastic-7.x.list'
sudo apt-get update
sudo apt-get install elasticsearch
sudo systemctl enable elasticsearch.service
sudo systemctl start elasticsearch.service
curl -X GET "localhost:9200/"
sudo journalctl -u elasticsearch


# sudo curl -XGET '<host>:9200/_cat/health?v&pretty'

echo "Finished provisioning."
