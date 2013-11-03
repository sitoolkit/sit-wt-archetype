@echo off

set PAUSE_FILE=%~dp0.%~n0

if exist "%PAUSE_FILE%" (
	del "%PAUSE_FILE%"
) else (
	echo %DATE% %TIME% > "%PAUSE_FILE%"
)