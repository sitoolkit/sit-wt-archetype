@echo off

cd /D %~dp0

call 00_setenv
call mvn -P ci clean test

pause