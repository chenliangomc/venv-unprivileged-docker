#--18.1021-1701edt;
FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y install procps psmisc mg wget dnsutils net-tools python-minimal virtualenv

RUN adduser --uid 1000 --home /opt/vnp  vp

ADD ./etc /opt/vnp/etc
RUN chown -R 1000:1000 /opt/vnp/etc

USER 1000
RUN virtualenv /opt/vnp

WORKDIR /opt/vnp
RUN mkdir -p /opt/vnp/temp

RUN /opt/vnp/bin/pip install supervisor

CMD /opt/vnp/bin/supervisord -c /opt/vnp/etc/supervisord.conf
