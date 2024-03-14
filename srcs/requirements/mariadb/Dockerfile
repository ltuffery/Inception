FROM alpine:3.18

EXPOSE 3306

COPY conf/50-server.cnf ~/.my.cnf
COPY --chmod=777 tools/init.sh ./init.sh

RUN apk update && apk add mariadb mariadb-client
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql --skip-test-db

CMD ["sh", "./init.sh"]