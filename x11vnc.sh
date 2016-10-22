#!/bin/sh
exec /usr/bin/x11vnc -v -forever -xkb -noclipboard -nosetclipboard -nopw -display :0 -auth /home/monaka/.Xauthority
