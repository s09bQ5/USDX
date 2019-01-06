#!/bin/bash

id
pwd
echo ======= Environment:
set
echo
p=$PATH
while [ -n "$p" ] ; do
	d=${p%%:*}
	echo ======= $d:
	ls -l $d
	p=${p#$d}
	p=${p#:}
done
echo
echo ======= pkg-config:
pkg-config --list-all | while read a b ; do
	echo $a `pkg-config --modversion $a` `pkg-config --cflags --libs $a`
done

exit 1
