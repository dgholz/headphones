FROM debian:jessie

MAINTAINER Daniel Holz <dgholz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --quiet=2
RUN apt-get install --quiet=2 python git
RUN apt-get install --quiet=2 shntool libav-tools

RUN mkdir -p /headphones/config
RUN /bin/bash -c "mkdir -p /headphones/{torrent,usenet}/{blackhole,download}"
RUN mkdir -p /headphones/music

EXPOSE 8181

RUN mkdir -p /opt/headphones
RUN git clone https://github.com/rembo10/headphones /opt/headphones

CMD [ "--datadir", "/headphones/config", "--nolaunch" ]
ENTRYPOINT [ "/opt/headphones/Headphones.py" ]
