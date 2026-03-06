# =============================================
# dev.ps1 — 本地開發腳本
# 使用方式：在 H:\3D 目錄執行 .\dev.ps1
# =============================================

# 1. 讀取 .env 並設定環境變數
if (-not (Test-Path ".env")) {
    Write-Host "❌ 找不到 .env 檔，請先建立 .env" -ForegroundColor Red
    exit 1
}

Get-Content ".env" | Where-Object { $_ -notmatch "^#" -and $_ -match "=" } | ForEach-Object {
    $parts = $_ -split "=", 2
    [System.Environment]::SetEnvironmentVariable($parts[0].Trim(), $parts[1].Trim(), "Process")
    Write-Host "  ✅ 載入 $($parts[0].Trim())" -ForegroundColor Green
}

# 2. 備份原始 index.html
Copy-Item "index.html" "index.html.bak" -Force
Write-Host "`n📋 備份 index.html → index.html.bak" -ForegroundColor Cyan

# 3. 注入 Firebase 設定
python3 .github/inject.py 2>&1
if ($LASTEXITCODE -ne 0) {
    # 嘗試 python（Windows 常見）
    python .github/inject.py
}
Write-Host "🔑 Firebase 設定注入完成" -ForegroundColor Cyan

# 4. 開啟瀏覽器並啟動伺服器
Write-Host "`n🚀 啟動本地伺服器 http://localhost:5500" -ForegroundColor Cyan
Write-Host "   按 Ctrl+C 停止伺服器`n" -ForegroundColor Gray

# 啟動伺服器（前景執行）
try {
    python -m http.server 5500
} finally {
    # 5. 伺服器停止後，還原 index.html
    if (Test-Path "index.html.bak") {
        Copy-Item "index.html.bak" "index.html" -Force
        Remove-Item "index.html.bak" -Force
        Write-Host "`n♻️  還原 index.html（移除 Firebase 明文設定）" -ForegroundColor Yellow
    }
}
