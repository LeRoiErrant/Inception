FROM debian:buster

RUN apt-get -y update \
&& apt-get -y install nginx openssl \
&& rm -rf /var/lib/apt/lists/*

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-out /etc/ssl/vheran.crt \
	-keyout /etc/ssl/vheran.key \
	-subj "/C=CH/ST=Vaud/L=Renens/O=42 Lausanne/OU=vheran/CN=vheran"

COPY ./conf/ /etc/nginx/conf.d/

#RUN mkdir -p /run/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]