#!/bin/sh
exec /usr/bin/x11vnc -v -forever -nopw -display :0 -auth /home/monaka/.Xauthority
