@echo off
setlocal enabledelayedexpansion

:: 设置字符集为 UTF-8 防止中文乱码
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

:: 2. 执行 Hexo Git 流程
echo [1/3] Adding changes...
git add .

echo [2/3] Committing changes...
git commit -m "%COMMIT_MSG%"

echo [3/3] Pushing to remote...
git push

echo ========================================
echo   部署完成Hexo博客！将在 5 秒后开始部署Valaxy镜像站...
echo ========================================

:: 5秒倒计时
for /l %%i in (5,-1,1) do (
    echo %%i 秒后开始部署Valaxy镜像站...
    ping -n 2 127.0.0.1 > nul
)

echo ========================================
echo   开始部署Valaxy镜像站...
echo ========================================

:: 复制文件
echo [1/4] 复制文章文件...
xcopy "D:\blog\NewHexoBlog\source\_posts\*.*" "D:\blog\Mete0r-blog\pages\posts\" /E /Y /I
if errorlevel 1 (
    echo 文件复制失败！
    pause
    exit /b 1
)

:: 切换到Valaxy项目目录并执行Build
echo [2/4] 切换到Valaxy项目目录...
cd /d "D:\blog\Mete0r-blog"

echo [3/4] 执行Build.cmd...
call Build.cmd
if errorlevel 1 (
    echo Build.cmd 执行失败！
    pause
    exit /b 1
)

:: 切换到dist目录进行Git操作
echo [4/4] 切换到dist目录进行Git部署...
cd /d "D:\blog\Mete0r-blog\dist"

:: Git操作
git add .
git commit -m "%COMMIT_MSG%"

:: 强制推送（防止推送出现问题）
echo 执行强制推送...
git push --force

echo ========================================
echo   部署完成Valaxy镜像站！窗口将在 10 秒后关闭...
echo ========================================

:: 10秒倒计时
for /l %%i in (10,-1,1) do (
    echo %%i 秒后关闭窗口...
    ping -n 2 127.0.0.1 > nul
)

exit