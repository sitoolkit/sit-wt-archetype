@echo off

call "%~dp000_setbuildenv"

cd /D "%WORK_DIR%"

echo ## ワークディレクトリのプロジェクトからアーキタイプを作成します。
call "%MVN_CMD%" -Darchetype.filteredExtentions=java,xml,txt,groovy,cs,mdo,aj,jsp,gsp,vm,html,xhtml,properties,.classpath,.project,launch,component^
	archetype:create-from-project

pause
