FROM debian:bullseye

EXPOSE 3306

ARG DB_DB
ARG DB_USER
ARG DB_PASS

COPY conf/50-server.cnf /ect/mysql/mariadb.conf.d/50-server.cnf
COPY ./tools/initdb.sql /db.sql

RUN apt-get update && apt-get upgrade -y && apt install mariadb-server -y
RUN sed -i "s/DB_DB/$DB_DB/g" /db.sql
RUN sed -i "s/DB_USER/$DB_USER/g" /db.sql
RUN sed -i "s/DB_PASS/$DB_PASS/g" /db.sql
RUN service mariadb start && mysql < /db.sql
RUN rm -f /db.sql

CMD ["mysqld"]