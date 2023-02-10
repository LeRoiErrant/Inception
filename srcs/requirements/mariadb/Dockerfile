#Containers are built using Debian buster

FROM debian:buster

ARG MYSQL_USER
ARG MYSQL_DATABASE
ARG MYSQL_PASSWORD
ARG MYSQL_ROOT_PASSWORD
#Install necessary package

RUN apt-get update && apt-get -y install mariadb-server mariadb-client


 
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/
COPY ./tools/mariadb.sh /tmp/mariadb.sh
RUN chmod +x /tmp/mariadb.sh
RUN service mysql start \ 
	&& bash /tmp/mariadb.sh

#Command to launch mariadb and enable the database to listen globally

EXPOSE 3306

CMD ["mysqld"]
