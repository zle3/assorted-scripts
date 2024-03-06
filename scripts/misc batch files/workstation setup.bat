@echo off
REM Batch Script Name: workstation-setup.bat
REM Description: Completes Initial Setup commands in Workstation Setup Instructions
REM              
REM 
REM Author: Zach Le
REM
REM Version: 1.0
REM
REM Date: February 28, 2024
REM Last Modified: February 28, 2024
REM
REM Usage: my_script [options]
REM
REM Options:
REM   -h, --help     Display this help message and exit
REM   -v, --version  Display script version and exit
REM
REM Dependencies: I: drive mapped with read permissions
REM               dell command update exists in either .msi or .exe format
REM
REM Notes: Any additional notes or considerations about the script.
REM
REM
REM
echo/ 
echo/       
echo/               _
echo/              ^(_^)
echo/               ^|
echo/          ^(^)---^|---^(^)
echo/               ^|
echo/               ^|
echo/        __     ^|     __
echo/       ^|\     /^^\     /^|
echo/         '..-'   '-..'
echo/           `-._ _.-`
echo/               `                                                                                                                                       
echo/
echo/ .------..------..------..------..------..------..------.       
echo/ ^|A.--. ^|^|U.--. ^|^|T.--. ^|^|H.--. ^|^|O.--. ^|^|R.--. ^|^|:.--. ^|.-.    
echo/ ^| ^(\/^) ^|^| ^(\/^) ^|^| :/\: ^|^| :/\: ^|^| :/\: ^|^| :^(^): ^|^| :/\: ^(^(5^)^)   
echo/ ^| :\/: ^|^| :\/: ^|^| ^(__^) ^|^| ^(__^) ^|^| :\/: ^|^| ^(^)^(^) ^|^| :\/: ^|'-.-.  
echo/ ^| '--'A^|^| '--'U^|^| '--'T^|^| '--'H^|^| '--'O^|^| '--'R^|^| '--':^| ^(^(1^)^) 
echo/ `------'`------'`------'`------'`------'`------'`------'  '-'  
echo/ .------..------..------..------.     .------..------.          
echo/ ^|Z.--. ^|^|A.--. ^|^|C.--. ^|^|H.--. ^|.-.  ^|L.--. ^|^|E.--. ^|          
echo/ ^| :^(^): ^|^| ^(\/^) ^|^| :/\: ^|^| :/\: ^(^(5^)^) ^| :/\: ^|^| ^(\/^) ^|          
echo/ ^| ^(^)^(^) ^|^| :\/: ^|^| :\/: ^|^| ^(__^) ^|'-.-.^| ^(__^) ^|^| :\/: ^|          
echo/ ^| '--'Z^|^| '--'A^|^| '--'C^|^| '--'H^| ^(^(1^)^) '--'L^|^| '--'E^|          
echo/ `------'`------'`------'`------'  '-'`------'`------'          
echo/ 
echo/ 
echo Last Modified: February 28, 2024
echo/
echo/


@echo off
setlocal enabledelayedexpansion

REM Define the registry key path
set "regKey=HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"

REM Read the DisplayVersion value from the registry
for /f "tokens=2*" %%A in ('reg query "%regKey%" /v DisplayVersion 2^>nul ^| find "DisplayVersion"') do (
    set "displayVersion=%%B"
)

REM Check if the DisplayVersion matches "22H2"
if not "%displayVersion%"=="22H2" (
    echo Display version is not 22H2. Exiting script.
    timeout 5
    exit /b
)

echo Display version is 22H2. Proceeding with the script.
endlocal

REM Put your script commands here

REM Performing a forced Group Policy update.
echo Performing gpupdate...
gpupdate /force

REM Copy Dell Command Update from I: drive to IT Repo
echo Copying Dell Command Update executable  from I: drive to IT Repo
xcopy "I:\Software\Enterprise\Dell Command Update\*.EXE" "C:\IT_Repository\Dell Command Update" /y
echo Copying Dell Command Update msi if it exists from I: drive to IT Repo
xcopy "I:\Software\Enterprise\Dell Command Update\*.MSI" "C:\IT_Repository\Dell Command Update" /y

REM Restart device to apply gpupdate and allow for admin permission
echo Restarting device in 20 seconds ctrl c to abort
timeout 10
restart /r /t 10