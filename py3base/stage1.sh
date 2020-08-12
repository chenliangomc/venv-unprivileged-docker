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
# stage1.sh -- system level configuration

set -e

export DEBIAN_FRONTEND=noninteractive

RELNAME=`grep 'VERSION_CODENAME' /etc/os-release | awk -F'=' '{print $2}'`

echo "deb http://security.debian.org/ $RELNAME/updates main" >> /etc/apt/sources.list
sed -i 's/main$/main contrib non-free/g' /etc/apt/sources.list
apt-get update -f
apt-get -y install apt-utils bc auto-apt-proxy

apt-get -y -q install $BUILD_BASE/$PKG_NAME.deb
if [ $? -eq 0 ]; then
    rm -rf $BUILD_BASE/$PKG_NAME.deb
else
    echo '[fatal] package install failed. Abort'
    exit 1
fi

if [ "x$WITH_NGINX" != "x" ]; then
    apt-get install -y -qq nginx-full
fi
apt-get clean

IMG_USER_HOME=${IMG_USER_HOME-/home/$IMG_USER}
echo "$IMG_USER:$IMG_USER_PASS:$IMG_UID:$IM_UID:default,app,host:$IMG_USER_HOME:/bin/bash" | newusers

mkdir -p $RUNTIME_BASE
ln -s /usr/share/$PKG_NAME/entry-point.sh $RUNTIME_BASE/entry-point.sh

rm -rf $BUILD_BASE/stage1.sh
exit 0
