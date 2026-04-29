FROM nginx

RUN apt-get update && \
    apt-get install -y \
        gcc \
        spawn-fcgi \
        libfcgi-dev

COPY ./hello.c /home/
COPY ./run.sh /home/
COPY ./nginx/nginx.conf /etc/nginx/

WORKDIR /home

ENTRYPOINT ["sh", "./run.sh"]