FROM alpine:lastest

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 80

RUN apk add --no-cache aws-cli
RUN apk add nginx

COPY index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
