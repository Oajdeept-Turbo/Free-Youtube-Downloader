::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFChdQgOHOEm/A6EgzOfs4eaIo0kOaOs8d4GV07eBQA==
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSTk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQICIQhAWQWOFGqoELAO/O3pjw==
::ZQ05rAF9IBncCkqN+0xwdVs0
::ZQ05rAF9IAHYFVzEqQJQ
::eg0/rx1wNQPfEVWB+kM9LVsJDGQ=
::fBEirQZwNQPfEVWB+kM9LVsJDGQ=
::cRolqwZ3JBvQF1fEqQIYKQlCSReWLyu8Cace4ez/6uTHsVkPUeMya8/a1LDOIfcS4UDqZtYu2X5fm9hs
::dhA7uBVwLU+EWHmC+0Vpe0s0
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATElA==
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFChdQgOHOEm/A6Egx+b+y/iOtEghcO08bYLe1KCdHMUL60j0eZNt0HVWnM4eMD1KexfmVwAhvXtAsymhONCSvwDgTk2b2m0iHmA5vmzFmD45ZZ5MldQN3y+/+Ejto5cF33zwSacCGmLlxL4mPdEFnQ==
::YB416Ek+ZG8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
chcp 65001 >nul
mode con: cols=85 lines=35
title ╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗
color 0C
setlocal ENABLEDELAYEDEXPANSION

:: === RITUAL INTRO ===
cls
echo.
echo ╔══════════════════════════════════════════════════════════════════════════╗
echo ║                      ☠ RITUAL HARVESTER ☠                               ║
echo ║--------------------------------------------------------------------------║
echo ║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║
echo ╚══════════════════════════════════════════════════════════════════════════╝
ping -n 2 localhost >nul

:: === URL PROMPT ===
color 0E
set /p "yturl=📜 Speak the URL to harvest: "
if "%yturl%"=="" (
    color 0C
    echo ✖ The summoning circle remains empty — the rite collapses.
    pause
    exit /b
)

:: === FILE NAMES ===
set /a rand=%random% %% 999 + 1
set "rawfile=harvest_%rand%.mp4"
set "finalfile=sealed_%rand%.mp4"

:: === HARVEST PHASE ===
cls
color 0D
echo [██████░░░░░░░░░░░░] 40%% – Carving blood runes
ping -n 2 localhost >nul
echo [████████████░░░░░] 70%% – Hooking spectral stream
ping -n 2 localhost >nul
echo [█████████████████] 99.9%% – Vessel pulled into circle
ping -n 1 localhost >nul
echo.
YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o "%rawfile%" "%yturl%"
if not exist "%rawfile%" (
    color 0C
    echo ✖ The portal tore and the prize was lost.
    pause
    exit /b
)

:: === PURIFICATION PHASE (BLACK‑FLAME TORCH) ===
cls
color 0E
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
for /l %%i in (1,1,20) do (
    set /a glitch=!random! %% 20
    set "bar=██████████████████████████████████████████████████"
    set "cut=!bar:~0,%%i!"
    if !glitch! lss 3 (
        echo !cut! ☠ engraving corrupted glyphs...
    ) else (
        echo !cut! 🔥 flames scour the Opus spirit...
    )
    ping -n 1 localhost >nul
)
ffmpeg -i "%rawfile%" -c:v copy -c:a aac -b:a 192k "%finalfile%" -y
del "%rawfile%" >nul 2>&1

:: === SEALING PHASE ===
cls
if exist "%finalfile%" (
    color 0A
    echo ╔════════════════════════════════════════════════════════════════════╗
    echo ║                     ✔ RITUAL COMPLETE                              ║
    echo ║ The vessel is sealed: %finalfile%                                  ║
    echo ║ Its voice is pure AAC, freed from spectral corruption.             ║
    echo ╚════════════════════════════════════════════════════════════════════╝
) else (
    color 0C
    echo ╔════════════════════════════════════════════════════════════════════╗
    echo ║                     ✖ RITUAL FAILED                                ║
    echo ║ The vessel crumbled to ash mid‑sealing.                            ║
    echo ╚════════════════════════════════════════════════════════════════════╝
)
pause
