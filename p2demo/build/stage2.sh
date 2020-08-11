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
# stage2.sh -- user-level configuration

set -e

virtualenv -p `which python` $IMG_USER_HOME

(set -e ; source $IMG_USER_HOME/bin/activate ; pip install --no-cache -U -r $IMG_USER_HOME/etc/pip-list.txt ; deactivate; exit 0)

mkdir -p $IMG_USER_HOME/{etc,logs,tmp}

exit 0
