#!/bin/sh

while ! mysql -h $MYSQL_HOST -u $MYSQL_USER -p $MYSQL_PASSWORD $WORDPRESS_DB_NAME &>/dev/null; do
	sleep 3
done

mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

if [ -f ./wordpress/wp-config.php ]
then
	echo "wordpress already downloaded"
else
	chown -R www-data:www-data /var/www/*
	chmod -R 755 /var/www/*
	mkdir -p /var/www/html
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	cd /var/www/html || exit
	wp core download --allow-root
	wp config create --dbname=$WORDPRESS_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=$MYSQL_HOST --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root
	wp core install --url=$DOMAIN_NAME --title=$WORDPRESS_TITLE --admin_user=$WORDPRESS_DB_ADMIN --admin_password=$WORDPRESS_DB_ADMIN_PWD --admin_email=$WORDPRESS_DB_ADMIN_MAIL --skip-email --allow-root
	wp user create $WORDPRESS_DB_USER $WORDPRESS_DB_MAIL --role=author --user_pass=$WORDPRESS_DB_PASSWORD --allow-root
fi

exec "$@"
