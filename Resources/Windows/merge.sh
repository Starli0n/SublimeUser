#!/bin/sh

# Windows Git Diff and Merge Tools

if [ "$#" -eq 2 ] ; then
	echo Launching WinMergeU.exe "$1" "$2"
	"C:\Program Files (x86)\WinMerge\WinMergeU.exe" -e -ub -dl "Base" -dr "Mine" "$1" "$2"
elif [ "$#" -eq 4 ] ; then
	echo Launching BCompare.exe "$1" "$2" "$3" "$4"
	BCompare.exe "$1" "$2" "$3" "$4"
fi
