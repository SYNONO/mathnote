Set-Location "E:\MathExamVault\notebranch\mathnote\mathnote"
Write-Host "Pushing to GitHub..."
git add "错题集/"
git commit -m "Update notes"
git push origin main
Write-Host "Done!"
Read-Host "Press Enter to exit"
