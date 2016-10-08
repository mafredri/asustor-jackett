#!/bin/sh

NAME=Jackett
PACKAGE=jackett
PKG_PID=jackett.pid
USER=admin
GROUP=administrators

PKG_PATH=/usr/local/AppCentral/${PACKAGE}
DAEMON_USER="${USER}:${GROUP}"
PROC_PATTERN="[Jj]ackett[Cc]onsole.exe"

export PKG_CONF=${PKG_PATH}/config
