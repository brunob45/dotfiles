#!/usr/bin/env sh

for d in */; do
	cd $d
	printf "Fetching $d"
	git fetch --quiet
	if [ $(git rev-parse @{0}) = $(git rev-parse @{u}) ]; then
		printf "\\r$d is up to date\\n"
	else
		printf "\\r[!] $d can be updated\\n"
		git pull && makepkg -si && rm -rf src/ pkg/
	fi
	cd ..
done
