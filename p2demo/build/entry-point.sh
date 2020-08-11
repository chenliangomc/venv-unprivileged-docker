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

set +e

POD_CONF=${POD_CONF-/etc/app/demo.conf}

if [ -f $POD_CONF ]; then
    source $POD_CONF
fi

if [ -n $HOME ]; then
    if [ -d $HOME ]; then
        # enable virtualenv on-demand;
        if [ -f $HOME/bin/activate ]; then
            source $HOME/bin/activate
        fi

        # start service;
        cd $HOME ; supervisord
    else
        echo "[warn] env HOME does not exist"
    fi
else
    echo "[warn] env HOME not set"
fi

echo "[warn] enter fail-safe mode"
while true ; do
    sleep 7s
done
