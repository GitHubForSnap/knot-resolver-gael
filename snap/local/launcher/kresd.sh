#!/bin/bash

$SNAP/usr/sbin/kresd -c $SNAP/usr/lib/knot-resolver/distro-preconfig.lua -c $SNAP_DATA/kresd.conf -n
