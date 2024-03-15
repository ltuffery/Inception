FROM debian:bullseye

EXPOSE 443

RUN apt-get update && apt-get upgrade -y && apt-get install nginx openssl -y

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -subj "/C=FR/ST=FRANCE/L=Angouleme/O=42/OU=42/CN=ltuffery" -keyout /etc/nginx/ssl/ltuffery.key -out /etc/nginx/ssl/ltuffery.crt

COPY --chmod=777 conf/nginx.conf /etc/nginx

CMD ["nginx", "-g", "daemon off;"]
