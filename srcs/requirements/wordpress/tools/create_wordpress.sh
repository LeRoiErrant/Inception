#!/bin/sh

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	#Download wordpress
	pwd >> ./SHOW_ME.txt
	wget https://wordpress.org/latest.tar.gz
	tar -xzvf latest.tar.gz
	#mv /var/www/html/wordpress/* /var/www/html
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf ./wordpress
	ls -l >> ./SHOW_ME.txt


	#Update configuration file
	#rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	#mv ./www.conf /etc/php/7.3/fpm/pool.d/
	#rm -rf /usr/local/etc/php-fpm.d/www.conf
	#mv ./www.conf /usr/local/etc/php-fpm.d/


	#Inport env variables in the config file
	sed -i "s/username_here/$WORDPRESS_DB_USER/g" wp-config-sample.php
	sed -i "s/password_here/$WORDPRESS_DB_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/$WORDPRESS_DB_HOST/g" wp-config-sample.php
	sed -i "s/database_name_here/$WORDPRESS_DB_DATABASE/g" wp-config-sample.php
	sed -i '87 s/.*/'"define( 'WP_INSTALLING', true );"'/' wp-config-sample.php
	echo "define( 'WP_HOME', 'http://example.com' );" >> wp-config-sample.php
	mv wp-config-sample.php wp-config.php
fi

exec "$@"
