FROM debian:bullseye

RUN	apt-get update
RUN apt-get install nginx -y
RUN apt-get install openssl -y
RUN apt-get install sudo -y
RUN sudo apt install openssh-client -y
RUN sudo apt install ufw -y
RUN sudo ufw allow 42
COPY nginx.conf /etc/nginx/nginx.conf
EXPOSE 22
EXPOSE 443
CMD ["nginx", "-g", "daemon off;"]