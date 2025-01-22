#!/bin/bash


function help
{
	echo "Usage: ${0##*/} [-h|--help]	Show this menu"
	echo "Usage: ${0##*/} [OPTIONS] INPUT_FILE OUTPUT_FILE"
}


if [ $# == 0 -o "$1" == "-h" -o "$1" == "--help" ]; then
	help
	exit 0
fi

until [ -z "$1" ]; do
	if [ -n "$(grep '^-' <<< $1)" ]
	then
		opts=$opts"$1 "
	else
		args=$args"$1 "
	fi
	shift
done

if [ $(wc -w <<< $args) -lt 2 ]; then
	echo "Argument error"
	help
	exit 1
fi

read if of <<< $args

if [ -a $if ]; then
	sha256sum $opts $if > $of
	exit 0
else
	echo "${0##*/}: $if: No such file or directory"
	exit 1
fi

