# Hass.io Addons repository

## Motion 
[A usb camera motion detector addon.](./motion) This fork allows viewing the live stream and by default does not save any images to disk. Note that if you are on a public network be careful as authentification of the stream and webcontrol are not enabled.

## Hello flask
Hello world flask addon that simply returns a string. Navigate to [http://homeassistant.local:5000/](http://homeassistant.local:5000/)

## Streamlit
Run the [streamlit demo](https://docs.streamlit.io/en/latest/getting_started.html). Basically streamlit has a ton of dependencies, and ultimately the build takes a very long time, but succeeds in the end :-)


# Development
* Setup samba server and use local vscode
* debug the docker image locally on my dev machine, first build `docker build -t $yourimage .` then run `docker run -it --entrypoint=/bin/bash $yourimage`