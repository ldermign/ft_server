FROM debian:buster

RUN apt-get update && apt-get upgrade -y

RUN apt-get -y install nginx # installation serveur web

RUN apt-get -y install mariadb-client # installation de la base de donnee, nommee ainsi sous debian buster

RUN apt install php7.3 php7.3-cli php7.3-common php7.3-opcache php7.3-curl php7.3-mbstring php7.3-mysql php7.3-zip php7.3-xml
# va installer PHP 7.3 avec les extensions/paquets les plus connues et utiles a phpMyadmin


CMD ["bash", "srcs/launch_server.sh"]

EXPOSE 80 8080
