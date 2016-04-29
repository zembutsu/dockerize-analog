FROM ubuntu:14.04
MAINTAINER Masahito Zembutsu <m.zembutsu@gmail.com> (@zembutsu)

RUN mkdir -p /tmp/analog && \
    apt-get update && \
    apt-get install -y make gcc wget

RUN cd /tmp/analog && \
    wget -O analog-6.0.tar.gz ftp://ftp.naist.jp/pub/sunfreeware/SOURCES/analog-6.0.tar.gz && \
    tar xfz analog-6.0.tar.gz

RUN cd /tmp/analog/analog-6.0 && \
    make DEFS='-DLANGDIR=\"/opt/analog/lang/\"' && \
    mkdir -p /opt/analog && \
    cp -r lang /opt/analog/ && \
    mv ./analog /usr/bin/analog && \
    rm -rf /tmp/analog

COPY analog.cfg /opt/analog/analog.cfg

# VOLUME ["/opt/analog/html/", "/opt/analog/data/"]

CMD ["+g/opt/analog/analog.cfg"]
ENTRYPOINT ["/usr/bin/analog","-G"]
