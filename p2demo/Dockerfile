#  Copyright 2018, 2019, 2020 Liang Chen <liangchenomc@gmail.com>
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

FROM debian:buster
MAINTAINER Liang Chen "liangchenomc@gmail.com"

ARG BUILD_BASE=/opt/build
ARG IMG_UID=1000
ARG IMG_USER=appuser
ARG IMG_USER_HOME=/home/$IMG_USER
ARG IMG_USER_PASS

COPY ./build  $BUILD_BASE

RUN bash $BUILD_BASE/stage1.sh

USER $IMG_UID
WORKDIR $IMG_USER_HOME
COPY ./etc $IMG_USER_HOME/etc
RUN bash $BUILD_BASE/stage2.sh

ENTRYPOINT ["/bin/bash", "/opt/runtime/entry-point.sh"]
