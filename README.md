
# traccar-build-from-source
Docker image for building Traccar from source

## First Build docker image
First build the image:

    docker build -t traccar_builder .
	
## Get an instance of image with a bashprompt

    docker run --rm -v %cd%\built:/src/built -it --name=build_container traccar_builder bash

Now you have to clone the git repository

    ./source_get.sh

Then you could do some cherrypicking or change the source. It's all up to you
Everything you want to edit is in /src/traccar
You have the VIM and the nano editor at your hand.

After that you build the sourcecode.

    ./source_build.sh

Now exit out of your docker container (it will automatically be destroyed)

    exit

Your built Traccar should now be in the "built" folder.
