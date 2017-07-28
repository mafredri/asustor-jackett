#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
	PKG_DIR=/usr/local/AppCentral/jackett
else
	PKG_DIR=$APKG_PKG_DIR
fi

case "${APKG_PKG_STATUS}" in
	install)
		;;
	upgrade)
		# Source env variables
		. "${PKG_DIR}/CONTROL/env.sh"

		# Back up configuration
		rsync -ra "$PKG_CONF/" "$APKG_TEMP_DIR/config/"

		# Back up application
		if [ -d "$PKG_DIR/Jackett" ]; then
			cp -af "$PKG_DIR/Jackett" "$APKG_TEMP_DIR/"
		fi
		;;
	*)
		;;
esac

exit 0
