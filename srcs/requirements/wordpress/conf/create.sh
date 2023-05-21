#!/bin/sh
#? downloading wordpress cli
curl -o wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp && mv wp /usr/local/bin/ && wp cli update --nightly --yes

wp core download --path=/var/www/ --allow-root 
cat /var/www/wp-config-sample.php > /var/www/wp-config.php

chown -R www-data:www-data /var/www
wp config set DB_NAME $DB_NAME --path=/var/www/ --allow-root
wp config set DB_USER $DB_USER --path=/var/www/ --allow-root
wp config set DB_PASSWORD $DB_PASS --path=/var/www/ --allow-root
wp config set DB_HOST $DB_HOST --path=/var/www/ --allow-root

/usr/sbin/php-fpm7.4 -F