FROM debian:bullseye

RUN apt update
RUN apt upgrade
RUN apt install systemctl -y
RUN apt install aptitude -y
RUN apt install -y software-properties-common
RUN apt install gnupg -y
RUN apt install curl -y
RUN curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup
RUN apt update
RUN apt upgrade
RUN apt install mariadb-server -y
EXPOSE 3306

ENTRYPOINT ["/bin/bash"]
CMD ["service", "mariadb", "start"]

