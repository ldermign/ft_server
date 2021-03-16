service nginx start
service mysql start
service php7.3-fpm start

rm /etc/nginx/sites-available/default
rm /etc/nginx/sites-enabled/default
cp /tmp/default /etc/nginx/sites-available

ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password

bash
