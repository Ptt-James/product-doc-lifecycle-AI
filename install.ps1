# Product-Doc-Lifecycle Skill 一键安装脚本
# 适用于 Windows PowerShell

Write-Host "🚀 Installing Product-Doc-Lifecycle Skill for CodeBuddy..." -ForegroundColor Cyan
Write-Host ""

# 检测 CodeBuddy skills 目录
$skillsDir = "$env:USERPROFILE\.codebuddy\skills"
if (-not (Test-Path $skillsDir)) {
    Write-Host "⚠️  Warning: CodeBuddy skills directory not found at $skillsDir" -ForegroundColor Yellow
    Write-Host "   Creating directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $skillsDir -Force | Out-Null
}

# 临时目录
$tempDir = Join-Path $env:TEMP "pdla-install-$(Get-Random)"
New-Item -ItemType Directory -Path $tempDir -Force | Out-Null
Set-Location $tempDir

Write-Host "📥 Downloading from GitHub..." -ForegroundColor Cyan
try {
    git clone --depth 1 https://github.com/Ptt-James/product-doc-lifecycle-AI.git 2>&1 | Out-Null
    if (-not (Test-Path "product-doc-lifecycle-AI")) {
        throw "Failed to clone repository"
    }
} catch {
    Write-Host "❌ Failed to clone repository: $_" -ForegroundColor Red
    Set-Location $HOME
    Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue
    exit 1
}

Write-Host "📦 Installing Skill..." -ForegroundColor Cyan
Copy-Item -Recurse -Force "product-doc-lifecycle-AI\product-doc-lifecycle" "$skillsDir\"

# 清理临时目录
Set-Location $HOME
Remove-Item -Recurse -Force $tempDir -ErrorAction SilentlyContinue

Write-Host ""
Write-Host "✅ Installation complete!" -ForegroundColor Green
Write-Host ""
Write-Host "Skill location: $skillsDir\product-doc-lifecycle" -ForegroundColor Cyan
Write-Host ""
Write-Host "To verify installation, ask AI in CodeBuddy:" -ForegroundColor Cyan
Write-Host '  "List available skills"' -ForegroundColor White
Write-Host ""
Write-Host "To get started, try:" -ForegroundColor Cyan
Write-Host '  "Help me initialize the documentation system"' -ForegroundColor White
