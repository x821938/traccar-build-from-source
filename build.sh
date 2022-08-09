#!/bin/bash

cd /src

# Prepare java
export PATH="/src/jdk/bin:$PATH"

# Clean up old build
rm -rf /src/traccar

cd /src
git clone https://github.com/traccar/traccar.git
cd traccar/
git clone https://github.com/traccar/traccar-web.git

# Build Server backend
cd /src/traccar
./gradlew assemble

# Build modern web interface
cd /src/traccar/traccar-web/modern
npm install
npm run build

# Create Installer
cd /src/traccar/setup
cp /src/jdk-11.0.15-ojdkbuild-linux-x64.zip .
./package.sh VERSION linux-64

# Save it in output built dir
cp traccar*.zip /src/built
