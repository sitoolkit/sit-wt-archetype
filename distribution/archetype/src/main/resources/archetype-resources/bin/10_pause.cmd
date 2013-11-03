@echo off

set PAUSE_FILE=%~dp0.pause

if exist "%PAUSE_FILE%" (
	del "%PAUSE_FILE%"
) else (
	echo %DATE% %TIME% > "%PAUSE_FILE%"
)