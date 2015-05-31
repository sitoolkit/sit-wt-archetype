@echo off
setlocal enabledelayedexpansion

call "%~dp000_setbuildenv"

set RES_DIR=%~dp0archetype\src

if exist "%RES_DIR%" (
	echo ## �A�[�L�^�C�v�����f�B���N�g�����폜���܂��B
	del /S /Q "%RES_DIR%" > nul
	rmdir /S /Q "%RES_DIR%" > nul
) else (
	mkdir "%RES_DIR%"
)

echo ## �A�[�L�^�C�v�������R�s�[���܂��B
echo ## %RES_DIR%
xcopy /E /I /Q /S /EXCLUDE:%~dp0exclude-resource.txt "%WORK_DIR%\target\generated-sources\archetype\src" "%RES_DIR%"

cd /D "%RES_DIR%\main\resources\archetype-resources\.settings"
for %%i in (sit-wt-archetype*) do call :rename-file %%i

endlocal
goto :eof

rem 
rem �t�@�C�����l�[����������u��
rem 
:rename-file
set in_file=%1
set out_file=%in_file:sit-wt-archetype=__artifactId__%

echo #set( $symbol_pound = '#' )>%out_file%
echo #set( $symbol_dollar = '$' )>>%out_file%
echo #set( $symbol_escape = '\' )>>%out_file%

for /f "delims=" %%j in (%in_file%) do (
    set line=%%j
    echo !line:${workspace_loc:/sit-wt-archetype}=${symbol_dollar}{workspace_loc:/${artifactId}}!>>%out_file%
)
del %in_file%
goto :eof
