#!/bin/bash

# Substitute XDG_CONFIG_HOME by ~/.config if the env var is unset or empty
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-~/.config}
FLAG_FILE="electron-flags.conf"

# Allow users to override command-line options
if [[ -f "${XDG_CONFIG_HOME}/${FLAG_FILE}" ]]; then
    mapfile -t USER_FLAGS <<< "$(grep -v '^#' "${XDG_CONFIG_HOME}/${FLAG_FILE}")"
    echo "User flags:" "${USER_FLAGS[@]}"
fi

# Set APPDIR to the directory containing the AppRun script
APPDIR="/opt/cursor/squashfs-root"
export APPDIR

# Launch app with the given flags
exec "${APPDIR}/AppRun" "${USER_FLAGS[@]}" "$@"
