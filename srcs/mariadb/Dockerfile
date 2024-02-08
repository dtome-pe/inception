FROM debian:bullseye

RUN apt update
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install sudo
RUN apt-get install systemctl -y
EXPOSE 3306
RUN sudo service mariadb start
RUN sudo chown -R mysql:mysql /var/lib/mysql
RUN sudo chmod -R 755 /var/lib/mysql

CMD ["mysqld"]
