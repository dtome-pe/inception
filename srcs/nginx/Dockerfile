FROM debian:bullseye

RUN	apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]