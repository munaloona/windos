@echo on
:!
set "i="
set "cmd="
echo=
echo= WindOS [Version 2.1.0]
echo= Type "help" for a list of commands.
echo=
set /p "cmd= [%name%] "
if exist program_data\terminal\cmds.csv (
	for /f "tokens=1-2 delims=:" %%a in ("%cmd%") do (
		for /f "tokens=1 delims=," %%1 in (program_data\terminal\cmds.csv) do (
			if "%%a" == "%%1" (echo= & call :%%1 "%%b")
		)
	)
)
goto !

:help
echo=help,clear,exit,print
exit /b

:clear
cls
exit /b

:exit
exit

:print 1
set "param=%1"
if "%param:~1,1%" == " " (set "param=%param:~2%" & set "param=%param:"=%)
echo=%param%
exit /b