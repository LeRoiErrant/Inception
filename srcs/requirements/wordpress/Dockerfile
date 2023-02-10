FROM debian:buster

RUN apt-get update
RUN apt-get install php php-mysqli php-fpm wget mariadb-client -y

EXPOSE 9000

#https://www.digitalocean.com/community/tutorials/php-fpm-nginx

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d
COPY ./tools/ /usr/local/bin/

RUN chmod +x /usr/local/bin/create_wordpress.sh

ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/

CMD ["/usr/sbin/php-fpm7.3", "--nodaemonize"]


