# CCTV IoT - Batch Files Usage

This directory contains several batch files to help you run the CCTV IoT application without using an IDE.

## Available Batch Files

### 1. `start.bat` - Main Menu (Recommended)
**Double-click this file to get started!**

This is the main entry point that provides a user-friendly menu with options to:
- Setup the environment (install dependencies)
- Run the CCTV server
- Exit

### 2. `setup.bat` - Install Dependencies
Installs all required Python packages (Flask, OpenCV) automatically.

**When to use:** Run this once before first use, or when you get import errors.

### 3. `run_cctv_server.bat` - Start the Server
Starts the CCTV IoT streaming server.

**Result:** 
- Server runs at: http://localhost:5000
- Video feed at: http://localhost:5000/video_feed
- Press Ctrl+C to stop

### 4. `stop_server.bat` - Force Stop All Processes
Forcefully stops all running CCTV IoT server processes.

**When to use:** If the server doesn't stop normally or keeps running in background.

## Quick Start Guide

1. **First time setup:**
   - Double-click `start.bat`
   - Choose option `1` (Setup)
   - Wait for installation to complete

2. **Run the server:**
   - In the same menu, choose option `2` (Run Server)
   - Or directly double-click `run_cctv_server.bat`

3. **Access the stream:**
   - Open web browser
   - Go to: http://localhost:5000/video_feed

4. **Stop the server:**
   - Press `Ctrl+C` in the command window
   - Or double-click `stop_server.bat`

## Troubleshooting

- **"Python is not installed"**: Install Python from https://python.org
- **"Import errors"**: Run `setup.bat` to install dependencies
- **"Server won't stop"**: Use `stop_server.bat`
- **"RTSP connection failed"**: Check camera IP and credentials in `cctv-iot.py`

## Requirements

- Windows OS
- Python 3.7+ installed and added to PATH
- Internet connection (for initial setup)
- Access to RTSP camera (check IP: 192.168.30.160)
