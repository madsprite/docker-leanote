FROM golang:alpine
RUN apk --update add curl && \
    /usr/local/leanote-linux-amd64-v2.1.bin.tar.gz && \
    curl -L http://sourceforge.net/projects/leanote-bin/files/2.1/leanote-linux-arm.v2.1.bin.tar.gz/download >> \
    /usr/local/leanote-linux-arm-v2.1.bin.tar.gz && \
    apk del --purge curl && \
    rm -rf /var/cache/apk/*

RUN tar -xzvf /usr/local/leanote-linux-arm.v2.1.bin.tar.gz -C /usr/local

RUN mongorestore -h localhost -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/

EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]