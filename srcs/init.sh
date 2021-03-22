service nginx start
service mysql start
service php7.3-fpm start

rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
cp /tmp/default /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;"| mysql -u root
echo "FLUSH PRIVILEGES;"| mysql -u root

cp wp-config.php /var/www/html/
cp config.inc.php /var/www/html/phpmyadmin

cd /etc/
mkdir .mkcert
chmod +x mkcert
apt-get -y install libnss3-tools
./mkcert -install
./mkcert localhost

#cd /etc/ssl/
#openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/ssl/localhost.pem -keyout /etc/ssl/localhost.key -subj "/C=FR/ST=Paris/L=Paris/O=42/OU=user/CN=localhost"

service nginx reload
service mysql reload
service php7.3-fpm reload

cd /tmp/

bash
