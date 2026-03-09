@echo off
setlocal enabledelayedexpansion
:: 设置字符集为 UTF-8 防止中文乱码（可选）
chcp 65001 > nul

:: 1. 自动提取当前日期和时间 (格式: YYYYMMDD:HHmm)
set CUR_DATE=%date:~0,4%%date:~5,2%%date:~8,2%
set CUR_TIME=%time:~0,2%%time:~3,2%
:: 处理小时位是个位数时可能出现的空格
set CUR_TIME=%CUR_TIME: =0%
set COMMIT_MSG=[%CUR_DATE%:%CUR_TIME%]

echo ========================================
echo   Mete0r 博客自动化部署启动...
echo   提交信息: %COMMIT_MSG%
echo ========================================

:: 2. 执行 Git 流程
echo [1/3] Adding changes...
git add .

echo [2/3] Committing changes...
git commit -m "%COMMIT_MSG%"

echo [3/3] Pushing to remote...
:: 提示：如果你有多个远程库，可以指定 git push origin main
git push

echo ========================================
echo   部署完成！窗口将在 3 秒后关闭...
echo ========================================

ping -n 4 127.0.0.1 > nul
exit