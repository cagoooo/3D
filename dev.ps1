# dev.ps1 - Local development server with Firebase config injection
# Usage: .\dev.ps1

if (-not (Test-Path ".env")) {
    Write-Host "ERROR: .env not found" -ForegroundColor Red
    exit 1
}

# Load .env into environment variables
Get-Content ".env" | Where-Object { $_ -notmatch "^#" -and $_ -match "=" } | ForEach-Object {
    $parts = $_ -split "=", 2
    $key = $parts[0].Trim()
    $value = $parts[1].Trim()
    [System.Environment]::SetEnvironmentVariable($key, $value, "Process")
    Write-Host "  OK: $key" -ForegroundColor Green
}

# Backup original index.html
Copy-Item "index.html" "index.html.bak" -Force
Write-Host "Backup: index.html -> index.html.bak" -ForegroundColor Cyan

# Inject Firebase config via inject.py
python .github/inject.py
Write-Host "Injected Firebase config" -ForegroundColor Cyan

# Start local server
Write-Host ""
Write-Host "Server: http://localhost:5500" -ForegroundColor Yellow
Write-Host "Press Ctrl+C to stop" -ForegroundColor Gray
Write-Host ""

try {
    python -m http.server 5500
}
finally {
    # Restore original index.html on exit
    if (Test-Path "index.html.bak") {
        Copy-Item "index.html.bak" "index.html" -Force
        Remove-Item "index.html.bak" -Force
        Write-Host "Restored: index.html (placeholders back)" -ForegroundColor Yellow
    }
}
