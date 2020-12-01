@echo off
REM Created by: enriquop
REM Computer name changer
Title Cambiador de Nombre Ordenador
echo %Computername%
openfiles >NUL 2>&1 
if NOT %ERRORLEVEL% EQU 0 goto NotAdmin 
:start
SET choice=
SET /p choice=Deseas cambiar el nombre del ordenador? [Y/N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "%choice%" is not valid
ECHO.
GOTO start

:no
cls
ECHO vas a salir del menu
timeout 2 > nul
echo saliendo...
timeout 1 > nul
EXIT

:yes
set /p newname="Que nombre quieres que tenga el ordenador? "
WMIC ComputerSystem where Name="%Computername%" call Rename Name=%newname%
echo Cambiado correctamente a %newname%, Porfavor reinicia el ordenador para aplicar cambios
timeout 2 > nul
:start1
SET choice=
SET /p choice=Deseas reiniciar el ordenador? [Y/N]: 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes1
IF '%choice%'=='y' GOTO yes1
IF '%choice%'=='N' GOTO no1
IF '%choice%'=='n' GOTO no1
IF '%choice%'=='' GOTO no1
ECHO "%choice%" is not valid
ECHO.
GOTO start

:no1
cls
ECHO Has decidido no reiniciar (EL nombre se cambiara a %newname% cuando reinicies el ordenador)
timeout 2 > nul
echo saliendo...
timeout 1 > nul
EXIT

:yes1
CLS
echo Reiniciando ordenador...
timeout 2 > nul
start shutdown.exe /r /t 00
EXIT
goto End
:NotAdmin 
echo Porfavor abre este programa como administrador. 
:End
pause
