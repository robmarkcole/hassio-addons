# Hass.io Addons repository

## Hello flask
Hello world flask addon that simply returns a string. Navigate to [http://homeassistant.local:5000/](http://homeassistant.local:5000/)

## Motion 
[A usb camera motion detector addon.](./motion) This fork allows viewing the live stream and by default does not save any images to disk. Note that if you are on a public network be careful as authentification of the stream and webcontrol are not enabled.

<p align="center">
<img src="https://github.com/robmarkcole/hassio-addons/blob/master/assets/motion.jpg" width="1000">
</p>

## Streamlit
Run the [streamlit demo](https://docs.streamlit.io/en/latest/getting_started.html). The build takes a long time, but succeeds in the end :-)

<p align="center">
<img src="https://github.com/robmarkcole/hassio-addons/blob/master/assets/streamlit.jpg" width="1000">
</p>

## Tesseract - WIP
Build failing, unsure why: `Can't build local/aarch64-addon-tesseract:0.3: The command '/bin/sh -c pip install -r requirements.txt' returned a non-zero code: 127`

# Development
* Setup samba server and use local vscode
* debug the docker image locally on my dev machine, first build `docker build -t $yourimage .` then run `docker run -it --entrypoint=/bin/bash $yourimage`