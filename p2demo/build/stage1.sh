#!/bin/bash
# -*- sh -*-
#
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
#
# stage1.sh -- system-level configuration

set -e

export DEBIAN_FRONTEND=noninteractive

# install packages
apt-get update -f && apt-get -y -q install apt-utils auto-apt-proxy bc

apt-get -y -q install \
    procps psmisc htop mg kakoune tree rsync \
    wget curl dnsutils net-tools openssl stunnel \
    bzip2 git unzip zip xz-utils \
    python-minimal python-pip-whl virtualenv

# add unpriviliged user
nulist=/tmp/.nu.txt
rm -rf $nulist && touch $nulist
echo "$IMG_USER:$IMG_USER_PASS:$IMG_UID:$IMG_UID:app,host:$IMG_USER_HOME:/bin/bash" > $nulist
newusers $nulist
rm -f $nulist

# prepare entry-point
mkdir -p /opt/runtime ; mv $BUILD_BASE/entrty-point.sh /opt/runtime

# clean-up
rm -f $BUILD_BASE/stage1.sh
exit 0
