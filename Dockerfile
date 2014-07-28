FROM xforty/boot2docker-9p-builder
MAINTAINER xforty technologies "xforty.com"

RUN /root/build9p.sh 1.0.0 1.0.1 1.1.0 1.1.1 1.1.2

CMD ["/root/install.sh"]

VOLUME /data

ADD install.sh /root/install.sh
