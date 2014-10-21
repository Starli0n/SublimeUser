#!/bin/sh

# OSX Git Diff and Merge Tools

if [ "$#" -eq 2 ] ; then
	echo Launching bcomp:
	echo FileL : $1
	echo FileR : $2
	"/usr/local/bin/bcomp" "$1" "$2"
elif [ "$#" -eq 4 ] ; then
	echo Launching bcomp "$1" "$2" "$3" "$4"
	echo LOCAL_ : $1
	echo REMOTE : $2
	echo BASE__ : $3
	echo MERGED : $4
	"/usr/local/bin/bcomp" "$1" "$2" "$3" "$4"
fi
