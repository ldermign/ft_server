FROM debian:buster

RUN apt-get update 
RUN apt-get upgrade -y
# get .tar file of phpmyadmin and wordpress
RUN apt-get -y install wget
RUN apt-get -y install nginx
#RUN apt-get -y install mariadb-client
#RUN apt install php7.3 php7.3-cli php7.3-common php7.3-opcache php7.3-curl php7.3-mbstring php7.3-mysql php7.3-zip php7.3-xml

#COPY 
#COPY 
#COPY 
#COPY 

#CMD ["bash", "srcs/launch_server.sh"]

#EXPOSE 80 pouet
