FROM debian:bullseye

EXPOSE 9000

# install base
RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y php7.4 php-fpm php-mysqli mariadb-client
RUN apt-get install -y curl wget

# Setup la conf de php-fpm
COPY ./conf/www.conf /ect/php/7.4/fpm/pool.d/
RUN mkdir -p /run/php

# install wp (wordpress cli)
RUN wget "https://github.com/wp-cli/wp-cli/releases/download/v2.10.0/wp-cli-2.10.0.phar"
RUN chmod +x wp-cli*
RUN mv wp-cli* /usr/local/bin/wp

# create wordpress working dirctory
RUN mkdir -p /var/www/wordpress
WORKDIR /var/www/wordpress
COPY ./tools/init.sh ./init.sh
RUN chmod +x init.sh

CMD ["/var/www/wordpress/init.sh"]