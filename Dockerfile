FROM debian:buster-slim

RUN apt-get update && apt-get upgrade -y
# get .tar file of phpmyadmin and wordpress
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
#installation php
RUN apt-get -y install php7.3 php7.3-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# localisation des recherches server-web, obligation unzip, dou wget
WORKDIR /var/www/html/

# installation phpMyAdmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
RUN mv phpMyAdmin-5.0.1-english phpmyadmin

WORKDIR /tmp

# move dossier srcs dans tmp conteneur
COPY ./srcs/ .

# RUN wget https://wordpress.org/latest.tar.gz
# RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz
#COPY 
#COPY 
#COPY 

#CMD ["bash", "srcs/launch_server.sh"]

#EXPOSE 80 pouet
