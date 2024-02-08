FROM debian:bullseye

RUN apt-get update
RUN apt-get install sudo -y
RUN apt-get install wget -y
RUN wget https://wordpress.org/latest.tar.gz -P /home/dtome-pe/data/
RUN tar -xvf /home/dtome-pe/data/ -C /home/dtome-pe/data/
RUN mv /home/dtome-pe/data/wordpress/* /home/dtome-pe/data/web
RUN sudo chown -R www-data:www-data /home/dtome-pe/data/web
RUN apt-get install php-fpm -y
EXPOSE 9000
CMD ["wordpress"]