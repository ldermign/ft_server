FROM debian:buster-slim

RUN apt-get update 
RUN apt-get upgrade -y
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get install -y mariadb-server
RUN apt-get -y install php7.3 php7.3-fpm php7.3-mysql php-common php7.3-cli php7.3-common php7.3-json php7.3-opcache php7.3-readline php7.3-mbstring

WORKDIR /var/www/html/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

WORKDIR /tmp/

COPY ./srcs/ .

CMD bash init.sh
