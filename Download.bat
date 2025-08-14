@echo off
:: Colorful banner using Windows 10+ color support
echo.
echo ============================================================
echo This APP is Not an Offensive ACT Against YouTube Policy
echo and is just a Preview Test
echo ============================================================
echo.

:: Prompt for URL
set /p url=Enter YouTube video URL:

:: Download best video+audio with fallback
YTDownloder.exe -f "bv*+ba/best" -o "%%(title)s.%%(ext)s" "%url%"

:: Completion message
echo.
echo Download complete or in progress...
pause
