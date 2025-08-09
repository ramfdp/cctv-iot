# Examples

This directory contains practical examples and code snippets for extending the CCTV IoT system.

## Basic Examples

### 1. Simple Web Interface

Create a complete web page for viewing the camera feed:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>CCTV Monitor</title>
    <style>
      body {
        font-family: Arial, sans-serif;
        text-align: center;
        background-color: #f0f0f0;
      }
      .container {
        max-width: 800px;
        margin: 0 auto;
        padding: 20px;
      }
      .video-feed {
        border: 2px solid #333;
        border-radius: 10px;
        max-width: 100%;
        height: auto;
      }
      .controls {
        margin-top: 20px;
      }
      button {
        padding: 10px 20px;
        margin: 5px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
      }
      button:hover {
        background-color: #0056b3;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>Live CCTV Feed</h1>
      <img
        id="video-feed"
        class="video-feed"
        src="http://localhost:5000/video_feed"
        alt="Live Camera Feed"
      />
      <div class="controls">
        <button onclick="refreshFeed()">Refresh</button>
        <button onclick="toggleFullscreen()">Fullscreen</button>
      </div>
    </div>

    <script>
      function refreshFeed() {
        const img = document.getElementById("video-feed");
        const src = img.src;
        img.src = "";
        img.src = src + "?t=" + new Date().getTime();
      }

      function toggleFullscreen() {
        const img = document.getElementById("video-feed");
        if (img.requestFullscreen) {
          img.requestFullscreen();
        } else if (img.webkitRequestFullscreen) {
          img.webkitRequestFullscreen();
        } else if (img.msRequestFullscreen) {
          img.msRequestFullscreen();
        }
      }
    </script>
  </body>
</html>
```

### 2. Multiple Camera Support

Extended version supporting multiple cameras:

```python
import cv2
from flask import Flask, Response, render_template_string

app = Flask(__name__)

# Multiple camera configuration
CAMERAS = {
    'camera1': "rtsp://admin:password@192.168.1.100",
    'camera2': "rtsp://admin:password@192.168.1.101",
    'camera3': "rtsp://admin:password@192.168.1.102"
}

def generate_frames(camera_url):
    cap = cv2.VideoCapture(camera_url)
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        _, jpeg = cv2.imencode('.jpg', frame)
        frame_bytes = jpeg.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n\r\n')

@app.route('/camera/<camera_id>')
def video_feed(camera_id):
    if camera_id in CAMERAS:
        return Response(generate_frames(CAMERAS[camera_id]),
                       mimetype='multipart/x-mixed-replace; boundary=frame')
    else:
        return "Camera not found", 404

@app.route('/')
def index():
    return render_template_string('''
    <!DOCTYPE html>
    <html>
    <head><title>Multi-Camera CCTV</title></head>
    <body>
        <h1>CCTV Dashboard</h1>
        {% for camera_id in cameras %}
        <div style="display: inline-block; margin: 10px;">
            <h3>{{ camera_id|title }}</h3>
            <img src="/camera/{{ camera_id }}" width="320" height="240" style="border: 1px solid #ccc;">
        </div>
        {% endfor %}
    </body>
    </html>
    ''', cameras=CAMERAS.keys())

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
```

### 3. Motion Detection

Add motion detection to the camera feed:

```python
import cv2
import numpy as np
from flask import Flask, Response

app = Flask(__name__)

RTSP_URL = "rtsp://admin:ZUHDGC@192.168.30.160"

# Motion detection variables
background_subtractor = cv2.createBackgroundSubtractorMOG2()
motion_threshold = 1000

def generate_with_motion_detection():
    cap = cv2.VideoCapture(RTSP_URL)
    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Motion detection
        fg_mask = background_subtractor.apply(frame)
        motion_area = cv2.countNonZero(fg_mask)

        # Add motion indicator
        if motion_area > motion_threshold:
            cv2.putText(frame, "MOTION DETECTED", (10, 30),
                       cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

        # Add timestamp
        timestamp = cv2.getTickCount() / cv2.getTickFrequency()
        cv2.putText(frame, f"Time: {timestamp:.1f}s", (10, frame.shape[0] - 10),
                   cv2.FONT_HERSHEY_SIMPLEX, 0.5, (255, 255, 255), 1)

        _, jpeg = cv2.imencode('.jpg', frame)
        frame_bytes = jpeg.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate_with_motion_detection(),
                   mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

### 4. Recording Functionality

Add video recording capability:

```python
import cv2
import threading
import datetime
from flask import Flask, Response, request

app = Flask(__name__)

RTSP_URL = "rtsp://admin:ZUHDGC@192.168.30.160"
recording = False
video_writer = None

def start_recording():
    global recording, video_writer
    if not recording:
        timestamp = datetime.datetime.now().strftime("%Y%m%d_%H%M%S")
        filename = f"recording_{timestamp}.avi"
        fourcc = cv2.VideoWriter_fourcc(*'XVID')
        video_writer = cv2.VideoWriter(filename, fourcc, 20.0, (640, 480))
        recording = True
        return f"Recording started: {filename}"
    return "Already recording"

def stop_recording():
    global recording, video_writer
    if recording:
        recording = False
        if video_writer:
            video_writer.release()
        return "Recording stopped"
    return "Not recording"

def generate():
    global recording, video_writer
    cap = cv2.VideoCapture(RTSP_URL)
    while True:
        ret, frame = cap.read()
        if not ret:
            break

        # Record frame if recording is active
        if recording and video_writer:
            video_writer.write(frame)
            cv2.putText(frame, "REC", (frame.shape[1] - 60, 30),
                       cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 0, 255), 2)

        _, jpeg = cv2.imencode('.jpg', frame)
        frame_bytes = jpeg.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate(), mimetype='multipart/x-mixed-replace; boundary=frame')

@app.route('/start_recording')
def start_rec():
    return start_recording()

@app.route('/stop_recording')
def stop_rec():
    return stop_recording()

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
```

## Advanced Examples

### 5. Authentication System

Simple authentication for the camera feed:

```python
from flask import Flask, Response, request, abort
import hashlib

app = Flask(__name__)

# Simple user authentication
USERS = {
    'admin': 'password123',
    'viewer': 'viewer456'
}

def check_auth(username, password):
    return username in USERS and USERS[username] == password

def authenticate():
    return Response(
        'Could not verify your access level for that URL.\n'
        'You have to login with proper credentials', 401,
        {'WWW-Authenticate': 'Basic realm="Login Required"'})

def requires_auth(f):
    def decorated(*args, **kwargs):
        auth = request.authorization
        if not auth or not check_auth(auth.username, auth.password):
            return authenticate()
        return f(*args, **kwargs)
    return decorated

@app.route('/video_feed')
@requires_auth
def video_feed():
    # Your existing generate function here
    pass
```

### 6. Configuration File Support

Load settings from a configuration file:

```python
import json
import cv2
from flask import Flask, Response

app = Flask(__name__)

# Load configuration
def load_config():
    try:
        with open('config.json', 'r') as f:
            return json.load(f)
    except FileNotFoundError:
        # Default configuration
        config = {
            "rtsp_url": "rtsp://admin:password@192.168.1.100",
            "server_port": 5000,
            "jpeg_quality": 80,
            "max_fps": 30
        }
        with open('config.json', 'w') as f:
            json.dump(config, indent=2)
        return config

config = load_config()

def generate():
    cap = cv2.VideoCapture(config['rtsp_url'])
    while True:
        ret, frame = cap.read()
        if not ret:
            break
        _, jpeg = cv2.imencode('.jpg', frame,
                              [cv2.IMWRITE_JPEG_QUALITY, config['jpeg_quality']])
        frame_bytes = jpeg.tobytes()
        yield (b'--frame\r\n'
               b'Content-Type: image/jpeg\r\n\r\n' + frame_bytes + b'\r\n\r\n')

@app.route('/video_feed')
def video_feed():
    return Response(generate(), mimetype='multipart/x-mixed-replace; boundary=frame')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=config['server_port'])
```

Example `config.json`:

```json
{
  "rtsp_url": "rtsp://admin:ZUHDGC@192.168.30.160",
  "server_port": 5000,
  "jpeg_quality": 80,
  "max_fps": 30,
  "enable_motion_detection": false,
  "recording_path": "./recordings/"
}
```
