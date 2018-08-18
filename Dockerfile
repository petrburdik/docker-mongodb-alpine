# *****************************************************************************
# mongodb
#
# - package based on alpinelinux and compatible with grsec
#
# *****************************************************************************
FROM alpine:3.8

LABEL	maintainer="Petr Burdik, Sunset Media s.r.o. <petr.burdik@me.com>" \
    description="Alpine linux 3.8, Mongodb 4.0" \
    version="1.0"

ENV	ALPINE_LINUX_VERSION 3.8 \
    ENV MONGO_MAJOR 4.0 \
    ENV MONGO_VERSION 4.0.0

EXPOSE	27017

RUN echo "@edge http://dl-3.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories && \
    echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update upgrade && \
    apk add --no-cache bash && \
    apk add --no-cache boost-system@edge && \
    apk add --no-cache boost-filesystem@edge && \
    apk add --no-cache boost-iostreams@edge && \
    apk add --no-cache boost-program_options@edge && \
    apk add --no-cache mongodb && \
    apk add --no-cache mongodb-tools

RUN mkdir -p /data/db /data/configdb /data/backup \
    && chown -R mongodb:mongodb /data/

COPY [ "docker-entrypoint.sh", "/docker-entrypoint.sh" ]

VOLUME /data/db /data/configdb /data/backup

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD [ "mongod", "--bind_ip", "0.0.0.0" ]

