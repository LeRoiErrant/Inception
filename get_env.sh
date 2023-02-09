#!/bin/bash
WORDPRESS_VOLUME_PATH=$(pwd)/data/wordpress
DB_VOLUME_PATH=$(pwd)/data/mariadb

cat .env_sample > .env

echo "WORDPRESS_VOLUME_PATH=$WORDPRESS_VOLUME_PATH" >> .env
echo "DB_VOLUME_PATH=$DB_VOLUME_PATH" >> .env