#!/bin/sh


#Create user
cat << EOF > /tmp/init_db.sql
CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;
CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';
GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysql -h localhost < /tmp/init_db.sql

#sed -i '/^bind-address/c\bindaddress=0.0.0.0' /etc/mysql/mariadb.conf.d/50-server.cnf


