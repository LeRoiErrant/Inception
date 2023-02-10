#!/bin/sh

echo "Start BASH SCRIPT" > my_bashLog.txt
#while ! mysql -h $MYSQL_HOST -u $MYSQL_USER -p $MYSQL_PASSWORD $WORDPRESS_DB_NAME &>my_bashLog.txt; do
#	sleep 3
#	echo "Sleeping" >> my_bashLog.txt
#done

echo "Awaken" > my_bashLog.txt

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded" > my_bashLog.txt
else
	echo "Trying to DL" > my_bashLog.txt
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/*
	rm -rf html
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp	
	ls -l html > content.txt
	cd /var/www/html || exit
	wp core download --allow-root > dl_log.txt 2> dl_error_log.txt
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root > config_log.txt 2>config_error_log.txt
	wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PWD --admin_email=$WORDPRESS_DB_ADMIN_MAIL --skip-email --allow-root >core_install_log.txt 2>core_install_error_log.txt
	wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_MAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root >usercreate_log.txt 2>usercreate_error_log.txt
	
fi

exec "$@"
