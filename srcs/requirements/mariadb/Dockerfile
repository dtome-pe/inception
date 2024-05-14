FROM debian:bullseye

RUN apt update -y
RUN apt upgrade -y
RUN mkdir /run/mysqld
RUN apt-get install mariadb-server -y
RUN apt-get install sysvinit-utils -y
RUN chown -R mysql:root /var/lib/mysql
RUN chown -R mysql:root /run/mysqld
COPY conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
COPY tools/db_configure.sh /home/

EXPOSE 3306

ENTRYPOINT ["./home/db_configure.sh"]
