#!/bin/sh

# OSX Git Tools

if [ "$#" -eq 0 ] ; then
	exit

# Diff Tool
elif [ "$1" = "difftool" ] && [ "$#" -eq 3 ] ; then
	echo Launching bcomp
	echo FileL : $2
	echo FileR : $3
	"/usr/local/bin/bcomp" "$2" "$3"

# Merge Tool
elif [ "$1" = "mergetool" ] && [ "$#" -eq 5 ] ; then
	echo Launching bcomp
	echo LOCAL_ : $2
	echo REMOTE : $3
	echo BASE__ : $4
	echo MERGED : $5
	"/usr/local/bin/bcomp" "$2" "$3" "$4" "$5"
fi
