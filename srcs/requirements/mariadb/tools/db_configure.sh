#!/bin/bash
mysqld
#user
mysql -e "CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};"
mysql -e "CREATE USER \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO \`${MYSQL_USER}\`@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysql -e "FLUSH PRIVILEGES"

mysqld --bind-address=0.0.0.0


#mysql -e "CREATE USER paco@'%' IDENTIFIED BY ${MYSQL_PASSWORD};"
#SELECT user, host, authentication_string FROM mysql.user;
#MYSQL_PASSWORD=2vKvMKxeCHpDzMwgCGPg