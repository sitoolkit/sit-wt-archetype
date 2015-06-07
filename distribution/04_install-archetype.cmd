@echo off

call "%~dp000_setbuildenv"

cd /D %~dp0archetype

call mvn clean install

if exist "%~dp0pause.txt" pause
