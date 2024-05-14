FROM debian:bullseye

RUN	apt-get update
RUN apt-get install nginx -y
RUN mkdir -p /etc/nginx/ssl
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=ES/ST=IDF/L=Paris/O=42/OU=42/CN=dtome-pe.42.fr/UID=login"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/common.conf /etc/nginx/conf.d/

EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]