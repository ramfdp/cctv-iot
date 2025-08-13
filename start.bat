@echo off
echo ================================
echo    CCTV IoT - Quick Start
echo ================================
echo.
echo This script will help you get started with CCTV IoT server.
echo.
echo Available options:
echo   1. Setup (Install dependencies)
echo   2. Run Server
echo   3. Exit
echo.

:menu
set /p choice="Enter your choice (1-3): "

if "%choice%"=="1" (
    echo.
    echo Running setup...
    call setup.bat
    echo.
    echo Press any key to return to menu...
    pause >nul
    cls
    goto menu
)

if "%choice%"=="2" (
    echo.
    echo Starting CCTV IoT Server...
    call run_cctv_server.bat
    echo.
    echo Press any key to return to menu...
    pause >nul
    cls
    goto menu
)

if "%choice%"=="3" (
    echo.
    echo Goodbye!
    exit /b 0
)

echo Invalid choice. Please enter 1, 2, or 3.
echo.
goto menu
