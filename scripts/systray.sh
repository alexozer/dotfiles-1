#!/usr/bin/env bash

function run() {
    trayer \
      --expand true \
      --edge top \
      --align right \
      --margin 0 \
      --widthtype request \
      --height $PANEL_HEIGHT \
      --transparent true \
      --alpha 0 \
      --tint 0x$(xrdb -query | grep background | cut -f2 | head -1 | sed 's/#//g') &
}

function stop() {
    pkill trayer
}

if [ "$1" = "run" ]; then
    run
else
    stop
fi
