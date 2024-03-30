仓库url：https://github.com/Return-Log/Hosts-Editor

@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

rem 获取 hosts 文件路径
for /f "tokens=3" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DataBasePath" 2^>nul') do (
    set "hosts_path=%%Ihosts"
)
if not exist "%hosts_path%" (
    set "hosts_path=C:\Windows\System32\drivers\etc\hosts"
)

rem 请求管理员权限
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%hosts_path%" && (
    echo 开始程序...
) || (
    echo 无法获取管理员权限，请以管理员身份运行此脚本。
    pause
    exit /b
)

:menu
cls
echo 1. 查看现有hosts规则
echo 2. 添加hosts规则
echo 3. 删除hosts规则
echo 4. 保存并退出

set /p choice=请输入选项: 

if "%choice%"=="1" (
    call :view_rules
    goto menu
) else if "%choice%"=="2" (
    call :add_rule
    goto menu
) else if "%choice%"=="3" (
    call :delete_rule
    goto menu
) else if "%choice%"=="4" (
    goto :save_and_exit
) else (
    echo 无效选项，请重新输入。
    pause
    goto menu
)

:view_rules
cls
echo 当前hosts规则:
type "%hosts_path%"
pause
exit /b

:add_rule
cls
set /p url=请输入url: 
set /p ip=请输入目标IP: 

rem 清除url之前可能的空格
set "url=%url: =%"

rem 检查url是否已经存在，存在则替换原有规则
findstr /C:"%url%" "%hosts_path%" > nul
if %errorlevel% equ 0 (
    echo %ip% %url% > "%hosts_path%.tmp"
    findstr /v /C:"%url%" "%hosts_path%" >> "%hosts_path%.tmp"
    move /y "%hosts_path%.tmp" "%hosts_path%"
) else (
    echo %ip% %url% >> "%hosts_path%"
)
echo 规则添加成功。
pause
exit /b

:delete_rule
cls
echo 当前hosts规则:
set /a index=0
for /f "tokens=1,* delims= " %%i in ('type "%hosts_path%"') do (
    set /a index+=1
    echo !index!. %%j
)
set /p delete_choice=请输入要删除的规则编号: 
set /a index=0
for /f "tokens=1,* delims= " %%i in ('type "%hosts_path%"') do (
    set /a index+=1
    if !index! equ %delete_choice% (
        set "delete_rule=%%j"
    )
)
echo 是否要删除以下规则?
echo %delete_rule%
set /p confirm=是否确认删除(y/n): 
if /i "%confirm%"=="y" (
    findstr /v /C:"%delete_rule%" "%hosts_path%" > "%hosts_path%.tmp"
    move /y "%hosts_path%.tmp" "%hosts_path%"
    echo 规则删除成功。
) else (
    echo 取消删除操作。
)
pause
exit /b

:save_and_exit
exit
