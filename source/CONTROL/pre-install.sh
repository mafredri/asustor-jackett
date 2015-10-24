#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
    PKG_DIR=/usr/local/AppCentral/jackett
else
    PKG_DIR=$APKG_PKG_DIR
fi

# Source env variables
. "${PKG_DIR}/CONTROL/env.sh"

case "${APKG_PKG_STATUS}" in
    install)
        ;;
    upgrade)
        # Back up configuration
        rsync -ra "$PKG_CONF/" "$APKG_TEMP_DIR/config/"

        # Back up application
        # Not required at this moment
        # if [ -d "$PKG_DIR/Jackett" ]; then
        #     cp -af "$PKG_DIR/Jackett" "$APKG_TEMP_DIR/"
        # fi
        ;;
    *)
        ;;
esac

exit 0
