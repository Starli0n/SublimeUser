#!/bin/sh

# Windows Git Tools

BASEDIR=$(dirname $0)

if [ "$#" -eq 0 ] ; then
	exit

# Shell Git
elif [ "$1" = "shell" ] ; then
	$2 $3 $4 $5 $6 $7 $8 $9

# Print global Git config
elif [ "$1" = "config" ] && [ "$#" -eq 2 ] ; then
	PYBIN=`which python`
	error=0
	if [ -z "$PYBIN" ]; then
		error=1
	else
		ANYBIN=${BASEDIR}/../../Any/bin
		if [ ! -f "${ANYBIN}/colorcfg.pyc" ]; then
			"$PYBIN" -m py_compile "${ANYBIN}/colorcfg.py"
		fi
		"$PYBIN" "${ANYBIN}/colorcfg.pyc" "${HOMEDRIVE}${HOMEPATH}.gitconfig"
		error=$?
	fi

	if [ "$error" -ne 0 ]; then
		cat "${HOMEDRIVE}${HOMEPATH}.gitconfig"
		echo Error=$error
	fi

# Diff Tool
elif [ "$1" = "difftool" ] && [ "$#" -eq 3 ] ; then
	echo Launching WinMergeU.exe
	echo FileL : $2
	echo FileR : $3
	"C:\Program Files (x86)\WinMerge\WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$2" "$3"

# Merge Tool
elif [ "$1" = "mergetool" ] && [ "$#" -eq 5 ] ; then
	echo Launching BCompare.exe
	echo LOCAL_ : $2
	echo REMOTE : $3
	echo BASE__ : $4
	echo MERGED : $5
	BCompare.exe "$2" "$3" "$4" "$5"
fi
