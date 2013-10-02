@echo off

call "%~dp000_setbuildenv"

cd /D %~dp0archetype

call mvn clean install

pause
