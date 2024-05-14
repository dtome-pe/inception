FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN apt install php-fpm -y\
				php-mysql -y\			
				mariadb-client -y\
				wget -y \
				curl -y \ 
				systemctl -y \ 
				sysvinit-utils -y


RUN wget https://wordpress.org/latest.tar.gz -P /var/www
RUN cd /var/www && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN		chown -R root:root /var/www/wordpress

RUN mkdir /run/php

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY conf/php.ini /etc/php/7.4/fpm/php.ini
COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY conf/wp-config.php /

COPY tools/wp_configure.sh /home/

EXPOSE 9000

CMD ["./home/wp_configure.sh"]