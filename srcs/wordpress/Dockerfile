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


RUN mkdir /run/php

EXPOSE 9000
EXPOSE 3306

COPY php.ini /etc/php/7.4/fpm/php.ini
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY wp_configure.sh /home/
COPY wp-config.php /

CMD ["./home/wp_configure.sh"]