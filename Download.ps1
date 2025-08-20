param(
    [string]$Url
)

# === Setup ===
$Host.UI.RawUI.WindowTitle = "╔═ RITUAL HARVESTER - BLOOD TORCH EDITION ═╗"
$Host.UI.RawUI.WindowSize = New-Object System.Management.Automation.Host.Size(85, 35)
$Host.UI.RawUI.ForegroundColor = "Red"
Clear-Host

# === Ritual Intro ===
Write-Host ""
Write-Host "╔══════════════════════════════════════════════════════════════════════════╗"
Write-Host "║                      ☠ RITUAL HARVESTER ☠                               ║"
Write-Host "║--------------------------------------------------------------------------║"
Write-Host "║  This rite binds flesh (video) and soul (audio) into a cursed vessel.    ║"
Write-Host "╚══════════════════════════════════════════════════════════════════════════╝"
Start-Sleep -Seconds 1

# === URL Prompt ===
$Host.UI.RawUI.ForegroundColor = "Yellow"
$ytUrl = Read-Host "📜 Speak the URL to harvest"
if (-not $ytUrl) {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Host "✖ The summoning circle remains empty — the rite collapses."
    Read-Host "Press Enter to exit"
    exit
}

# === File Names ===
$randNum = Get-Random -Minimum 1 -Maximum 1000
$rawFile = "harvest_$($randNum).mp4"
$finalFile = "sealed_$($randNum).mp4"

# === Harvest Phase ===
Clear-Host
$Host.UI.RawUI.ForegroundColor = "DarkMagenta"
Write-Host "[██████░░░░░░░░░░░░] 40% – Carving blood runes"
Start-Sleep -Seconds 1
Write-Host "[████████████░░░░░] 70% – Hooking spectral stream"
Start-Sleep -Seconds 1
Write-Host "[█████████████████] 99.9% – Vessel pulled into circle"
Start-Sleep -Milliseconds 500
Write-Host ""

& YTDownloader.exe -f bestvideo+bestaudio --merge-output-format mp4 -o "$rawFile" "$ytUrl" *>&1 | Out-Null

if (-not (Test-Path $rawFile)) {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Host "✖ The portal tore and the prize was lost."
    Read-Host "Press Enter to exit"
    exit
}

# === Purification Phase ===
Clear-Host
$Host.UI.RawUI.ForegroundColor = "Yellow"
Write-Host "╔════════════════════════════════════════════════════════════════════╗"
Write-Host "║        🔥 THE BLACK‑FLAME TORCH IS LIT — PURIFICATION BEGINS 🔥     ║"
Write-Host "╚════════════════════════════════════════════════════════════════════╝"
Write-Host ""

1..40 | ForEach-Object {
    $glitch = Get-Random -Minimum 0 -Maximum 20
    $bar = "█" * $_
    $message = if ($glitch -lt 3) { "☠ engraving corrupted glyphs..." } else { "🔥 flames scour the Opus spirit..." }
    Write-Host "`r$($bar.PadRight(40)) $message" -NoNewline
    Start-Sleep -Milliseconds 50
}
Write-Host ""

& ffmpeg -i "$rawFile" -c:v copy -c:a aac -b:a 192k "$finalFile" -y *>&1 | Out-Null
if (Test-Path $rawFile) { Remove-Item $rawFile }

# === Sealing Phase ===
Clear-Host
if (Test-Path $finalFile) {
    $Host.UI.RawUI.ForegroundColor = "Green"
    Write-Host "╔════════════════════════════════════════════════════════════════════╗"
    Write-Host "║                     ✔ RITUAL COMPLETE                              ║"
    Write-Host "║ The vessel is sealed: $($finalFile.PadRight(39)) ║"
    Write-Host "║ Its voice is pure AAC, freed from spectral corruption.             ║"
    Write-Host "╚════════════════════════════════════════════════════════════════════╝"
} else {
    $Host.UI.RawUI.ForegroundColor = "Red"
    Write-Host "╔════════════════════════════════════════════════════════════════════╗"
    Write-Host "║                     ✖ RITUAL FAILED                                ║"
    Write-Host "║ The vessel crumbled to ash mid‑sealing.                            ║"
    Write-Host "╚════════════════════════════════════════════════════════════════════╝"
}

Read-Host "Press Enter to exit"
