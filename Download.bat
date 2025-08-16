@echo off
setlocal enabledelayedexpansion

:: Banner
echo ========================================
echo This APP is Not an Offensive ACT Against YouTube Policy
echo and is just a Preview Test
echo ========================================
echo.

:: Ask for URL
set /p "ytURL=Enter YouTube video URL: "

:: Find the EXE
set "ytExe="
for %%F in (YTdow*.exe) do (
    if not defined ytExe (
        set "ytExe=%%F"
    )
)

:: Handle missing EXE
if not defined ytExe (
    echo ❌ No YTdow*.exe found in this folder.
    pause
    exit /b
)

:: Run the EXE with high-res merged download
echo ✅ Found: !ytExe!
echo 🔄 Downloading in highest available resolution...
start "" "!ytExe!" -f "bv*+ba/best" --merge-output-format mp4 "!ytURL!"
echo.
echo ✅ Download complete or in progress...
pause
