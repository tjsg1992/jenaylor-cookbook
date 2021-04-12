@echo off
set /p message="Enter a commit message: "
git add -A
git commit -m "%message%"
git push