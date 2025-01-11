@echo off
title WindOS 2
:a
cls
echo=
echo= *'*'*'*'*'
echo= # WindOS #
echo= '*'*'*'*'*
echo=
echo= 1  Sign In
echo= 2     Info
echo=
set /p "opt=: "
if %opt% == 1 goto signin
if %opt% == 2 goto info
goto a

:signin
cls
echo=
echo= *'*'*'*'*'*
echo= # Sign In #
echo= '*'*'*'*'*'
echo=
echo= 1   Sign In
echo= 2  Add User
echo= 0    Return
echo=
set /p "opt=: "
if %opt% == 1 goto login
if %opt% == 2 goto createuser
if %opt% == 0 goto a
goto signin

:createuser
echo=
set /p "name=Username: "
set /p "pass=Password: "

:: Creates the username and password memory files
for /f "delims=," %%A in (sys\mem\id_global) do (
	setlocal enableDelayedExpansion
	set /a id_global=%%A-1
	<nul set /p "= !id_global!" > sys\mem\id_global
	setlocal disabledelayedexpansion
)
>> sys\mem\users.csv echo %id_global%,2,%name%,%pass%
mkdir usr\local\%name% & mkdir usr\local\%name%\bin & mkdir usr\local\%name%\sbin & mkdir usr\local\%name%\pref
mkdir home\%name% & mkdir home\%name%\documents & mkdir home\%name%\downloads
<nul set /p "= 0f" > usr\local\%name%\pref\sysc

cd sys\mem

if exist users.csv (
	for /f "tokens=1-4 delims=," %%A in (users.csv) do (
	set "users[%%~A][id]=%%~A"
	set "users[%%~A][level]=%%~B"
    set "users[%%~A][name]=%%~C"
    set "users[%%~A][password]=%%~D"
	)
)
cd ..\..
goto signin

:login
echo=
set /p "name=Username: "
set /p "pass=Password: "

findstr ",%name%," sys\mem\users.csv >nul || (
    goto signin
)

for /f "tokens=4 delims=," %%A in ('findstr ",%name%," sys\mem\users.csv 2^>nul') do set "realpass=%%~A"
if not "%realpass%"=="%pass%" (
    goto signin
)

for /f "tokens=2 delims=," %%A in ('findstr ",%name%," sys\mem\users.csv 2^>nul') do set "lvl=%%~A"
for /f "tokens=1 delims=," %%A in ('findstr ",%name%," sys\mem\users.csv 2^>nul') do set /a "id=%%~A*-1"
set name=%name%
set pass=%pass%

sys\desk.cmd
exit /b

:info
cls
echo=
type sys\txt\info
echo=
echo=         ANY KEY TO RETURN
pause >nul
goto a