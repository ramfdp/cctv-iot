@echo off
echo ================================
echo  CCTV IoT - Stop All Processes
echo ================================
echo.
echo Stopping all Python processes running CCTV IoT...

REM Kill processes running on port 5000 (Flask default)
netstat -ano | findstr :5000 >nul 2>&1
if not errorlevel 1 (
    echo Found processes using port 5000, attempting to stop...
    for /f "tokens=5" %%a in ('netstat -aon ^| findstr :5000') do (
        echo Stopping process ID: %%a
        taskkill /f /pid %%a >nul 2>&1
    )
    echo Port 5000 processes stopped.
) else (
    echo No processes found using port 5000.
)

REM Kill Python processes with cctv-iot.py
wmic process where "commandline like '%cctv-iot.py%'" get processid /value 2>nul | find "ProcessId" >nul
if not errorlevel 1 (
    echo Found CCTV IoT processes, stopping them...
    for /f "tokens=2 delims==" %%a in ('wmic process where "commandline like '%cctv-iot.py%'" get processid /value ^| find "ProcessId"') do (
        if not "%%a"=="" (
            echo Stopping CCTV IoT process ID: %%a
            taskkill /f /pid %%a >nul 2>&1
        )
    )
    echo CCTV IoT processes stopped.
) else (
    echo No CCTV IoT processes found running.
)

echo.
echo ================================
echo   All processes stopped
echo ================================
pause
