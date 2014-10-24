@ECHO OFF

SET DEBUG=0

IF "%DEBUG%"=="1" (
	ECHO %%0 = "%~0"
	ECHO %%1 = "%~1"
	ECHO %%2 = "%~2"
)

IF "%~1"=="" GOTO ERR_NO_PARAM
IF "%~2"=="" GOTO SUBLIME_CMD


IF "%DEBUG%"=="1" (
	ECHO.
	ECHO [Start]
)
timer /nologo /q
CALL "%~1"
ECHO.
FOR /F "tokens=*" %%t in ('timer /nologo /s') DO SET ELAPSED=%%t
ECHO [Finished in %ELAPSED%]
PAUSE > NUL
GOTO :EOF

:SUBLIME_CMD
ECHO "SublimeCMD" /WAIT CMD /C CALL "%~0" "%~1" "SublimeCMD"
START "SublimeCMD" /WAIT CMD /C CALL "%~0" "%~1" "SublimeCMD"
GOTO :EOF

:ERR_NO_PARAM
ECHO Error: No batch file found in parameters!
