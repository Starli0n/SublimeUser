@echo off

tasklist /FI "IMAGENAME eq sublime_text.exe" 2>NUL | find /I /N "sublime_text.exe">NUL
if "%ERRORLEVEL%"=="0" goto ERR_PRG

set DST=Packages
junction -d %~dp0%DST%

if "%~1"=="" goto ERR_NO_PARAM
set SRC=%~1

junction %~dp0%DST% "%SRC%"

start ..\sublime_text.exe

goto :eof

:ERR_NO_PARAM
echo Error: No data path found in parameters!
goto ERR_END

:ERR_PRG
echo Error: Sublime Text is still running!
goto ERR_END

:ERR_END
echo.
pause
