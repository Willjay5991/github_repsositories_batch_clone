@echo off
chcp 65001 
setlocal enabledelayedexpansion

REM 初始化日志文件（覆盖旧内容）
echo 脚本执行时间：%date% %time% > log.txt
echo 克隆失败记录：%date% %time% > fatal_log.txt

set "csv_file=homework-collection.csv"

for /f "skip=1 tokens=1-3 delims=," %%a in ('type "%csv_file%" ^| find /v ""') do (
    set "name=%%~a"
    set "id=%%~b"
    set "url=%%~c"
    set "folder=!name!-!id!"

    REM 输出到控制台和日志
    call :log "正在处理：姓名=!name! 编号=!id!"
    git clone "!url!" "!folder!" >> log.txt 2>&1

    REM 检查克隆结果并记录失败
    if errorlevel 1 (
        call :log "错误：!folder! 克隆失败"
        echo [失败时间] %date% %time% >> fatal_log.txt
        echo 项目名称：!folder! >> fatal_log.txt
        echo Git链接：!url! >> fatal_log.txt
        echo -------------------------- >> fatal_log.txt
    ) else (
        call :log "成功：!folder! 已克隆"
    )
)

call :log "全部操作完成！操作日志：log.txt，失败记录：fatal_log.txt"
pause
exit /b

REM 子程序：同时输出到控制台和日志文件
:log
echo %~1  &  echo %~1 >> log.txt
exit /b