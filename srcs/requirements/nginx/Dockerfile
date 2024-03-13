FROM debian:bullseye

EXPOSE 443

RUN apt-get update && apt-get upgrade -y && apt-get install nginx openssl -y

RUN mkdir -p /ect/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=FRANCE/L=Angouleme/O=42/OU=42/CN=ltuffery" -newkey rsa:4096 -keyout /ect/ssl/ltuffery.key -out /ect/ssl/ltuffery.crt

COPY ./conf/default /etc/nginx/sites-enabled/default

CMD ["nginx", "-g", "daemon off;"]
