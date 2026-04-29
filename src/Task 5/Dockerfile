FROM debian:bullseye

RUN apt-get update && \
    apt-get install -y nginx gcc spawn-fcgi libfcgi-dev findutils curl && \
    find /bin /sbin /usr/bin /usr/sbin -perm /6000 -type f -exec chmod a-s {} + && \
    rm -rf /var/lib/apt/lists/*

COPY ./hello.c /home/
COPY ./run.sh /home/
COPY ./nginx/nginx.conf /etc/nginx/

RUN useradd -m appuser
USER appuser

WORKDIR /home

HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost/ || exit 1

ENTRYPOINT ["sh", "./run.sh"]