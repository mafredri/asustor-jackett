#!/bin/sh

NAME=Jackett
PACKAGE=jackett
PKG_PID=jackett.pid
USER=admin
GROUP=administrators

PKG_PATH=/usr/local/AppCentral/${PACKAGE}
DAEMON_USER="${USER}:${GROUP}"

PKG_CONF_SYM=/volume1/home/admin/.config/Jackett

export PKG_BIN_PATH=${PKG_PATH}/bin
export PKG_LD_LIBRARY_PATH=$PKG_PATH/lib
export PKG_CONF_ROOT=${PKG_PATH}/config
export PKG_CONF=${PKG_CONF_ROOT}

export LD_LIBRARY_PATH=${PKG_LD_LIBRARY_PATH}:${LD_LIBRARY_PATH}
