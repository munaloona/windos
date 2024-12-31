@echo off
:a
cls
echo=
echo=  *'*'*'*'*'*'*'*'*'*'*'*'
echo=           Desktop
echo=  '*'*'*'*'*'*'*'*'*'*'*'*
echo=
echo=  1           Applications
echo=  2        System Settings
echo=
echo=  0                 Logout
echo=
set /p "opt=: "
if %opt% == 0 sys\other\login.cmd
if %opt% == 1 goto apps
if %opt% == 2 goto sys
goto a

:apps
cls
echo=
echo=  *'*'*'*'*'*'*'*'*'*'*'*'
echo=        Applications
echo=  '*'*'*'*'*'*'*'*'*'*'*'*
echo=
echo=        Coming Soon!
echo=
echo=  0                 Return
echo=
set /p "opt=: "
if %opt% == 0 goto a
goto apps

:sys
cls
echo=
echo=  *'*'*'*'*'*'*'*'*'*'*'*'
echo=      System Settings
echo=  '*'*'*'*'*'*'*'*'*'*'*'*
echo=
echo=        Coming Soon!
echo=
echo=  0                 Return
echo=
set /p "opt=: "
if %opt% == 0 goto a
goto sys