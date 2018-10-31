#--18.1021-1614edt;
FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y install procps psmisc mg wget dnsutils net-tools python-minimal virtualenv

RUN adduser --uid 1000 --home /opt/vnp  vp

USER 1000
RUN virtualenv /opt/vnp

WORKDIR /opt/vnp
RUN mkdir -p /opt/vnp/temp

RUN /opt/vnp/bin/pip install supervisor

RUN echo "[supervisord]" > /opt/vnp/demo.conf
RUN echo "nodaemon=true" >> /opt/vnp/demo.conf
RUN echo "childlogdir=/opt/vnp/temp" >> /opt/vnp/demo.conf

RUN echo "[rpcinterface:supervisor]" >> /opt/vnp/demo.conf
RUN echo "supervisor.rpcinterface_factory=supervisor.rpcinterface:make_main_rpcinterface" >> /opt/vnp/demo.conf

RUN echo "[unix_http_server]" >> /opt/vnp/demo.conf
RUN echo "file=/opt/vnp/temp/supervisor.sock" >> /opt/vnp/demo.conf

RUN echo "[supervisorctl]" >> /opt/vnp/demo.conf
RUN echo "serverurl=unix:///opt/vnp/temp/supervisor.sock" >> /opt/vnp/demo.conf

CMD /opt/vnp/bin/supervisord -c /opt/vnp/demo.conf
