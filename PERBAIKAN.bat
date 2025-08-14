@echo off
title CCTV IoT - Reset & Fix
echo ========================================
echo       CCTV IoT - RESET & FIX
echo ========================================
echo.
echo Script ini akan mengatasi masalah umum.
echo.

echo [1/5] Checking Python...
python --version 2>nul
if errorlevel 1 (
    echo ❌ Python tidak terinstall!
    echo Download dari: https://python.org
    pause
    exit /b 1
) else (
    echo ✅ Python OK
)

echo.
echo [2/5] Upgrade pip...
python -m pip install --upgrade pip

echo.
echo [3/5] Uninstall old packages...
python -m pip uninstall opencv-python opencv-contrib-python flask -y >nul 2>&1

echo.
echo [4/5] Reinstall fresh packages...
python -m pip install --no-cache-dir flask opencv-python

echo.
echo [5/5] Test installation...
python -c "import cv2, flask; print('✅ SUCCESS: OpenCV', cv2.__version__, 'Flask', flask.__version__)"

if errorlevel 1 (
    echo ❌ Masih ada masalah!
    echo.
    echo Coba solusi ini:
    echo 1. Restart sebagai Administrator
    echo 2. Install Visual C++ Redistributable
    echo 3. Cek koneksi internet
    echo.
) else (
    echo.
    echo ========================================
    echo         ✅ BERHASIL DIPERBAIKI!
    echo ========================================
    echo.
    echo Sekarang coba jalankan: JALANKAN_SERVER.bat
)

echo.
pause
