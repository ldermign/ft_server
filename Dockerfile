FROM debian:buster-slim

RUN apt-get update 
RUN apt-get upgrade -y
# get .tar file of phpmyadmin and wordpress
RUN apt-get -y install wget
RUN apt-get -y install nginx
RUN apt-get -y install mariadb-server
#installation php
RUN apt-get -y install php7.3 php7.3-mysql php-fpm php-pdo php-gd php-cli php-mbstring

# localisation des recherches server-web, obligation unzip, dou wget
#WORKDIR /var/www/html/

# installation phpMyAdmin
#RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
#RUN tar -xf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
#RUN mv phpMyAdmin-5.0.1-english phpmyadmin

WORKDIR /tmp
# move dossier srcs dans tmp conteneur
COPY ./srcs/ .

#WORKDIR /var/www/html/
# installer wordpress
#RUN wget https://wordpress.org/latest.tar.gz
#RUN tar -xvzf latest.tar.gz && rm -rf latest.tar.gz

#COPY ./srcs/wp-config.php /var/www/html

# se mettre dans fichier /tmp car on a tout copie dedans, dans le conteneur, precedemment
#WORKDIR /tmp
CMD bash init.sh

#EXPOSE 80 pouet
