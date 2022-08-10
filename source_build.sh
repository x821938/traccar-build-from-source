#!/bin/bash

cd /src


if test -f "/src/traccar_version"; then
	# Prepare java
	export PATH="/src/java/jdk/bin:$PATH"

	# Get version into var TRACCAR_VERSION
	. /src/traccar_version

	# Build Server backend
	cd /src/traccar
	./gradlew assemble

	# Build modern web interface
	cd /src/traccar/traccar-web/modern
	npm install
	npm run build

	# Create Installer
	cd /src/traccar/setup
	cp /src/java/OpenJDK17U-jdk_x64_linux_hotspot_17.0.4_8.tar.gz .
	cp /src/java/jdk-11.0.15-ojdkbuild-linux-x64.zip .
	./package.sh $TRACCAR_VERSION linux-64

	# Save it in output built dir
	cp traccar*.zip /src/built
else
	echo "Please run source_get.sh first!"
fi