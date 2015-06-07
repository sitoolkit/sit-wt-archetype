@echo off

call "%~dp000_setbuildenv"

if exist "%WORK_DIR%" (
	echo ## Delete files from WORK_DIRECTROY
	echo ## WORK_DIRECTORY : %WORK_DIR%
	del /S /Q "%WORK_DIR%" > nul
)

echo ## Copy files and directories from PROJECT_ROOT to WORK_DIRECTORY
echo ## PROJECT_ROOT : %PRJ_ROOT%
echo ## WORK_DIRECTORY : %WORK_DIR%

xcopy /E /S /Q /I /EXCLUDE:%~dp0exclude-work.txt "%PRJ_ROOT%" "%WORK_DIR%"


if exist "%~dp0pause.txt" pause

