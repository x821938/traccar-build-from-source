# traccar-build-from-source
Docker image for building Traccar from source

### Build docker image prepared with sw
docker build -t traccar_builder .

### Get an instance of image with a bashprompt for testing
docker run -v %cd%\built:/src/built -it --name=test traccar_builder bash

### Git clone, build image, and send built sw to output folder
docker run --rm -v %cd%\built:/src/built --name=test traccar_builder /src/build.sh