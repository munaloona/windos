@echo off
mode 50,15
cd sys
for /f %%a in ('echo prompt $E^| cmd') do set "\e=%%a"
cd mem
if exist users.csv (
	for /f "tokens=1-4 delims=," %%A in (users.csv) do (
	set "users[%%~A][id]=%%~A"
	set "users[%%~A][level]=%%~B"
    set "users[%%~A][name]=%%~C"
    set "users[%%~A][password]=%%~D"
	)
)
cd ..\..
setlocal disableDelayedExpansion
sys\login.cmd
exit /b