@echo off

call "%~dp000_setbuildenv"

cd /D "%WORK_DIR%"

echo ## Create archetype from project at WORK_DIRECTORY
echo ## WORK_DIRECTORY : %WORK_DIR%

call mvn -Darchetype.filteredExtentions=java,xml,txt,groovy,cs,mdo,aj,jsp,gsp,vm,html,xhtml,properties,.classpath,.project,launch,component^
	archetype:create-from-project

if exist "%~dp0pause.txt" pause

