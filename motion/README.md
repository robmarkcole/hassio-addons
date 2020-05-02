## Motion Addon
* Addon to use a usb camera, exposing an unsecured MJPEG feed on [http://homeassistant.local:8081](http://homeassistant.local:8081), and *no* images are saved to disk using the default settings. The code is [hosted on Github here](https://github.com/robmarkcole/hassio-addons)
* This addon was forked from: https://github.com/lovejoy777/hassio-addons


### Home Assistant integration
USE IFRAME - You can view the live MJPEG stream using:
```
camera:
  - platform: mjpeg
    mjpeg_url: http://homeassistant.local:8081
    name: motioncam
```
[ISSUE WITH IFRAME](https://github.com/robmarkcole/hassio-addons/issues/1)

If you have configured a periodic snapshot you can display the last snapped image with:
```
camera:
  - platform: local_file
    name: motion_lastsnap
    file_path: /share/motion/lastsnap.jpg
```

You can view the camera images on the HA front-end using a `Picture-entity` lovelace card with config:

```
camera_view: live
entity: camera.motioncam
type: picture-entity
```

Be sure to [add](https://www.home-assistant.io/components/stream/) the `stream` integration to your HA config.

**Note** that you may encounter an annoying issue whereby the camera stream doesn't display in the card and you see a grey box with `camera idle`. In this case you can use a [panel_iframe](https://www.home-assistant.io/components/panel_iframe/):

```
panel_iframe:
  motion:
    title: motion
    icon: mdi:camera
    url: http://homeassistant.local:8081
```

### Settings
##### config
*Optional*

Path to a predefined motion.conf settings file

##### videodevice
*/dev/video0*

##### width
*1280*

Image width (pixels). Valid range: Camera dependent

##### height
*720*

Image height (pixels). Valid range: Camera dependent

##### framerate
*2*

Maximum number of frames to be captured per second.  
Valid range: 2-100. Default: 100 (almost no limit).

##### text_right
*%Y-%m-%d %T-%q*


Draws the timestamp using same options as C function strftime(3)  
Text is placed in lower right corner

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### target_dir
*/share/motion*

Target base directory for pictures and films  
Use absolute path.

##### snapshot_interval
*0*

Make automated snapshot every N seconds (0 = disabled). Note that this must be > 0 to save any photos.

##### snapshot_name
*%v-%Y%m%d%H%M%S-snapshot*

File path for snapshots (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-snapshot  
File extension .jpg or .ppm is automatically added so do not include this.  
Note: A symbolic link called lastsnap.jpg created in the target_dir will always point to the latest snapshot, unless snapshot_filename is exactly 'lastsnap'

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### picture_output
*off*

Output 'normal' pictures when motion is detected  
Valid values: on, off, first, best, center  
When set to 'first', only the first picture of an event is saved.  
Picture with most motion of an event is saved when set to 'best'.  
Picture with motion nearest center of picture is saved when set to 'center'.
`on` appears to continually capture.

##### picture_name
*%v-%Y%m%d%H%M%S-%q*

File path for motion triggered images (jpeg or ppm) relative to target_dir  
Default value is equivalent to legacy oldlayout option  
For Motion 3.0 compatible mode choose: %Y/%m/%d/%H/%M/%S-%q  
File extension .jpg or .ppm is automatically added so do not include this  
Set to 'preview' together with best-preview feature enables special naming convention for preview shots. See motion guide for details

```
%Y = year, %m = month, %d = date,
%H = hour, %M = minute, %S = second, %T = HH:MM:SS,
%v = event, %q = frame number, %t = camera id number,
%D = changed pixels, %N = noise level, \n = new line,
%i and %J = width and height of motion area,
%K and %L = X and Y coordinates of motion center
%C = value defined by text_event - do not use with text_event!
You can put quotation marks around the text to allow leading spaces
```

##### webcontrol_local
*off*

Restrict control connections to localhost only

##### webcontrol_html
*off*

Output for http server, select off to choose raw text plain
