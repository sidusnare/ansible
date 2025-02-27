#!/bin/bash

while read -r line;do
	flags=()
	pkg="$( cut -d ' ' -f 1 <<< "${line}" )"
	for flag in $( cut -d ' ' -f 2- <<< "${line}" );do
		flags+=( "${flag}" )
	done
	sflags="$( printf "%s\n" "${flags[@]}" | sort -u | tr '\n' ' ' )"
	echo "${pkg} ${sflags}" | sed -e 's/  *$//'
done < <( sed -e 's/  */ /g' -e 's/^  *//' -e 's/  *$//' use | sort ) > use.tmp
mv -v use.tmp use
