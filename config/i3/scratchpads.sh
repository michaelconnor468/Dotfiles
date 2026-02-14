#!/bin/sh
case $1 in
    *)
        if ! xdotool search --class $1; then
            alacritty --class $1 &
            sleep 0.2
        fi
        i3-msg "[instance=$1] scratchpad show; [instance=$1] move position center"
esac
