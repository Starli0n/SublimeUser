#!/bin/sh

# Windows Git Tools

BASEDIR=$(dirname $0)

# Print global Git config
if [ "$#" -eq 1 ] ; then
	which python > /dev/null 2>&1
	if [ "$?" -eq 0 ] && [ -f "${BASEDIR}/colorcfg.py" ]; then
		if [ ! -f "${BASEDIR}/colorcfg.pyc" ]; then
			python -m py_compile "${BASEDIR}/colorcfg.py"
		fi
		python "${BASEDIR}/colorcfg.pyc" "${HOMEDRIVE}${HOMEPATH}.gitconfig"
	else
		cat "${HOMEDRIVE}${HOMEPATH}.gitconfig"
	fi

# Diff Tool
elif [ "$#" -eq 2 ] ; then
	echo Launching WinMergeU.exe
	echo FileL : $1
	echo FileR : $2
	"C:\Program Files (x86)\WinMerge\WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$1" "$2"

# Merge Tool
elif [ "$#" -eq 4 ] ; then
	echo Launching BCompare.exe
	echo LOCAL_ : $1
	echo REMOTE : $2
	echo BASE__ : $3
	echo MERGED : $4
	BCompare.exe "$1" "$2" "$3" "$4"
fi
