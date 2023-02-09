FROM debian:buster

RUN apt-get update
RUN apt-get install php php-mysqli php-fpm wget mariadb-client -y

EXPOSE 9000

#https://www.digitalocean.com/community/tutorials/php-fpm-nginx

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/ /var/www/

RUN chmod +x /var/www/wordpress_start.sh

ENTRYPOINT ["/var/www/wordpress_start.sh"]

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


