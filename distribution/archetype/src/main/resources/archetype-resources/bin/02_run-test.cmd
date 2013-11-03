@echo off

cd /D %~dp0

call "%~dp000_setenv"
cd /D %~dp0..\
call "%MVN_CMD%" -P ci -Dtester.debug=true -Dspring.profiles.active=ff clean test

pause