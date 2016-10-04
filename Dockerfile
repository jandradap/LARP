FROM ubuntu
MAINTAINER Jorge Andrada <jandradap@gmail.com>

RUN apt-get update 
RUN apt-get install -y unzip \
	apt-utils \
	apache2 \
	libapache2-mod-php \
	libapache2-mod-php7.0 \
	php7.0 \
	php7.0-cli \
	php7.0-json \
	php-curl \
	jq \
	php-redis \
	supervisor \
	redis-server

#borro descargas
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/apt/archives/*

#Personalizamos apache2
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/log/supervisor
RUN rm -rf /var/www/html/index.html
COPY index.php /var/www/html/index.php

#Copio la configuracion del supervisord
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chown root:root /etc/supervisor/conf.d/supervisord.conf

#Copiamos el script para interactuar con redis desde bash
COPY redi.sh /usr/local/sbin/redi
RUN chmod +x /usr/local/sbin/redi

#exponemos puertos
EXPOSE 6379
EXPOSE 80

#directorio de trabajo por defecto
WORKDIR /var/www/html/

#Ejecuto el supervisor
CMD ["/usr/bin/supervisord"]
