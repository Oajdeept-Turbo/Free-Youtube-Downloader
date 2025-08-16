# Colorful banner using Write-Host colors
Write-Host "=============================================================" -ForegroundColor Magenta
Write-Host "This APP is Not an Offensive ACT Against YouTube Policy" -ForegroundColor Yellow
Write-Host "and is just a Preview Test" -ForegroundColor Cyan
Write-Host "=============================================================" -ForegroundColor Magenta
Write-Host ""

# Prompt for URL
Write-Host "Enter YouTube video URL: " -ForegroundColor Yellow -NoNewline
$url = Read-Host

# Run yt-dlp with best video+audio and merge using FFmpeg
.\YTDownloder.exe `
    -f "bv*+ba/best" `
    --merge-output-format mp4 `
    -o "%(title)s.%(ext)s" `
    "$url"

# Completion message
Write-Host ""
Write-Host "Download complete or in progress..." -ForegroundColor Cyan
