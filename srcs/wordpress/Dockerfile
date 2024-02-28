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

RUN cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php

RUN sed -i 's/database_name_here/'"${MYSQL_DATABASE}"'/g' /var/www/wordpress/wp-config.php
RUN sed -i 's/username_here/'"${MYSQL_USER}"'/g' /var/www/wordpress/wp-config.php
RUN sed -i 's/password_here/'"${MYSQL_PASSWORD}"'/g' /var/www/wordpress/wp-config.php
RUN sed -i 's/localhost/db/g' /var/www/wordpress/wp-config.php

RUN mkdir /run/php

EXPOSE 9000
EXPOSE 3306

COPY php.ini /etc/php/7.4/fpm/php.ini
COPY www.conf /etc/php/7.4/fpm/pool.d/www.conf

CMD ["/usr/sbin/php-fpm7.4", "-F"]