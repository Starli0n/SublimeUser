@echo off

goto main


:git_batch
echo ### %1 ###
cd %1
echo Fetching...
git fetch --all
echo.

echo +++ HEAD +++
git llh
echo.

for /f "tokens=2" %%i in ('git branch') do (
	echo +++ %%i +++
	git llx %%i 2> nul
	echo.
)
for /f %%i in ('git remote') do (
	for /f "tokens=2" %%j in ('git branch') do (
		echo +++ %%i/%%j +++
		git llx %%i/%%j 2> nul
		echo.
	)
)
cd ..
echo.
echo.
goto :eof

:main
rem Current = Data/Packages
cd ../../../..
echo CD=%cd%
echo.
call :git_batch AgentRansack
call :git_batch Dos
call :git_batch FileDiffs
call :git_batch Git
call :git_batch Open-Include
call :git_batch package_control.git
call :git_batch package_control_channel.git
call :git_batch PHPUnit
call :git_batch Slack
call :git_batch Terminal
call :git_batch TestSettings
call :git_batch User
call :git_batch Verbose
