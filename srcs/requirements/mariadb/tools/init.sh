#!/bin/sh
if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/my.cnf.d/mariadb-server.cnf

sed -i "s|.*skip-networking.*|skip-networking=OFF|g" /etc/my.cnf
sed -i "s|.*skip-networking.*|skip-networking=OFF|g" /etc/my.cnf.d/mariadb-server.cnf

mysqld --bootstrap --user=mysql --datadir=/var/lib/mysql <<-EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_DB;
CREATE USER IF NOT EXISTS $DB_USER@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_DB.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
EOF

chown -R mysql:mysql /var/lib/mysql

mysqld -umysql --port=3306