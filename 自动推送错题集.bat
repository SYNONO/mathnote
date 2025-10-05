@echo off
:: 考研数学错题集自动推送工具
:: 编码：ANSI

echo ========================================
echo    推送错题集到 GitHub
echo ========================================
echo.

:: 切换到仓库目录
cd /d "E:\MathExamVault\notebranch\mathnote\mathnote"

:: 检查是否成功切换目录
if not exist ".git" (
    echo 错误：找不到 Git 仓库！
    echo 请确认路径是否正确
    pause
    exit /b 1
)

echo [1/4] 检查错题集变化...
git status --short "错题集/"
echo.

echo [2/4] 添加错题集文件...
git add "错题集/"
git add ".gitignore"
git add "自动推送错题集.bat"
git add "自动推送错题集.ps1"
echo 完成
echo.

echo [3/4] 提交到本地仓库...
git commit -m "更新错题集"

if errorlevel 1 (
    echo.
    echo 提示：没有新的变化需要提交
    echo.
    pause
    exit /b 0
)

echo.
echo [4/4] 推送到 GitHub...
git push origin main

if errorlevel 1 (
    echo.
    echo 推送失败！请检查网络连接
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo 成功！错题集已推送到 GitHub
echo ========================================
echo 查看仓库: https://github.com/SYNONO/mathnote
echo.
pause
