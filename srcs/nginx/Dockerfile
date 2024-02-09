FROM debian:bullseye

RUN	apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=SP/ST=Cat/L=BCN/O=42/OU=Cluster a/CN=dtome-pe.42.fr"
RUN openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
RUN unlink /etc/nginx/sites-enabled/default
COPY nginx.conf /etc/nginx/nginx.conf
COPY self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ssl-params.conf /etc/nginx/snippets/ssl-params.conf
EXPOSE 443
EXPOSE 9000
CMD ["nginx", "-g", "daemon off;"]