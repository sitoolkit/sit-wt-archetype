
if defined JAVA_HOME goto set_maven_home
for /F "usebackq" %%i in (`dir "%ProgramFiles%\Java\jdk*" /B /ON`) do @set JAVA_HOME=%ProgramFiles%\Java\%%i

:set_maven_home
if defined MAVEN_HOME goto set_path

for /F "usebackq" %%i in (`dir "\sit\apache-maven*" /AD /B /ON /S`) do @set MAVEN_HOME=%%i
set PATH=%PATH%;%MAVEN_HOME%\bin

:set_path
cd /D %~dp0..
set PRJ_ROOT=%CD%
set WORK_DIR=%TEMP%\sit-tester-archetype-work

