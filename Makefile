#!/usr/bin/make -c
# -*- makefile -*-
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
# Makefile -- build script

PKG_NAME ?= simple

IMG_DIR ?= py3base

IMG_NAME ?= simple-py-app
IMG_LABEL ?= demo

IMG_BUILD_ARGS ?= --build-arg IMG_UID=`id -u`

POD_ARGS ?= -p 8080:8080 -p 8443:8443


clean:
	@py3clean $(PKG_NAME)

image: package
	@cp simplewebapp*.deb $(IMG_DIR)/$(PKG_NAME).deb
	@docker build -t $(IMG_NAME):$(IMG_LABEL) $(IMG_BUILD_ARGS) $(IMG_DIR)

package:
	@cd $(PKG_NAME) ; bash build.sh

run:
	@docker run -it --rm $(POD_ARGS) $(IMG_NAME):$(IMG_LABEL)


-include: local.mk
