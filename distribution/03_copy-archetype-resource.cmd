@echo off
setlocal enabledelayedexpansion

call "%~dp000_setbuildenv"

set RES_DIR=%~dp0archetype\src

if exist "%RES_DIR%" (
	echo ## Delete ARCHETYPE_RESOUCE_DIRECTORY
	echo ## ARCHETYPE_RESOUCE_DIRECTORY : %RES_DIR%
	del /S /Q "%RES_DIR%" > nul
	rmdir /S /Q "%RES_DIR%" > nul
) else (
	mkdir "%RES_DIR%"
)

set ARC_RES=%WORK_DIR%\target\generated-sources\archetype\src

echo ## Copy ARCHETYPE_RESOURCES to ARCHETYPE_RESOUCE_DIRECTORY
echo ## ARCHETYPE_RESOURCES : %ARC_RES%
echo ## ARCHETYPE_RESOUCE_DIRECTORY : %RES_DIR%
xcopy /E /I /Q /S /EXCLUDE:%~dp0exclude-resource.txt "%ARC_RES%" "%RES_DIR%"

cd /D "%RES_DIR%\main\resources\archetype-resources\.settings"
for %%i in (sit-wt-archetype*) do call :rename-file %%i


if exist "%~dp0pause.txt" pause

endlocal
goto :eof

rem 
rem rename and replace chars
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
