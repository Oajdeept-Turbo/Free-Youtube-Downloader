::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFChdQgOHOEm/A6EgzOfs4eaIo0kOaOQ+bobY1brAKeMcig==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSDk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+JeA==
::cxY6rQJ7JhzQF1fEqQJQ
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQJQ
::dhA7uBVwLU+EWDk=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFChdQgOHOEm/A6Egx+b+y/iOtEghcO08bYLe1KCdHMUL60j0eZNt0HVWnM4eMD1KexfmVwAhvXtAsymhONCSvwDgTk2b2mYRMktSrk/1wi4jZbM=
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
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

:: Auto-detect downloader EXE
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

:: Run downloader with merged high-res output
echo ✅ Found: !ytExe!
echo 🔄 Downloading in highest available resolution...
start "" "!ytExe!" -f "bv*+ba/best" --merge-output-format mp4 "!ytURL!"
echo.
echo ✅ Download complete or in progress...
pause
