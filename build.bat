@echo off
setlocal

call :Command git submodule update --init --recursive
call :RunSubtreeCommand pull

call :Command pwsh -NoProfile -File "%~dp0third-party\obs-studio\CI\build-windows.ps1"
exit /b

:DeleteFolder
setlocal EnableDelayedExpansion
    if exist "%~1" (
        rmdir /q /s "%~1"
        echo Removed folder: "%~1"
    )
exit /b 0

:RunSubtreeCommand
    setlocal EnableDelayedExpansion
    set subtree_command=%~1
    call :Command git subtree %subtree_command% --prefix third-party/obs-studio https://github.com/joelvaneenwyk/obs-studio.git main --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/win-dshow/libdshowcapture https://github.com/obsproject/libdshowcapture.git master --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/mac-syphon/syphon-framework https://github.com/palana/Syphon-Framework.git master --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/enc-amf https://github.com/obsproject/obs-amd-encoder.git master --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/obs-browser https://github.com/obsproject/obs-browser.git master --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/obs-outputs/ftl-sdk https://github.com/Mixer/ftl-sdk.git master --squash
    REM call :Command git subtree %subtree_command% --prefix third-party/obs-studio/plugins/obs-websocket https://github.com/obsproject/obs-websocket.git master --squash
exit /b

:RemoveModules
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/win-dshow/libdshowcapture"
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/mac-syphon/syphon-framework"
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/enc-amf"
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-browser"
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-outputs/ftl-sdk"
    call :Command rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-websocket"
exit /b 0

:Command
setlocal EnableDelayedExpansion
    set "_command=%*"
    set "_command=!_command:   = !"
    set "_command=!_command:  = !"
    echo ##[cmd] !_command!
    !_command!
exit /b
