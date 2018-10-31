#--18.1021-1701edt;
FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y install procps psmisc mg wget dnsutils net-tools python-minimal virtualenv

RUN adduser --uid 1000 --home /opt/vnp  vp

USER 1000
RUN virtualenv /opt/vnp

WORKDIR /opt/vnp
RUN mkdir -p /opt/vnp/etc /opt/vnp/temp

RUN /opt/vnp/bin/pip install supervisor

RUN echo "[supervisord]" > /opt/vnp/etc/supervisord.conf
RUN echo "nodaemon=true" >> /opt/vnp/etc/supervisord.conf
RUN echo "childlogdir=/opt/vnp/temp" >> /opt/vnp/etc/supervisord.conf

RUN echo "[rpcinterface:supervisor]" >> /opt/vnp/etc/supervisord.conf
RUN echo "supervisor.rpcinterface_factory=supervisor.rpcinterface:make_main_rpcinterface" >> /opt/vnp/etc/supervisord.conf

RUN echo "[unix_http_server]" >> /opt/vnp/etc/supervisord.conf
RUN echo "file=/opt/vnp/temp/supervisor.sock" >> /opt/vnp/etc/supervisord.conf

RUN echo "[supervisorctl]" >> /opt/vnp/etc/supervisord.conf
RUN echo "serverurl=unix:///opt/vnp/temp/supervisor.sock" >> /opt/vnp/etc/supervisord.conf

CMD /opt/vnp/bin/supervisord -c /opt/vnp/etc/supervisord.conf
