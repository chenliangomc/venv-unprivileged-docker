#--18.1021-1610edt;
FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN apt-get update && apt-get -y install apt-utils

RUN apt-get -y install procps psmisc mg wget dnsutils net-tools python-minimal virtualenv

RUN mkdir -p /opt/vnp
RUN chmod 774 /opt/vnp

USER 1000
RUN virtualenv /opt/vnp

WORKDIR /opt/vnp

RUN /opt/vnp/bin/pip install supervisor

RUN echo "[supervisord]" > /opt/vnp/demo.conf
RUN echo "nodaemon=true" >> /opt/vnp/demo.conf

RUN echo "[rpcinterface:supervisor]" >> /opt/vnp/demo.conf
RUN echo "supervisor.rpcinterface_factory=supervisor.rpcinterface:make_main_rpcinterface" >> /opt/vnp/demo.conf

RUN echo "[supervisorctl]" >> /opt/vnp/demo.conf
RUN echo "serverurl=unix:///var/tmp/supervisor.sock" >> /opt/vnp/demo.conf

CMD /opt/vnp/bin/supervisord -c /opt/vnp/demo.conf
