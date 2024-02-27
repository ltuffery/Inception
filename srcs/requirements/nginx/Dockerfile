FROM alpine:3.18

RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"

RUN apk update && apk add nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/nginx.conf

CMD ["nginx", "-g", "daemon off;"]
