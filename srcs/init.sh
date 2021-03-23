service nginx start
service mysql start
service php7.3-fpm start

rm /var/www/html/index.nginx-debian.html
cp info.php /var/www/html/

rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
cp default /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Configure a wordpress database
echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'utilisateur'@'%';" | mysql -u root
echo "GRANT ALL ON wordpress.* TO 'utilisateur'@'%' WITH GRANT OPTION;" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

cp wp-config.php /var/www/html/wordpress
cp config.inc.php /var/www/html/phpmyadmin

chown -R www-data:www-data /var/www/html/*
chmod 755 -R /var/www/*

# configuration certificat ssl
cd /etc/
mkdir .mkcert
cd ./.mkcert
wget -O mkcert https://github.com/FiloSottile/mkcert/releases/download/v1.2.0/mkcert-v1.2.0-linux-amd64
chmod +x mkcert
apt-get -y install libnss3-tools
./mkcert -install
./mkcert localhost

service nginx reload
service mysql reload
service php7.3-fpm reload

cd /tmp/

bash
