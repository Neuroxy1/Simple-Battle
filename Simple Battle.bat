@echo off
color 0f
title Simple Battle - Made by Damian

:pre
cls
echo.
echo What is your name?
echo.
set /p name= Desired Name: 

if not defined name (
echo You must enter a name!
pause>nul
goto pre
)
echo.
echo Teleporting %name% to battle menu!...
PING localhost -n 2 -w 60000>nul
goto data

:data
set health=100
set speed=1
set dmg=10
set monhp=100
set exp=0
goto menu

:menu
cls
echo.
echo = Battle Menu =
echo = =========== =
echo.
echo Player Stats: Monster HP: [%monhp%]
echo -------------
echo Name: [%name%]
echo Exp: [%exp%]
echo HP: [%health%] 
echo Speed: [%speed%]
echo DMG: [%dmg%]
echo -------------
echo [1] To Attack!
echo [2] Upgrade stats!
echo.
set /p cmd= Choose a command!: 

if not defined cmd (
Echo You must enter a command!
pause>nul
goto menu
)

if %cmd% EQU 1 goto attack
if %cmd% EQU 2 goto upgrade
goto menu

:attack
cls
echo.
echo You attack the monster!
PING localhost -n 2 -w 60000>nul
echo.
echo You damaged the monster and have delt %dmg% damage!
PING localhost -n 2 -w 60000>nul
set /a monhp=%monhp% - %dmg%
goto mon

:mon
PING localhost -n 2 -w 60000>nul
cls
echo.
echo The monster attempts to attack you!
PING localhost -n 2 -w 60000>nul
echo.
echo The monster has hit you!
PING localhost -n 2 -w 60000>nul
set /a health=%health% - %RANDOM% %%10 - 1%
goto menu

:upgrade
cls
echo.
echo = Skills Upgrade Menu =
echo = =================== =
echo.
echo Please select the skill you want to upgrade!
echo.
echo ----------------
echo Health: %health%
echo Damage: %dmg%
echo Speed: %speed%
echo ----------------
echo.
set /p upg=

if not defined upg (
Echo You must enter a command!
pause>nul
goto upgrade
)

if %upg% EQU Health (
set /a health=%health% + 1
PING localhost -n 2 -w 60000>nul
goto menu
)
goto upgrade


