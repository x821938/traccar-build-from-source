FROM ubuntu

WORKDIR /src

# Required packages
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y zip makeself git nodejs wget vim nano

# Get java
RUN mkdir java
WORKDIR /src/java
RUN wget https://github.com/adoptium/temurin17-binaries/releases/download/jdk-17.0.4%2B8/OpenJDK17U-jdk_x64_linux_hotspot_17.0.4_8.tar.gz
RUN wget https://github.com/ojdkbuild/contrib_jdk11u-ci/releases/download/jdk-11.0.15%2B10/jdk-11.0.15-ojdkbuild-linux-x64.zip
RUN tar -xvzf OpenJDK17U-jdk_x64_linux_hotspot_17.0.4_8.tar.gz
RUN mv jdk-17.0.4+8 jdk

# Copy build script
COPY source*.sh /src
RUN mkdir /src/built

WORKDIR /src
