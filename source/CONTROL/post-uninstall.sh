#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
    PKG_DIR=/usr/local/AppCentral/jackett
else
    PKG_DIR=$APKG_PKG_DIR
fi

# Source env variables
. "${PKG_DIR}/CONTROL/env.sh"

if readlink "$PKG_CONF_SYM" >/dev/null; then
    rm "$PKG_CONF_SYM"
fi

exit 0
