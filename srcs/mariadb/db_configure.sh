#!/bin/bash
mysqladmin -u root password $MYSQL_ROOT_PASSWORD

mysql -u root -p
#admin
mysql -e "CREATE DATABASE IF NOT EXISTS \`${MYSQL_DATABASE}\`;"
mysql -e CREATE USER \`${MYSQL_ADMIN}\`@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
#user
mysql -e "GRANT ALL PRIVILEGES ON \`${MYSQL_DATABASE}\`.* TO \`${MYSQL_ADMIN}\`@'%' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "CREATE USER IF NOT EXISTS \`${MYSQL_USER}\`@'localhost' IDENTIFIED BY '${MYSQL_PASSWORD}';"

mysql -e FLUSH PRIVILEGES

mysqld --bind-address=0.0.0.0

