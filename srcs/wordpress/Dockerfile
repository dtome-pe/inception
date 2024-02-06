FROM debian:bullseye

RUN apt-get update
RUN apt-get upgrade
RUN apt-get install sudo -y
RUN apt-get install wget -y
RUN sudo mkdir -p /var/www/html/dtome-pe.42.fr
RUN wget https://wordpress.org/latest.tar.gz -P /tmp
RUN tar xf /tmp/latest.tar.gz -C /tmp
RUN sudo mv /tmp/wordpress/* /var/www/html/dtome-pe.42.fr/
RUN sudo chown -R www-data: /var/www/html/dtome-pe.42.fr/
RUN apt-get install php-fpm -y
CMD ["wordpress"]