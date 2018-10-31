#--18.1021-1525edt;
FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y install python-minimal virtualenv

RUN virtualenv /opt/vnp
RUN chmod 774 /opt/vnp

WORKDIR /opt/vnp

RUN /opt/vnp/bin/pip install supervisor

USER 1000

CMD /opt/vnp/bin/supervisord -c /opt/vnp/demo.conf
