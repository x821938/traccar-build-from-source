FROM ubuntu

WORKDIR /src

# Required packages
RUN apt-get update && apt-get install -y curl
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y zip makeself git nodejs wget vim

# Get java
RUN wget https://github.com/ojdkbuild/contrib_jdk11u-ci/releases/download/jdk-11.0.15%2B10/jdk-11.0.15-ojdkbuild-linux-x64.zip
RUN unzip jdk-11.0.15-ojdkbuild-linux-x64.zip
RUN mv jdk-11.0.15-ojdkbuild-linux-x64 jdk

# Copy build script
COPY build.sh /src
RUN mkdir /src/built
