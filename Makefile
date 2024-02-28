all:
	cd srcs; docker-compose up --build -d

nginx:
	cd srcs/nginx; docker build . -t nginx; docker run -d nginx

mariadb:
	cd srcs/mariadb; docker build . -t mariadb; docker run -it mariadb bash

wordpress:
	cd srcs/wordpress; docker build . -t wordpress; docker run -it wordpress bash

stop:
	cd srcs; docker-compose down