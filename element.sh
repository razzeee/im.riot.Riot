#!/bin/bash

FLAGS=''

if [[ $XDG_SESSION_TYPE == "wayland" ]] && [ -c /dev/nvidia0 ]
then
    FLAGS="$FLAGS --disable-gpu-sandbox"
fi

if [[ $XDG_SESSION_TYPE == "wayland" ]]
then
    FLAGS="$FLAGS --enable-features=UseOzonePlatform,WebRTCPipeWireCapturer,WaylandWindowDecorations --ozone-platform=wayland"
fi

env TMPDIR="$XDG_RUNTIME_DIR/app/${FLATPAK_ID:-im.riot.Riot}" zypak-wrapper /app/Element/element-desktop $FLAGS "$@"