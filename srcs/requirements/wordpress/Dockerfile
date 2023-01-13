FROM debian:buster

#Install necessary package from php

RUN apt-get update && apt-get -y install \ 
    wget \
    curl \
    bash \
    php \
    php-cgi \
    php-mysql \
    php-fpm \
    php-pdo \
    php-gd php-cli \
    php-mbstring \
    && rm -rf /var/lib/apt/lists/*

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
    && chmod +x wp-cli.phar \
    && mv wp-cli.phar /usr/local/bin/wp

#Copy the necessary tools to download wordpress

COPY ./conf/www.conf /var/www/html/

#Create the folder to enable php start

RUN mkdir /run/php

#Launch script

COPY ./tools/create_wordpress.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/create_wordpress.sh
ENTRYPOINT ["/usr/local/bin/create_wordpress.sh"]

WORKDIR /var/www/html/

EXPOSE 9000

CMD ["/usr/sbin/php-fpm7.3", "-F"]
