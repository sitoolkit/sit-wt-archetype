@echo off

call "%~dp000_setbuildenv"

cd /D %~dp0archetype

call "%MVN_CMD%" clean install

pause
