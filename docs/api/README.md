# API Documentation

## Overview

The CCTV IoT system provides a simple HTTP-based API for accessing video streams.

## Base URL

```
http://localhost:5000
```

## Endpoints

### GET /video_feed

Returns a live MJPEG video stream from the configured RTSP camera.

**URL:** `/video_feed`

**Method:** `GET`

**Response:**

- **Content-Type:** `multipart/x-mixed-replace; boundary=frame`
- **Status Code:** `200 OK`

**Response Format:**
The endpoint returns an MJPEG stream where each frame is separated by a boundary marker.

**Example Request:**

```http
GET /video_feed HTTP/1.1
Host: localhost:5000
```

**Example Response:**

```
--frame
Content-Type: image/jpeg

[JPEG image data]

--frame
Content-Type: image/jpeg

[JPEG image data]
...
```

## Usage Examples

### cURL

```bash
curl http://localhost:5000/video_feed
```

### Python Requests

```python
import requests

response = requests.get('http://localhost:5000/video_feed', stream=True)
for chunk in response.iter_content(chunk_size=1024):
    # Process video data
    pass
```

### JavaScript Fetch

```javascript
fetch("http://localhost:5000/video_feed")
  .then((response) => {
    // Handle stream data
  })
  .catch((error) => {
    console.error("Error:", error);
  });
```

### HTML Image Tag

```html
<img src="http://localhost:5000/video_feed" alt="Live Camera Feed" />
```

## Error Responses

### Camera Connection Failed

**Status Code:** `500 Internal Server Error`

**Cause:** Unable to connect to the RTSP camera

**Solution:** Check camera connectivity and credentials

### Invalid Stream

**Status Code:** `404 Not Found`

**Cause:** Video stream endpoint not found

**Solution:** Ensure the correct URL path `/video_feed`

## Rate Limiting

Currently, there are no rate limits implemented. However, consider implementing rate limiting in production environments to prevent server overload.

## Security Considerations

1. **Authentication**: The current implementation doesn't include authentication
2. **HTTPS**: Use HTTPS in production environments
3. **Access Control**: Implement IP-based access control if needed
4. **Monitoring**: Log API access for security monitoring

## Future API Extensions

Planned future endpoints:

- `GET /cameras` - List available cameras
- `GET /camera/{id}/stream` - Stream from specific camera
- `POST /camera/{id}/settings` - Update camera settings
- `GET /health` - System health check
