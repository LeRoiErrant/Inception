#!/bin/bash
WORDPRESS_VOLUME_PATH=$(pwd)/data/wordpress
DB_VOLUME_PATH=$(pwd)/data/mariadb

echo "WORDPRESS_VOLUME_PATH=$WORDPRESS_VOLUME_PATH" > .env
echo "DB_VOLUME_PATH=$DB_VOLUME_PATH" >> .env

echo $'\nDOMAIN_NAME=vheran.42.fr' >> .env

echo $'\nMYSQL_DATABASE=wordpress' >> .env
echo "MYSQL_USER=vheran" >> .env
echo "MYSQL_PASSWORD=IshottheSh3riff" >> .env
echo "MYSQL_ROOT_PASSWORD=B2b_R00t" >> .env


echo $'\nWORDPRESS_DB_HOST=db' >> .env
echo "WORDPRESS_DB_NAME=wordpress" >> .env
echo "WORDPRESS_DB_USER=vheran" >> .env
echo "WORDPRESS_DB_PASSWORD=IshottheSh3riff" >> .env