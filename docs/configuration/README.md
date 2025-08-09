# Configuration Guide

## Camera Configuration

### RTSP URL Format

The RTSP URL follows this format:

```
rtsp://[username]:[password]@[camera_ip]:[port]/[stream_path]
```

### Example Configurations

**Generic IP Camera:**

```python
RTSP_URL = "rtsp://admin:password123@192.168.1.100:554/stream1"
```

**Hikvision Camera:**

```python
RTSP_URL = "rtsp://admin:password@192.168.1.100:554/Streaming/Channels/101"
```

**Dahua Camera:**

```python
RTSP_URL = "rtsp://admin:password@192.168.1.100:554/cam/realmonitor?channel=1&subtype=0"
```

## Network Configuration

### Port Settings

By default, the web server runs on port 5000. You can change this in the `cctv-iot.py` file:

```python
if __name__ == '__main__':
    app.run(host='0.0.0.0', port=8080)  # Change port here
```

### Host Settings

- `host='0.0.0.0'` - Allows access from any network interface
- `host='127.0.0.1'` - Only allows local access
- `host='192.168.1.100'` - Only allows access from specific IP

## Security Configuration

### Camera Authentication

Always use strong passwords for camera access:

```python
RTSP_URL = "rtsp://admin:Strong_Password_123@192.168.1.100"
```

### Network Security

1. Use VPN for remote access
2. Configure firewall rules
3. Use HTTPS in production environments
4. Regularly update camera firmware

## Multiple Camera Setup

For multiple cameras, you'll need to modify the code structure. See [Examples](../examples/README.md) for multi-camera configurations.

## Environment Variables

You can use environment variables for sensitive information:

```python
import os
RTSP_URL = os.environ.get('RTSP_URL', 'default_rtsp_url')
```

## Performance Tuning

### Video Quality Settings

Adjust video encoding parameters:

```python
_, jpeg = cv2.imencode('.jpg', frame, [cv2.IMWRITE_JPEG_QUALITY, 80])
```

### Frame Rate Control

Add frame rate limiting:

```python
import time
time.sleep(1/30)  # 30 FPS limit
```
