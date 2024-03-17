#!/bin/sh

if [ ! -f "wp-config.php" ]; then
    wp core download --allow-root
    wp config create --dbname="$DB_DB" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost="$DB_HOST":"$DB_PORT" --allow-root
    wp core install --url="$WP_ADMIN_USER.42.fr" --title="$WP_ADMIN_USER inception website" --admin_user="$WP_ADMIN_USER" --admin_password="$WP_ADMIN_PASS" --admin_email="$WP_ADMIN_USER@student.42angouleme.fr" --allow-root
    wp user create $WP_DEFAULT_USER "$WP_DEFAULT_USER"@randomuser.com --role='subscriber' --user_pass="$WP_DEFAULT_PASS" --allow-root
fi

exec /usr/sbin/php-fpm7.4 -F