# rtsp-to-mjpeg
Simple container to provide access to a RTSP stream via MJPEG. I'm using this to allow Octoprint (running in a container)
to access the video feed of a Raspberry Pi Camera v2 that is exposed via an RTSP stream (running in another docker container).

The image requires the following environment variables to be set:
CAMERAIP=''
CAMERAPORT=''
CAMERASTREAM=''

# Sample Command Lines
## Serve Camera Video as RTSP Stream

```
docker run --restart unless-stopped --device=/dev/video0 -p 8554:8554 -itd --name v4l2rtspserver mpromonet/v4l2rtspserver -u "" -H 1080 -W 1920 -F 15 -fMJPG
```

## Serve HTTP Stream from RTSP Stream

```
docker build -t rtsp-to-mjpeg .
docker run --restart unless-stopped -itd -p 8080:8080 --name rtsp-to-mjpeg --env CAMERAIP=192.168.86.43 --env CAMERAPORT=8554 rtsp-to-mjpeg
```

Converting the video stream takes a decent amount of CPU. Reducing the resolution and FPS of the source RSTP video feed can help reduce the
amount of CPU used.
