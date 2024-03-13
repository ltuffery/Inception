#!/bin/sh
if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

{
    echo "FLUSH PRIVILEGES;"
    echo "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"
    echo "CREATE USER \`caca\`@'%' IDENTIFIED BY 'pass';"
    echo "GRANT ALL PRIVILEGES ON \`wordpress\`.* TO \`caca\`@'%' IDENTIFIED BY 'pass';"
    echo "FLUSH PRIVILEGES;"
} | mysqld --bootstrap --user=mysql --datadir=/var/lib/mysql

chown -R mysql:mysql /var/lib/mysql