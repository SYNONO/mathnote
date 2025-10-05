# 考研数学错题集自动推送工具 (PowerShell版)
# 编码：UTF-8

# 设置错误时继续执行
$ErrorActionPreference = "Continue"

# 颜色输出函数
function Write-ColorOutput($ForegroundColor) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args) {
        Write-Output $args
    }
    $host.UI.RawUI.ForegroundColor = $fc
}

Write-Host "========================================" -ForegroundColor Cyan
Write-Host "   📚 考研数学错题集自动推送工具" -ForegroundColor Cyan
Write-Host "========================================" -ForegroundColor Cyan
Write-Host ""

# 切换到仓库目录
Set-Location "E:\MathExamVault\notebranch\mathnote\mathnote"

# 步骤1：检查变化
Write-Host "[1/5] 🔍 检查错题集变化..." -ForegroundColor Yellow
$status = git status --short "错题集/"
if ($status) {
    Write-Host $status -ForegroundColor Gray
    Write-Host "✓ 发现 $($status.Count) 个文件有变化" -ForegroundColor Green
} else {
    Write-Host "⚠️  错题集没有新的变化" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "按任意键退出"
    exit 0
}

# 步骤2：添加文件
Write-Host ""
Write-Host "[2/5] ➕ 添加错题集文件..." -ForegroundColor Yellow
git add "错题集/"
git add ".gitignore"
Write-Host "✓ 文件已添加到暂存区" -ForegroundColor Green

# 步骤3：获取统计信息
Write-Host ""
Write-Host "[3/5] 📊 统计变化..." -ForegroundColor Yellow
$diffStats = git diff --cached --stat "错题集/"
Write-Host $diffStats -ForegroundColor Gray

# 步骤4：提交
Write-Host ""
Write-Host "[4/5] 💾 提交到本地仓库..." -ForegroundColor Yellow
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
$commitMessage = "更新错题集 - $timestamp"

try {
    git commit -m $commitMessage
    Write-Host "✓ 提交成功" -ForegroundColor Green
} catch {
    Write-Host "❌ 提交失败: $_" -ForegroundColor Red
    Read-Host "按任意键退出"
    exit 1
}

# 步骤5：推送
Write-Host ""
Write-Host "[5/5] 🚀 推送到 GitHub..." -ForegroundColor Yellow
try {
    git push origin main
    Write-Host "✓ 推送成功" -ForegroundColor Green
} catch {
    Write-Host "❌ 推送失败: $_" -ForegroundColor Red
    Write-Host "   可能的原因：" -ForegroundColor Yellow
    Write-Host "   - 网络连接问题" -ForegroundColor Gray
    Write-Host "   - GitHub 认证失败" -ForegroundColor Gray
    Write-Host "   - 远程仓库冲突" -ForegroundColor Gray
    Read-Host "按任意键退出"
    exit 1
}

# 成功提示
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "✅ 错题集已成功推送到 GitHub！" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "📊 查看仓库: https://github.com/SYNONO/mathnote" -ForegroundColor Cyan
Write-Host ""
Read-Host "按任意键退出"
