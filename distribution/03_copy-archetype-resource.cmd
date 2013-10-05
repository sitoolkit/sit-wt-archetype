@echo off

call "%~dp000_setbuildenv"

set RES_DIR=%~dp0archetype\src

if exist "%RES_DIR%" (
	echo ## アーキタイプ資源ディレクトリを削除します。
	del /S /Q "%RES_DIR%" > nul
	rmdir /S /Q "%RES_DIR%" > nul
)

echo ## アーキタイプ資源をコピーします。
xcopy /E /I /Q /S /EXCLUDE:%~dp0exclude-resource.txt "%WORK_DIR%\target\generated-sources\archetype\src" "%RES_DIR%"

cd /D "%RES_DIR%\main\resources\archetype-resources\.settings"
for %%i in (sit-tester-archetype*) do call :rename-file %%i

pause
goto :eof

:rename-file
set file_name=%1
set file_name=%file_name:sit-tester-archetype=__rootArtifactId__%
rename %1 %file_name%
goto :eof
