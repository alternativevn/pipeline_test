FROM alpine:lastest

ENV TZ=Europe/Minsk
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 80

RUN apt-get update && apt install -y awscli tree
RUN apt-get install nginx -y

COPY index.html /var/www/html/

CMD ["nginx", "-g", "daemon off;"]
