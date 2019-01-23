#  Copyright 2018 Liang Chen <liangchenomc@gmail.com>
#
#  This file is part of venv-unprivileged-docker.
#
#  venv-unprivileged-docker is free software: you can redistribute it
#  and/or modify it under the terms of the GNU Affero General Public License
#  as published by the Free Software Foundation, either version 3 of
#  the License, or (at your option) any later version.
#
#  venv-unprivileged-docker is distributed in the hope that it will be
#  useful, but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU Affero General Public License for more details.
#
#  You should have received a copy of the GNU Affero General Public License
#  along with venv-unprivileged-docker.
#  If not, see <https://www.gnu.org/licenses/>.

FROM debian:testing
MAINTAINER Liang Chen "liangchenomc@gmail.com"

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get -y install apt-utils

RUN DEBIAN_FRONTEND=noninteractive apt-get -y install \
    procps psmisc mg \
    wget dnsutils net-tools \
    python-minimal virtualenv

RUN adduser --uid 1000 --home /opt/vnp  vp

ADD ./etc /opt/vnp/etc
RUN chmod a+x /opt/vnp/etc/*.sh
RUN chown -R 1000:1000 /opt/vnp/etc

USER 1000
RUN virtualenv /opt/vnp

WORKDIR /opt/vnp
RUN mkdir -p /opt/vnp/temp

RUN /opt/vnp/bin/pip install -r etc/pip-list.txt

CMD /opt/vnp/etc/entry-point.sh
