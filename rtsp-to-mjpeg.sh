#!/bin/sh

/usr/bin/vlc --intf dummy rtsp://$CAMERAIP:$CAMERAPORT/$CAMERASTREAM --sout "#transcode{vcodec=mjpg,scale=1.0,acodec=none}:standard{access=http{mime=multipart/x-mixed-replace; boundary=7b3cc56e5f51db803f790dad720ed50a},mux=mpjpeg,dst=:8080/}"
