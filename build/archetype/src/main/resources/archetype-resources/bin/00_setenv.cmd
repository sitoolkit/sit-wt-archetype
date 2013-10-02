
for /F "usebackq" %%i in (`dir /B /ON "%ProgramFiles%\java\jdk*"`) do @set JAVA_HOME=%ProgramFiles%\Java\%%i
if defined MAVEN_HOME (
	goto setpath
)

for /F "usebackq" %%i in (`dir /B /ON "C:\sit\apache-maven*"`) do @set MAVEN_HOME=C:\sit\%%i
if not exist "%MAVEN_HOME%" (
	for /F "usebackq" %%i in (`dir /B /ON "D:\sit\apache-maven*"`) do @set MAVEN_HOME=D:\sit\%%i
)
:setpath
set PATH=%PATH%;%MAVEN_HOME%\bin

