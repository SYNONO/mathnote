@echo off
cd /d "E:\MathExamVault\notebranch\mathnote\mathnote"
powershell -Command "git add . ; git commit -m 'update' ; git push origin main"
pause
