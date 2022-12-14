FROM alpine:latest

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 80

RUN apt-get install nginx -y

COPY index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
