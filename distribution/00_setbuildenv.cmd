
if defined JAVA_HOME goto set_maven_home
for /F "usebackq" %%i in (`dir "%ProgramFiles%\Java\jdk*" /B /ON`) do @set JAVA_HOME=%ProgramFiles%\Java\%%i



:set_maven_home
if defined MAVEN_HOME goto set_path

set MAVEN_HOME=D:\dev\asf\maven\apache-maven
if not exist "%MAVEN_HOME%" (
	set MAVEN_HOME=C:\dev\asf\maven\apache-maven
)



:set_path
set PATH=%MAVEN_HOME%\bin;%JAVA_HOME%\bin;%PATH%


set CUR_DIR=%CD%
cd /D %~dp0..
set PRJ_ROOT=%CD%
cd /D %CUR_DIR%

set WORK_DIR=%TEMP%\sit-wt-archetype-work

