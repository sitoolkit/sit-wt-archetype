@echo off

cd /D %~dp0

call "%~dp000_setenv"
cd /D %~dp0..\
call "%MVN_CMD%" -P demo,ci clean test

pause