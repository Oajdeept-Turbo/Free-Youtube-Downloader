# Banner
Write-Host "========================================"
Write-Host "This APP is Not an Offensive ACT Against YouTube Policy"
Write-Host "and is just a Preview Test"
Write-Host "========================================"
Write-Host ""

# Ask for URL
$ytURL = Read-Host "Enter YouTube video URL"

# Find the EXE
$ytExe = Get-ChildItem -Path "." -Filter "YTdow*.exe" | Select-Object -First 1

# Handle missing EXE
if (-not $ytExe) {
    Write-Host "❌ No YTdow*.exe found in this folder."
    pause
    exit
}

# Run the EXE with high-res merged download
Write-Host "✅ Found: $($ytExe.Name)"
Write-Host "🔄 Downloading in highest available resolution..."
Start-Process -FilePath $ytExe.FullName -ArgumentList "-f `"bv*+ba/best`" --merge-output-format mp4 `"$ytURL`""
Write-Host ""
Write-Host "✅ Download complete or in progress..."
pause