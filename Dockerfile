FROM debian:buster-slim

LABEL maintainer="me@グルーバー.com"
LABEL org.opencontainers.image.source = "https://github.com/gruberdev/infrastructure-fivem"

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8
ENV DATA_DIR="/serverdata"
ENV SERVER_DIR="${DATA_DIR}/serverfiles"
ENV GAME_CONFIG=""
ENV SVR_ADR $FILES_URL
ENV MANUAL_UPDATES=""
ENV SERVER_KEY $SERVER_KEY
ENV ENABLE_WEBCONSOLE="true"
ENV GOTTY_PARAMS="-w --title-format FiveM"
ENV UMASK=000
ENV UID=99
ENV GID=100
ENV START_VARS=""

ENV DATA_PERM=770
ENV USER="fivem"

RUN apt-get update && \
 apt-get -y install --no-install-recommends wget locales procps xz-utils unzip screen && \
 touch /etc/locale.gen && \
 echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && \
 locale-gen && \
 apt-get -y install --reinstall ca-certificates && \
 rm -rf /var/lib/apt/lists/*

RUN wget -O /tmp/gotty.tar.gz https://github.com/yudai/gotty/releases/download/v1.0.1/gotty_linux_amd64.tar.gz && \
 tar -C /usr/bin/ -xvf /tmp/gotty.tar.gz && \
 rm -rf /tmp/gotty.tar.gz

RUN mkdir $DATA_DIR && \
 mkdir $SERVER_DIR && \
 useradd -d $SERVER_DIR -s /bin/bash $USER && \
 chown -R $USER $DATA_DIR && \
 ulimit -n 2048

ADD /resources/scripts/ /opt/scripts/
ADD /resources/config /serverdata/serverfiles 
RUN chmod -R 770 /opt/scripts/

ARG FILES_URL=https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/
ENTRYPOINT ["/opt/scripts/start.sh"]
