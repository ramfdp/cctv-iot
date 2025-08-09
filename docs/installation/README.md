# Installation Guide

## Prerequisites

Before installing the CCTV IoT system, ensure you have the following:

- Python 3.7 or higher
- pip (Python package manager)
- Access to RTSP camera feeds
- Network connectivity to cameras

## Dependencies

The following Python packages are required:

```bash
pip install flask opencv-python
```

## Installation Steps

### 1. Clone or Download the Project

Download the project files to your desired directory.

### 2. Create Virtual Environment (Recommended)

```bash
python -m venv .venv
```

### 3. Activate Virtual Environment

**Windows:**

```bash
.venv\Scripts\activate
```

**Linux/Mac:**

```bash
source .venv/bin/activate
```

### 4. Install Dependencies

```bash
pip install -r requirements.txt
```

### 5. Configure Camera Settings

Edit the `cctv-iot.py` file and update the RTSP URL with your camera credentials:

```python
RTSP_URL = "rtsp://username:password@camera_ip_address"
```

### 6. Run the Application

```bash
python cctv-iot.py
```

## Verification

Once the application is running, you can verify the installation by:

1. Opening a web browser
2. Navigating to `http://localhost:5000/video_feed`
3. You should see the live video stream from your camera

## Next Steps

- Configure additional cameras: [Configuration Guide](../configuration/README.md)
- Learn how to use the system: [User Guide](../user-guide/README.md)
