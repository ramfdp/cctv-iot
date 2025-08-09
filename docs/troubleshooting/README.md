# Troubleshooting Guide

## Common Issues and Solutions

### 1. Camera Connection Issues

#### Problem: "Cannot connect to RTSP stream"

**Symptoms:**

- Black screen or no video display
- Error messages in console
- Browser shows broken image

**Solutions:**

1. **Check Camera IP Address**

   ```bash
   ping 192.168.30.160
   ```

2. **Verify RTSP URL Format**

   ```python
   # Correct format
   RTSP_URL = "rtsp://username:password@ip_address:port/path"
   ```

3. **Test with VLC Media Player**

   - Open VLC → Media → Open Network Stream
   - Enter your RTSP URL
   - If it doesn't work in VLC, the issue is with the camera/network

4. **Check Camera Credentials**
   - Verify username and password
   - Try accessing camera web interface

#### Problem: "Connection timeout"

**Solutions:**

1. Check network connectivity
2. Verify camera is powered on
3. Check firewall settings
4. Try different RTSP port (usually 554)

### 2. Video Quality Issues

#### Problem: "Choppy or laggy video"

**Solutions:**

1. **Reduce JPEG Quality**

   ```python
   _, jpeg = cv2.imencode('.jpg', frame, [cv2.IMWRITE_JPEG_QUALITY, 50])
   ```

2. **Add Frame Rate Limiting**

   ```python
   import time
   time.sleep(0.033)  # ~30 FPS
   ```

3. **Check Network Bandwidth**
   - Use network monitoring tools
   - Reduce concurrent viewers

#### Problem: "Poor video quality"

**Solutions:**

1. **Increase JPEG Quality**

   ```python
   _, jpeg = cv2.imencode('.jpg', frame, [cv2.IMWRITE_JPEG_QUALITY, 90])
   ```

2. **Check Camera Settings**
   - Increase camera resolution
   - Adjust camera compression settings

### 3. Web Server Issues

#### Problem: "Flask server won't start"

**Error Messages:**

```
Address already in use
Port 5000 is already in use
```

**Solutions:**

1. **Change Port Number**

   ```python
   app.run(host='0.0.0.0', port=8080)
   ```

2. **Kill Existing Process**

   ```bash
   # Windows
   netstat -ano | findstr :5000
   taskkill /PID <process_id> /F

   # Linux/Mac
   lsof -ti:5000 | xargs kill -9
   ```

#### Problem: "Permission denied"

**Solutions:**

1. Run as administrator (Windows)
2. Use ports > 1024 for non-root users (Linux)
3. Check firewall permissions

### 4. Browser Issues

#### Problem: "Video not displaying in browser"

**Solutions:**

1. **Clear Browser Cache**

   - Press Ctrl+F5 to hard refresh
   - Clear browser cache and cookies

2. **Try Different Browser**

   - Test with Chrome, Firefox, Edge
   - Check browser console for errors

3. **Check URL**
   - Ensure correct URL: `http://localhost:5000/video_feed`
   - Check if server is running

#### Problem: "Slow loading"

**Solutions:**

1. Check network connection
2. Reduce video quality
3. Close other bandwidth-intensive applications

### 5. Installation Issues

#### Problem: "OpenCV installation failed"

**Solutions:**

1. **Update pip**

   ```bash
   pip install --upgrade pip
   ```

2. **Install with specific version**

   ```bash
   pip install opencv-python==4.5.5.64
   ```

3. **Use conda instead of pip**
   ```bash
   conda install opencv
   ```

#### Problem: "Flask not found"

**Solutions:**

1. **Activate virtual environment**

   ```bash
   .venv\Scripts\activate  # Windows
   source .venv/bin/activate  # Linux/Mac
   ```

2. **Install Flask**
   ```bash
   pip install Flask
   ```

### 6. Network Issues

#### Problem: "Cannot access from other devices"

**Solutions:**

1. **Check Host Setting**

   ```python
   app.run(host='0.0.0.0', port=5000)  # Not 127.0.0.1
   ```

2. **Check Firewall**

   - Allow port 5000 in Windows Firewall
   - Configure router port forwarding for remote access

3. **Find Server IP Address**
   ```bash
   ipconfig  # Windows
   ifconfig  # Linux/Mac
   ```

## Debugging Steps

### 1. Enable Debug Mode

```python
app.run(host='0.0.0.0', port=5000, debug=True)
```

### 2. Add Logging

```python
import logging
logging.basicConfig(level=logging.DEBUG)
```

### 3. Test RTSP Connection

```python
import cv2
cap = cv2.VideoCapture("rtsp://admin:ZUHDGC@192.168.30.160")
ret, frame = cap.read()
print(f"Frame captured: {ret}, Shape: {frame.shape if ret else 'None'}")
```

## Getting Help

### 1. Check Logs

- Console output for error messages
- System logs for network issues

### 2. Test Components Individually

- Test camera with VLC
- Test Flask server without camera
- Test network connectivity

### 3. Gather Information

- Operating system and version
- Python version
- Package versions
- Camera model and firmware
- Network configuration

### 4. Create Minimal Test Case

- Simplify the code to isolate the issue
- Test with a different camera if available
- Try on a different network
