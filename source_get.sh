#!/bin/bash

cd /src

# Clean up old build
rm -rf /src/traccar
rm /src/traccar_version

# Ask what to clone
read -p "Get specific GIT tag (y/n)? (recommended for stability): " yn
if [ "$yn" == "y" ]; then
	read -p "Git TAG name (eg. v5.3 remember to include the v): " TRACCAR_VERSION

	# Git clone Traccar with specific tag
	git clone -b $TRACCAR_VERSION --single-branch https://github.com/traccar/traccar.git
	cd traccar/
	git clone -b $TRACCAR_VERSION --single-branch https://github.com/traccar/traccar-web.git
	echo 'TRACCAR_VERSION="'"$TRACCAR_VERSION"'"' > /src/traccar_version
else
	# Git clone Traccar, latest master
	git clone https://github.com/traccar/traccar.git
	cd traccar/
	git clone https://github.com/traccar/traccar-web.git
	echo 'TRACCAR_VERSION="'"LASTEST_MASTER"'"' > /src/traccar_version
fi