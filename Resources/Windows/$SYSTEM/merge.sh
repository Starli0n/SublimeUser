#!/bin/sh

# Windows Git Diff and Merge Tools

if [ "$#" -eq 2 ] ; then
	echo Launching WinMergeU.exe
	echo FileL : $1
	echo FileR : $2
	"C:\Program Files (x86)\WinMerge\WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$1" "$2"
elif [ "$#" -eq 4 ] ; then
	echo Launching BCompare.exe
	echo LOCAL_ : $1
	echo REMOTE : $2
	echo BASE__ : $3
	echo MERGED : $4
	BCompare.exe "$1" "$2" "$3" "$4"
fi
