#!/bin/sh

if [ -z "$APKG_PKG_DIR" ]; then
	PKG_DIR=/usr/local/AppCentral/jackett
else
	PKG_DIR=$APKG_PKG_DIR
fi

# Source env variables
. "${PKG_DIR}/CONTROL/env.sh"

install_jackett() {
	tar xzf "$PKG_DIR"/.release/*.tar.gz -C "$PKG_DIR/"

	# Make sure configuration directory exists
	if [ ! -d "$PKG_CONF" ]; then
		mkdir "$PKG_CONF"
	fi
}

case "${APKG_PKG_STATUS}" in
	install)
		install_jackett
		;;
	upgrade)
		if [ -d "$APKG_TEMP_DIR/config" ]; then
			rsync -ra "$APKG_TEMP_DIR/config/" "$PKG_CONF/"
		fi

		# Restore application or extract included version
		if [ -d "$APKG_TEMP_DIR/Jackett" ]; then
			cp -af "$APKG_TEMP_DIR/Jackett" "$PKG_DIR/"
		else
			install_jackett
		fi

		# Compatibility
		# Make sure any old processes are stopped
		pid="$(pgrep -f "[Jj]ackett[Cc]onsole.exe")"
		if [ -n "$pid" ]; then
			for p in $pid; do
				kill "$p"
			done
		fi
		;;
	*)
		;;
esac

# Create symlink from config -> .config (replicates $HOME/.config).
if [ ! -e "${PKG_DIR}/.config" ]; then
	ln -s "${PKG_CONF}" "${PKG_DIR}/.config"
fi

chown -R "$DAEMON_USER" "$PKG_CONF"
chown -R "$DAEMON_USER" "$PKG_DIR/Jackett"

exit 0
