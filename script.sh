apt-get update
apt-get -y install nginx
service nginx start
apt-get -y install wget
apt-get-y install mariadb-server
service mysql start
mysql_secure_installation
n
y
y
y
y
mariadb
CREATE DATABASE example_database;
GRANT ALL ON example_database.* TO 'example_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
exit

apt-get -y instal php-fpm php-mysql

mkdir /var/www/exemple
chown -R www-data:www-data /var/www/exemple
vim /etc/nginx/sites-available/exemple
#creation fihier default
ln -s /etc/nginx/sites-available/exemple /etc/nginx/sites-enabled
service nginx reload
service php7.3-fpm start
