#!/bin/bash

mkdir /var/www/
mkdir /var/www/html

cd /var/www/html

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar 

chmod +x wp-cli.phar 

mv wp-cli.phar /usr/local/bin/wp


wp core download --allow-root

mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

mv /wp-config.php /var/www/html/wp-config.php

cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/wordpress/wp-config.php
sed -i "s/username_here/$MYSQL_USER/g" /var/www/wordpress/wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php
sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/wordpress/wp-config.php

wp core install --url=$DOMAIN_NAME/ --title=$TITLE --admin_user=$ADMIN --admin_password=$ADMIN_PASSWORD --admin_email=$ADMIN_EMAIL --allow-root
wp user create $USER $USER_EMAIL --role=author --user_pass=$WP_PWD --allow-root

/usr/sbin/php-fpm7.4 -F