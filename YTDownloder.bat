@echo off
:: Check if PowerShell is available
where powershell >nul 2>nul
if %errorlevel% neq 0 (
    echo PowerShell not found! Cannot launch downloader.
    pause
    exit /b
)

:: Launch the PowerShell shortcut
start "" "C:\Users\SingedBeet\OneDrive\Desktop\New Folder\Download.ps1.lnk"

:: Optional: Completion message
echo.
echo Downloader launched via PowerShell shortcut.
pause
