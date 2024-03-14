#!/bin/sh
if [ ! -d /run/mysqld ]; then
    mkdir -p /run/mysqld
    chown -R mysql:mysql /run/mysqld
fi

# {
#     echo "FLUSH PRIVILEGES;"
#     echo "CREATE DATABASE IF NOT EXISTS \`wordpress\`;"
#     echo "CREATE USER \`caca\`@'%' IDENTIFIED BY 'pass';"
#     echo "GRANT ALL PRIVILEGES ON \`wordpress\`.* TO \`caca\`@'%' IDENTIFIED BY 'pass';"
#     echo "FLUSH PRIVILEGES;"
# } | mysqld --bootstrap --user=mysql --datadir=/var/lib/mysql

mysqld --bootstrap --user=mysql --datadir=/var/lib/mysql <<-EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS $DB_DB;
CREATE USER $DB_USER@'%' IDENTIFIED BY '$DB_PASS';
GRANT ALL PRIVILEGES ON $DB_DB.* TO $DB_USER@'%' IDENTIFIED BY '$DB_PASS';
FLUSH PRIVILEGES;
EOF

chown -R mysql:mysql /var/lib/mysql

mysqld -umysql