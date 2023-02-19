#!/bin/bash

cat .env_sample > .env

echo "WORDPRESS_VOLUME_PATH=$WORDPRESS_VOLUME_PATH" >> .env
echo "DB_VOLUME_PATH=$DB_VOLUME_PATH" >> .env
