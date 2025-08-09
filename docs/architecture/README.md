# Architecture Overview

## System Architecture

The CCTV IoT system follows a simple client-server architecture for real-time video streaming.

## Component Diagram

```
[RTSP Camera] --RTSP--> [Python Application] --HTTP--> [Web Browser]
     |                        |                         |
     |                    Flask Server              HTML Client
     |                   OpenCV Video                   |
     |                     Capture                      |
     v                        |                         v
[Video Source]           [Stream Generator]      [Video Display]
```

## Core Components

### 1. RTSP Camera

- **Function**: Video source providing RTSP stream
- **Protocol**: RTSP (Real Time Streaming Protocol)
- **Authentication**: Username/password based
- **Output**: H.264/H.265 video stream

### 2. Python Application (cctv-iot.py)

- **Framework**: Flask web server
- **Video Processing**: OpenCV (cv2)
- **Function**:
  - Captures RTSP stream
  - Converts to MJPEG format
  - Serves HTTP video feed

### 3. Web Client

- **Interface**: Standard web browser
- **Protocol**: HTTP
- **Display**: MJPEG stream in HTML img tag

## Data Flow

### 1. Video Capture Flow

```
RTSP Camera → OpenCV VideoCapture → Frame Processing → JPEG Encoding
```

### 2. Web Streaming Flow

```
JPEG Frames → Flask Generator → HTTP Response → Browser Display
```

## Technical Stack

### Backend

- **Python 3.7+**: Core programming language
- **Flask**: Web framework for HTTP server
- **OpenCV**: Computer vision library for video processing
- **Threading**: Implicit threading in Flask for multiple clients

### Frontend

- **HTML5**: Markup for web interface
- **HTTP**: Protocol for client-server communication
- **MJPEG**: Motion JPEG for video streaming

## Network Architecture

```
[Camera Network] --RTSP--> [Server Network] --HTTP--> [Client Network]
   192.168.x.x              127.0.0.1:5000           Any IP Address
```

### Network Requirements

- **RTSP Port**: Usually 554 (camera)
- **HTTP Port**: 5000 (configurable)
- **Bandwidth**: Depends on video quality and frame rate

## Scalability Considerations

### Current Limitations

- Single camera support
- No authentication
- No load balancing
- Limited error handling

### Scaling Options

1. **Multiple Cameras**: Extend to support multiple RTSP sources
2. **Load Balancing**: Add reverse proxy (nginx/Apache)
3. **Caching**: Implement frame caching for multiple viewers
4. **Database**: Add configuration storage
5. **Microservices**: Split into separate camera services

## Security Architecture

### Current Security

- Basic RTSP authentication
- No web authentication
- HTTP (unencrypted) communication

### Recommended Security Enhancements

1. **HTTPS**: SSL/TLS encryption
2. **Authentication**: User login system
3. **Authorization**: Role-based access control
4. **VPN**: Network-level security
5. **Firewall**: Port restrictions

## Performance Characteristics

### Resource Usage

- **CPU**: Moderate (video encoding/decoding)
- **Memory**: Low to moderate (frame buffering)
- **Network**: High (continuous video stream)
- **Disk**: Low (no persistent storage)

### Optimization Opportunities

1. **Frame Rate Control**: Limit FPS for bandwidth saving
2. **Resolution Scaling**: Adaptive quality based on client
3. **Compression**: Better JPEG compression settings
4. **Caching**: Frame caching for multiple viewers

## Deployment Architecture

### Development

```
[Developer Machine] → [Local Flask Server] → [Local Browser]
```

### Production

```
[RTSP Cameras] → [Server Infrastructure] → [Load Balancer] → [Client Devices]
                      |
                 [Monitoring & Logging]
```
