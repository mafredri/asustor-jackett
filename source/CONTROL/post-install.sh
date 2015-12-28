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

    # Make sure .config exists
    parent_dir="$(dirname "$PKG_CONF_SYM")"
    if [ ! -d "$parent_dir" ]; then
        mkdir "$parent_dir"
        chown -R "$DAEMON_USER" "$parent_dir"
    fi

    # Create symlink
    if [ ! -e "$PKG_CONF_SYM" ]; then
        ln -s "$PKG_CONF" "$PKG_CONF_SYM"
    fi

    chown -R "$DAEMON_USER" "$PKG_CONF_SYM"
}

case "${APKG_PKG_STATUS}" in
    install)
        if [ ! -f "$PKG_CONF/config.xml" ]; then
            cp "$PKG_CONF/config_base.xml" "$PKG_CONF/config.xml"
        fi

        install_jackett
        ;;
    upgrade)
        rsync -ra "$APKG_TEMP_DIR/config/" "$PKG_CONF/"

        # Restore application or extract included version
        # if [ -d "$APKG_TEMP_DIR/Jackett" ]; then
        #     cp -af "$APKG_TEMP_DIR/Jackett" "$PKG_DIR/"
        # else
        #     install_jackett
        # fi
        install_jackett
        ;;
    *)
        ;;
esac

chown -R "$DAEMON_USER" "$PKG_DIR/Jackett"

exit 0
