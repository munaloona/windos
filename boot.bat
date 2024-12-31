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
start sys\other\login.cmd
exit