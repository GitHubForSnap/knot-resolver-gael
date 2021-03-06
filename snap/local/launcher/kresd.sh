#!/bin/bash

$SNAP/usr/sbin/kresd -c /usr/lib/knot-resolver/distro-preconfig.lua -c /etc/knot-resolver/kresd.conf -n
