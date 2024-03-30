repository url https://github.com/Return-Log/Hosts-Editor

@echo off
chcp 65001 > nul

setlocal enabledelayedexpansion

rem Get the hosts file path
for /f "tokens=3" %%I in ('reg query "HKLM\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DataBasePath" 2^>nul') do (
    set "hosts_path=%%Ihosts"
)
if not exist "%hosts_path%" (
    set "hosts_path=C:\Windows\System32\drivers\etc\hosts"
)

rem Request administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%hosts_path%" && (
    echo Starting the program...
) || (
    echo Unable to obtain administrator privileges. Please run this script as an administrator.
    pause
    exit /b
)

:menu
cls
echo 1. View existing hosts rules
echo 2. Add hosts rule
echo 3. Delete hosts rule
echo 4. Save and exit

set /p choice=Enter your choice: 

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
    echo Invalid option, please try again.
    pause
    goto menu
)

:view_rules
cls
echo Current hosts rules:
type "%hosts_path%"
pause
exit /b

:add_rule
cls
set /p url=Enter the URL: 
set /p ip=Enter the target IP: 

rem Clear any possible spaces in the URL
set "url=%url: =%"

rem Check if the URL already exists, if so, replace the existing rule
findstr /C:"%url%" "%hosts_path%" > nul
if %errorlevel% equ 0 (
    echo %ip% %url% > "%hosts_path%.tmp"
    findstr /v /C:"%url%" "%hosts_path%" >> "%hosts_path%.tmp"
    move /y "%hosts_path%.tmp" "%hosts_path%"
) else (
    echo %ip% %url% >> "%hosts_path%"
)
echo Rule added successfully.
pause
exit /b

:delete_rule
cls
echo Current hosts rules:
set /a index=0
for /f "tokens=1,* delims= " %%i in ('type "%hosts_path%"') do (
    set /a index+=1
    echo !index!. %%j
)
set /p delete_choice=Enter the rule number to delete: 
set /a index=0
for /f "tokens=1,* delims= " %%i in ('type "%hosts_path%"') do (
    set /a index+=1
    if !index! equ %delete_choice% (
        set "delete_rule=%%j"
    )
)
echo Do you want to delete the following rule?
echo %delete_rule%
set /p confirm=Confirm deletion (y/n): 
if /i "%confirm%"=="y" (
    findstr /v /C:"%delete_rule%" "%hosts_path%" > "%hosts_path%.tmp"
    move /y "%hosts_path%.tmp" "%hosts_path%"
    echo Rule deleted successfully.
) else (
    echo Deletion operation canceled.
)
pause
exit /b

:save_and_exit
exit
