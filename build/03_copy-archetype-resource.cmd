@echo off

call "%~dp000_setbuildenv"

set RES_DIR=%PRJ_ROOT%\build\archetype\src

if exist "%RES_DIR%" (
	echo ## アーキタイプ資源ディレクトリを削除します。
	del /S /Q "%RES_DIR%" > nul
	rmdir /S /Q "%RES_DIR%" > nul
)

echo ## アーキタイプ資源をコピーします。
xcopy /E /I /Q /S /EXCLUDE:%~dp0exclude-resource.txt "%WORK_DIR%\target\generated-sources\archetype\src" "%RES_DIR%"

pause
