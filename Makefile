all:
	cd srcs; docker-compose up --build -d

nginx:
	cd srcs/requirements/nginx; docker build . -t nginx; docker run -d nginx

mariadb:
	cd srcs/requirements/mariadb; docker build . -t mariadb; docker run -it mariadb bash

wordpress:
	cd srcs/requirements/wordpress; docker build . -t wordpress; docker run -it wordpress bash

clean:
	cd srcs; docker-compose down -v; docker-compose rm; sudo rm -rf /home/dtome-pe/data/web/*; sudo rm -rf /home/dtome-pe/data/db/*