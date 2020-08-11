# venv-unprivileged-docker

A simple docker template for Python virtualenv running under an unprivileged UID.

## Design

Currentlt a two-stage build process is implemented:

1. system level configuration: `stage1.sh`
2. user level configuration: `stage2.sh`

## License

GNU Affero General Public License version 3 or later.

Author: Liang Chen
