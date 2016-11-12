FROM golang:alpine
MAINTAINER MadSprite <contactme@madsprite.com>

ADD leanote-linux-arm.v2.1.bin.tar.gz /usr/local/leanote-linux-arm.v2.1.bin.tar.gz

RUN tar -xzvf /usr/local/leanote-linux-arm.v2.1.bin.tar.gz -C /usr/local

RUN tar -xzvf /usr/local/leanote-linux-arm-v2.1.bin.tar.gz -C /usr/local

RUN mongorestore -h localhost -d leanote --dir /usr/local/leanote/mongodb_backup/leanote_install_data/

EXPOSE 9000
WORKDIR  /usr/local/leanote/bin
ENTRYPOINT ["sh","run.sh"]