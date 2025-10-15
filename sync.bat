@echo off
REM Check if git is installed
git --version

if %ERRORLEVEL% NEQ 0 (
	cls
	echo You do not have the Git utility installed. Install it from here:
	echo https://git-scm.com/downloads
	pause
	exit
)
cls
echo Syncing local repo to the github repo...
git fetch origin
git reset --hard origin/main
echo Sync complete. Your AHK system is up to date.
pause