@echo off
echo ================================
echo    CCTV IoT - Setup Script
echo ================================
echo.
echo Installing Python dependencies...
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Python is not installed or not in PATH!
    echo Please install Python from https://python.org
    pause
    exit /b 1
)

echo Python is installed. Checking pip...
python -m pip --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: pip is not available!
    echo Please ensure pip is installed with Python.
    pause
    exit /b 1
)

echo Installing required packages...
python -m pip install -r requirements.txt

if errorlevel 1 (
    echo.
    echo ERROR: Failed to install dependencies!
    echo Please check your internet connection and try again.
    pause
    exit /b 1
) else (
    echo.
    echo ================================
    echo   Setup completed successfully!
    echo ================================
    echo.
    echo You can now run the CCTV IoT server using:
    echo   - Double-click "run_cctv_server.bat"
    echo   - Or run "python cctv-iot.py" in command line
    echo.
)

pause
