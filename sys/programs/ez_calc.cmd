@echo off
title EZ CALC!
:loop
for /f "tokens=1-2 delims=," %%a in (sys\programs\program_data\ez_calc\last.csv) do (
	set "res=%%a = %%b"
)
cls
echo= %res%
echo=
type sys\programs\program_data\ez_calc\.title
echo=
echo=
echo= Type 1 For Calculations
echo= Type / To Close
echo=
set /p "inp=: "
if "%inp%" == "1" goto total
if "%inp%" == "/" call sys\desk.cmd app
for /f "tokens=1-3 delims= " %%a in ("%inp%") do (
	setlocal enableDelayedExpansion
	for /f "tokens=1-2 delims=:." %%a in ('time /t') do set time=%%a:%%b
	    set /a "resu=%%a%%b%%c"
	echo %inp%,!resu!,!time! > sys\programs\program_data\ez_calc\last.csv & echo %inp%,!resu!,!time! >> sys\programs\program_data\ez_calc\total.csv
)
echo=
echo=  %resu%
echo=
echo=  PRESS ANY KEY
pause >nul
goto loop

:total
echo=
for /f "tokens=1-2 delims=," %%a in (sys\programs\program_data\ez_calc\total.csv) do (
	setlocal enableDelayedExpansion
	set "res=%%a = %%b"
	echo=  !res!
)
echo=
echo=  PRESS ANY KEY
pause >nul
goto loop