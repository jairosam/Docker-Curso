FROM ubuntu

RUN apt-get update

RUN apt-get install -y nginx

VOLUME [ "/var/www/html/" ]

#ARG webpage

COPY web /var/www/html/

ENTRYPOINT [ "/usr/sbin/nginx", "-g", "daemon off;" ]

EXPOSE 80