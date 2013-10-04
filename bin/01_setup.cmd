@echo off


call "%~dp000_setenv"
cd /D %~dp0..\
call "%MVN_CMD%" -P setup dependency:unpack

pause