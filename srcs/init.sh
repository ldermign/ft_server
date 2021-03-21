service nginx start
service mysql start
service php7.3-fpm start

rm /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default
cp /tmp/default /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

cp ./srcs/wp-config.php /var/www/html

# Configure a wordpress database
echo "CREATE DATABASE wordpress;"| mysql -u root --skip-password
echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' WITH GRANT OPTION;"| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;"| mysql -u root --skip-password
#echo "update mysql.user set plugin='' where user='root';"| mysql -u root --skip-password


## A VOIR
# mkdir /var/www/localhost

# creer le fichier a afficher quand index on
# cp localhost_index_on /etc/nginx/sites-available/localhost
# ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/


#echo "CREATE DATABASE wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;" | mysql -u root
#echo "GRANT ALL ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root

service nginx reload
service mysql reload
service php7.3-fpm reload

bash
