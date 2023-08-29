@echo off
setlocal

call :DeleteFolder "%~dp0build"
call :DeleteFolder "%~dp0third-party\obs-studio\build64"

exit /b 0

:DeleteFolder
setlocal EnableDelayedExpansion
    if exist "%~1" (
        rmdir /q /s "%~1"
        echo Removed folder: "%~1"
    )
exit /b 0
