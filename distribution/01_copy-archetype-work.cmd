@echo off

call "%~dp000_setbuildenv"

if exist "%WORK_DIR%" (
	echo ## ワークディレクトリ内をクリアします。
	del /S /Q "%WORK_DIR%" > nul
)

echo ## プロジェクト内のファイル、ディレクトリをワークディレクトリにコピーします。

xcopy /E /S /Q /I /EXCLUDE:%~dp0exclude-work.txt "%PRJ_ROOT%" "%WORK_DIR%"


