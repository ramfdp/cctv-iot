@echo off
echo ================================
echo   CCTV IoT - Fix OpenCV Issues
echo ================================
echo.
echo Script ini akan mencoba mengatasi masalah OpenCV yang umum terjadi.
echo.

echo [1] Uninstalling existing opencv packages...
python -m pip uninstall opencv-python opencv-contrib-python opencv-python-headless -y

echo.
echo [2] Clearing pip cache...
python -m pip cache purge

echo.
echo [3] Upgrading pip...
python -m pip install --upgrade pip

echo.
echo [4] Installing Microsoft Visual C++ Redistributable dependencies...
echo If you get import errors, you might need to install:
echo https://aka.ms/vs/17/release/vc_redist.x64.exe
echo.

echo [5] Installing OpenCV with compatibility mode...
python -m pip install --no-cache-dir opencv-python

echo.
echo [6] Testing OpenCV installation...
python -c "import cv2; print('SUCCESS: OpenCV version:', cv2.__version__); print('Build info:'); print(cv2.getBuildInformation()[:500])"

if errorlevel 1 (
    echo.
    echo ================================
    echo        TROUBLESHOOTING TIPS
    echo ================================
    echo.
    echo OpenCV masih bermasalah. Coba langkah berikut:
    echo.
    echo 1. Install Visual C++ Redistributable:
    echo    https://aka.ms/vs/17/release/vc_redist.x64.exe
    echo.
    echo 2. Pastikan Python dan pip sudah versi terbaru:
    echo    python -m pip install --upgrade pip
    echo.
    echo 3. Coba install versi opencv yang lebih lama:
    echo    pip install opencv-python==4.5.5.64
    echo.
    echo 4. Cek arsitektur Python (32-bit vs 64-bit):
    echo    python -c "import platform; print(platform.architecture())"
    echo.
    echo 5. Restart command prompt sebagai Administrator
    echo.
) else (
    echo.
    echo ================================
    echo      OpenCV BERHASIL DIINSTALL!
    echo ================================
    echo.
    echo Sekarang Anda bisa menjalankan CCTV IoT server.
)

echo.
pause
