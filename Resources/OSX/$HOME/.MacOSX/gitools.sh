#!/bin/sh

# OSX Git Tools

if [ "$#" -eq 0 ] ; then
	exit

# Print global Git config
elif [ "$1" = "config" ] && [ "$#" -eq 2 ] ; then
	gg

# Diff Tool
elif [ "$1" = "difftool" ] && [ "$#" -eq 3 ] ; then
	if [ "$2" = "/dev/null" ] ; then
		echo FileN : $3
	else
		echo Launching bcomp
		echo FileL : $2
		echo FileR : $3
		"/usr/local/bin/bcomp" "$2" "$3"
	fi

# Merge Tool
elif [ "$1" = "mergetool" ] && [ "$#" -eq 5 ] ; then
	echo Launching bcomp
	echo LOCAL_ : $2
	echo REMOTE : $3
	echo BASE__ : $4
	echo MERGED : $5
	"/usr/local/bin/bcomp" "$2" "$3" "$4" "$5"
fi
