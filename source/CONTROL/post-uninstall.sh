#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
	PKG_DIR=/usr/local/AppCentral/jackett
else
	PKG_DIR=$APKG_PKG_DIR
fi

exit 0
