rm /etc/nginx/sites-available/* /etc/nginx/sites-enabled/*
cp default_on /etc/nginx/sites-available
ln -s /etc/nginx/sites-available/default_on /etc/nginx/sites-enabled/
service nginx reload
