@echo off
title WindOS 2
for /f "delims=" %%c in (usr\local\%name%\pref\sysc) do (
	set "c=%%c"
)
color %c%

:a
cls
echo=
echo= *'*'*'*'*'*
echo= # Desktop #
echo= '*'*'*'*'*'
echo=
echo= 1  Programs
echo= 2  Settings
echo= 0    Logout
echo=
set /p "opt=: "
if %opt% == 0 sys\login.cmd
if %opt% == 1 goto apps
if %opt% == 2 goto sys
goto a

:apps
cls
echo=
echo= *'*'*'*'*'*'
echo= # Programs #
echo= '*'*'*'*'*'*
echo=
echo= 1    EZ CALC
echo= 2   Terminal [COMING SOON]
echo= 3    Notepad [COMING SOON]
echo= 0     Return
echo=
set /p "opt=: "
if %opt% == 1 sys\programs\ez_calc.cmd
if %opt% == 0 goto a
goto apps

:sys
cls
echo=
echo= *'*'*'*'*'*'*'*'*'
echo= #    Settings    #
echo= '*'*'*'*'*'*'*'*'*
echo=
echo= 1  Personalization
echo= 2      Local Users
echo= 0           Return
echo=
set /p "opt=: "
if %opt% == 1 goto prefs
if %opt% == 2 goto users
if %opt% == 0 goto a
goto sys

:users
cls
echo=
echo= *'*'*'*'*'*'*'*
echo= # Local Users #
echo= '*'*'*'*'*'*'*'
echo=
echo= 1    My Account
echo= 2   Other Users [COMING SOON]
echo= 0        Return
echo=
set /p "opt=: "
if %opt% == 1 (

goto 
)
if %opt% == 0 goto sys
goto sys

:prefs
cls
echo=
echo= *'*'*'*'*'*'*'*'*'*
echo= # Personalization #
echo= '*'*'*'*'*'*'*'*'*'
echo=
echo= 1     System Colors
echo= 2        Background [COMING SOON]
echo= 3            Themes [COMING SOON]
echo= 0            Return
echo=
set /p "opt=: "
if %opt% == 1 goto sysc
if %opt% == 0 goto sys
goto sys

:sysc
cls
echo=
echo= *'*'*'*'*'*'*'*'*
echo= # System Colors #
echo= '*'*'*'*'*'*'*'*'
echo=
echo= 1   Custom Scheme
echo= 2            Dark [DEFAULT]
echo= 3           Light
echo= 4          Hacker
echo= 5      Hacker Alt
echo= 6          Forest
echo= 7        Midnight
echo= 0          Return
echo=
set /p "opt=: "
if %opt% == 2 set "c=0f" & goto syscc
if %opt% == 3 set "c=f0" & goto syscc
if %opt% == 4 set "c=0a" & goto syscc
if %opt% == 5 set "c=fa" & goto syscc
if %opt% == 6 set "c=02" & goto syscc
if %opt% == 7 set "c=09" & goto syscc
if %opt% == 1 (
	set /p "c=Color Code: "
	goto syscc
)
if %opt% == 0 goto prefs
goto sysc

:syscc
<nul set /p "= %c%" > usr\local\%name%\pref\sysc
if exist usr\local\%name%\pref\sysc (
	for /f "delims=" %%c in (usr\local\%name%\pref\sysc) do (
		set "c=%%c"
	)
)
color %c%
goto sysc