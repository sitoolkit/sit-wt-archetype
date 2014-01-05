
if defined JAVA_HOME goto set_maven_home
for /F "usebackq" %%i in (`dir "%ProgramFiles%\Java\jdk*" /B /ON`) do @set JAVA_HOME=%ProgramFiles%\Java\%%i

:set_maven_home
if defined MAVEN_HOME goto set_maven_cmd

set MAVEN_HOME=C:\sit\apache-maven-3.1.1
if not exist "%MAVEN_HOME%" (
	set MAVEN_HOME=D:\sit\apache-maven-3.1.1
)

:set_maven_cmd
set MVN_CMD=%MAVEN_HOME%\bin\mvn

