@echo off
setlocal enabledelayedexpansion

:: --- 用户配置区 ---
set GIT_USER=mete0rxsc
:: ------------------

:: 1. 获取当前远程仓库地址
for /f "tokens=2" %%i in ('git remote get-url origin') do set CURRENT_URL=%%i

:: 2. 自动检查并修复 URL (如果没带用户名，则加上)
echo %CURRENT_URL% | findstr /C:"%GIT_USER%@" >nul
if %errorlevel% neq 0 (
    echo [系统] 正在优化 Git 远程配置以跳过账号选择...
    :: 替换 https:// 为 https://mete0rxsc@
    set NEW_URL=%CURRENT_URL:https://=https://%GIT_USER%@%
    git remote set-url origin !NEW_URL!
    echo [系统] 配置已更新: !NEW_URL!
)

:: 3. 生成时间戳 (格式: 20260309:1230)
set CUR_DATE=%date:~0,4%%date:~5,2%%date:~8,2%
set CUR_TIME=%time:~0,2%%time:~3,2%
set CUR_TIME=%CUR_TIME: =0%
set COMMIT_MSG=[%CUR_DATE%:%CUR_TIME%]

echo ========================================
echo   Mete0r 博客部署工具 (用户: %GIT_USER%)
echo ========================================

echo [1/3] Adding changes...
git add .

echo [2/3] Committing: %COMMIT_MSG%
git commit -m "%COMMIT_MSG%"

echo [3/3] Pushing to GitHub...
git push

if %ERRORLEVEL% equ 0 (
    echo.
    echo ========================================
    echo   部署成功！正在同步至 Cloudflare/Vercel...
    echo ========================================
) else (
    echo.
    echo [错误] 部署失败，请检查网络或 Git 凭据。
)

timeout /t 5
exit