#!/bin/bash

if [[ $STATE = "test" ]]
then
	WORDPRESS_VOLUME_PATH=$(pwd)/data/wordpress
	DB_VOLUME_PATH=$(pwd)/data/mariadb
else
	WORDPRESS_VOLUME_PATH=/home/vheran/data/wordpress
	DB_VOLUME_PATH=/home/vheran/data/mariadb
fi


cat .env_sample > .env

echo "WORDPRESS_VOLUME_PATH=$WORDPRESS_VOLUME_PATH" >> .env
echo "DB_VOLUME_PATH=$DB_VOLUME_PATH" >> .env
