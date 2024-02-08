FROM debian:bullseye

RUN apt update
RUN curl -LsS https://r.mariadb.com/downloads/mariadb_repo_setup | bash
RUN apt-get install mariadb-server mariadb-client -y
RUN apt-get install sudo
RUN apt-get install systemctl -y
RUN mariadb

