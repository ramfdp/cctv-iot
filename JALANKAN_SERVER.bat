@echo off
title CCTV IoT - Server Sederhana
cls

echo ========================================
echo           CCTV IoT SERVER
echo ========================================
echo.

REM Cek Python
echo [1/4] Checking Python...
python --version >nul 2>&1
if errorlevel 1 (
    echo ❌ ERROR: Python tidak terinstall!
    echo.
    echo Silakan download dan install Python dari:
    echo https://python.org
    echo.
    echo Pastikan centang "Add Python to PATH" saat install!
    echo.
    pause
    exit /b 1
)

python --version
echo ✅ Python OK!
echo.

REM Cek file utama
echo [2/4] Checking main file...
if not exist "cctv-iot.py" (
    echo ❌ ERROR: File cctv-iot.py tidak ditemukan!
    echo.
    echo Pastikan Anda menjalankan file ini dari folder yang benar.
    echo.
    pause
    exit /b 1
)
echo ✅ File utama OK!
echo.

REM Auto install dependencies jika belum ada
echo [3/4] Checking dependencies...
python -c "import cv2, flask" >nul 2>&1
if errorlevel 1 (
    echo ⚠️  Dependencies belum terinstall. Installing otomatis...
    echo.
    echo Installing Flask...
    python -m pip install flask >nul 2>&1
    
    echo Installing OpenCV...
    python -m pip install opencv-python >nul 2>&1
    
    echo Testing installation...
    python -c "import cv2, flask" >nul 2>&1
    if errorlevel 1 (
        echo ❌ ERROR: Gagal install dependencies!
        echo.
        echo Coba jalankan command ini manual:
        echo   pip install flask opencv-python
        echo.
        pause
        exit /b 1
    )
    echo ✅ Dependencies berhasil diinstall!
) else (
    echo ✅ Dependencies sudah ada!
)
echo.

REM Jalankan server
echo [4/4] Starting server...
echo.
echo ========================================
echo   SERVER STARTING - Mohon tunggu...
echo ========================================
echo.
echo 🌐 Server akan berjalan di:
echo    http://localhost:5000
echo.
echo 📺 Akses video feed di:
echo    http://localhost:5000/video_feed
echo.
echo 🛑 Tekan Ctrl+C untuk stop server
echo.
echo ========================================
echo.

REM Jalankan Python script
python cctv-iot.py

echo.
echo ========================================
echo          SERVER STOPPED
echo ========================================
echo.
echo Server telah dihentikan.
echo.
pause
