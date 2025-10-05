# 考研数学错题集 - 一键推送工具
# 请右键选择"使用 PowerShell 运行"

Write-Host "========================================"
Write-Host "   推送错题集到 GitHub"
Write-Host "========================================"
Write-Host ""

# 切换目录
Set-Location "E:\MathExamVault\notebranch\mathnote\mathnote"

# 检查变化
Write-Host "[1/4] 检查错题集变化..."
$changes = git status --short "错题集/"
if ($changes) {
    Write-Host $changes
    Write-Host "发现变化！" -ForegroundColor Green
} else {
    Write-Host "没有新的变化需要提交" -ForegroundColor Yellow
    Read-Host "按回车键退出"
    exit
}

# 添加文件
Write-Host ""
Write-Host "[2/4] 添加文件..."
git add "错题集/"
git add ".gitignore"
Write-Host "完成" -ForegroundColor Green

# 提交
Write-Host ""
Write-Host "[3/4] 提交到本地..."
$timestamp = Get-Date -Format "yyyy-MM-dd HH:mm"
git commit -m "更新错题集 - $timestamp"
Write-Host "完成" -ForegroundColor Green

# 推送
Write-Host ""
Write-Host "[4/4] 推送到 GitHub..."
git push origin main
Write-Host "完成" -ForegroundColor Green

# 成功提示
Write-Host ""
Write-Host "========================================" -ForegroundColor Green
Write-Host "成功！错题集已推送到 GitHub" -ForegroundColor Green
Write-Host "========================================" -ForegroundColor Green
Write-Host "查看: https://github.com/SYNONO/mathnote"
Write-Host ""
Read-Host "按回车键退出"
