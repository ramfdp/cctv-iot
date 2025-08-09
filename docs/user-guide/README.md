# User Guide

## Getting Started

This guide will help you use the CCTV IoT system effectively.

## Accessing the Video Stream

### Web Interface

1. Start the application by running `python cctv-iot.py`
2. Open your web browser
3. Navigate to `http://localhost:5000/video_feed`
4. The live video stream will appear in your browser

### Remote Access

If you configured the system for remote access:

1. Use the server's IP address instead of localhost
2. Example: `http://192.168.1.100:5000/video_feed`

## Creating a Web Page

To embed the video feed in a web page, create an HTML file:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>CCTV Monitor</title>
  </head>
  <body>
    <h1>Live Camera Feed</h1>
    <img src="http://localhost:5000/video_feed" width="640" height="480" />
  </body>
</html>
```

## Mobile Access

The video stream can be accessed from mobile devices:

1. Connect to the same network as the server
2. Open a mobile browser
3. Navigate to the server address
4. The video stream will display in the browser

## Recording Video

To record the video stream, you can use browser extensions or desktop recording software that can capture the browser window.

## Multiple Viewers

The system supports multiple simultaneous viewers. Each viewer will receive their own video stream.

## Keyboard Shortcuts

When viewing the stream in a browser:

- `F11` - Full screen mode
- `Ctrl + R` - Refresh the stream
- `Ctrl + 0` - Reset zoom level

## Troubleshooting Common Issues

### No Video Display

1. Check if the camera is accessible
2. Verify the RTSP URL is correct
3. Ensure network connectivity
4. Check camera credentials

### Slow Video Stream

1. Check network bandwidth
2. Reduce video quality settings
3. Limit number of simultaneous viewers
4. Check camera performance

### Connection Errors

1. Verify camera IP address
2. Check firewall settings
3. Ensure camera is powered on
4. Test RTSP URL with VLC media player

## Best Practices

1. **Network Security**: Use VPN for remote access
2. **Camera Maintenance**: Regularly update camera firmware
3. **Monitoring**: Set up alerts for connection failures
4. **Backup**: Document camera configurations
5. **Testing**: Regularly test stream quality and connectivity
