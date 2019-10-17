FROM ubuntu:18.04

RUN apt-get update && apt-get install -y apache2-utils nginx nginx-extras

COPY webdav.conf /etc/nginx/conf.d/default.conf
COPY entrypoint.sh /

RUN \
    rm /etc/nginx/sites-enabled/*; \
    chmod +x entrypoint.sh; \
    apt-get clean;

VOLUME /files
EXPOSE 80

CMD /entrypoint.sh && nginx -g "daemon off;"