FROM debian:jessie

MAINTAINER Daniel Holz <dgholz@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update --quiet=2
RUN apt-get install --quiet=2 python git

RUN mkdir -p /headphones/config

EXPOSE 8181

RUN mkdir -p /opt/headphones
RUN git clone https://github.com/rembo10/headphones /opt/headphones

CMD [ "--datadir", "/headphones/config", "--nolaunch" ]
ENTRYPOINT [ "/opt/headphones/Headphones.py" ]
