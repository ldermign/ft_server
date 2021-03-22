FROM debian:buster-slim

RUN apt-get update 
RUN apt-get upgrade -y
# get .tar file of phpmyadmin and wordpress
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get install -y mariadb-server
# certificat ssl, deja installe ?
# RUN apt-get -y install openssl
#installation php
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline

# localisation des recherches server-web, obligation unzip, dou wget
# installation phpMyAdmin
WORKDIR /var/www/html/phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

# installer wordpress
WORKDIR /var/www/html
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

WORKDIR /tmp/

COPY ./srcs/ .

CMD bash init.sh
