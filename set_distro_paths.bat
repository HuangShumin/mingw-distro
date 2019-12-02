@echo off
if not exist "%~dp0bin\gcc.exe" goto epicfail
if "%X_DISTRO%" == "nuwen" goto :eof
set X_DISTRO=nuwen
if exist "%~dp0git\cmd\git.exe" set PATH=%~dp0git\cmd;%PATH%
set PATH=%~dp0bin;%PATH%
set X_MEOW=%~dp0include;%~dp0include\freetype2
if defined C_INCLUDE_PATH (set C_INCLUDE_PATH=%X_MEOW%;%C_INCLUDE_PATH%) else (set C_INCLUDE_PATH=%X_MEOW%)
if defined CPLUS_INCLUDE_PATH (set CPLUS_INCLUDE_PATH=%X_MEOW%;%CPLUS_INCLUDE_PATH%) else (set CPLUS_INCLUDE_PATH=%X_MEOW%)
set X_MEOW=
if not defined GREP_COLORS (set GREP_COLORS=mt=01;32:fn=36:ln=33:bn=31:se=35)
doskey alias=doskey $*
doskey ls=dir $*
doskey rm=del $*
doskey cp=copy $*
doskey mv=move $*
doskey rmr=rd /s $*
doskey cpr=xcopy $*
doskey ps=tasklist $*
doskey pwd=cd
doskey cat=type $*
doskey man=help $*
doskey clear=cls
doskey kill=taskkill /PID $*
doskey grep=grep --color=auto $*
doskey sudo=runas /user:administrator $*
doskey o=if '$*'=='' (start .) else (start $*)
doskey ..=cd ..\$*
doskey ...=cd ..\..\$*
doskey ....=cd ..\..\..\$*
doskey .....=cd ..\..\..\..\$*
doskey cd=if '$*'=='' (pushd %HOMEDRIVE%%HOMEPATH%) else if '$*'=='-' (popd) else (pushd $*)
::extract vim.exe/tee.exe/xxd.exe to C:\MinGW\bin from Win32 console executable from https://www.vim.org/download.php#pc
goto :eof

:epicfail
color 4f
echo ERROR: You must run %~nx0 from the root of the distro.
echo        Don't copy or move this batch file.
title ERROR
goto :eof
