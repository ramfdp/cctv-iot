@echo off
title CCTV IoT Server
echo ================================
echo     CCTV IoT Streaming Server
echo ================================
echo.
echo Starting CCTV IoT server...
echo Server will be available at: http://localhost:5000
echo Video feed URL: http://localhost:5000/video_feed
echo.
echo Press Ctrl+C to stop the server
echo ================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please run setup.bat first or install Python from https://python.org
    pause
    exit /b 1
)

REM Check if the main Python file exists
if not exist "cctv-iot.py" (
    echo ERROR: cctv-iot.py not found!
    echo Please make sure you're running this from the correct directory.
    pause
    exit /b 1
)

REM Run the Python application
python cctv-iot.py

echo.
echo ================================
echo   Server stopped
echo ================================
pause
