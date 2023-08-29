@echo off
setlocal

git subtree add --prefix third-party/obs-studio https://github.com/joelvaneenwyk/obs-studio.git main --squash
git subtree add --prefix third-party/obs-studio/plugins/win-dshow/libdshowcapture https://github.com/obsproject/libdshowcapture.git master --squash
git subtree add --prefix third-party/obs-studio/plugins/mac-syphon/syphon-framework https://github.com/palana/Syphon-Framework.git master --squash
git subtree add --prefix third-party/obs-studio/plugins/enc-amf https://github.com/obsproject/obs-amd-encoder.git master --squash
git subtree add --prefix third-party/obs-studio/plugins/obs-browser https://github.com/obsproject/obs-browser.git master --squash
git subtree add --prefix third-party/obs-studio/plugins/obs-outputs/ftl-sdk https://github.com/Mixer/ftl-sdk.git master --squash
git subtree add --prefix third-party/obs-studio/plugins/obs-websocket https://github.com/obsproject/obs-websocket.git master --squash
exit /b

git submodule update --init --recursive
pwsh -NoProfile -File "%~dp0third-party\obs-studio\CI\build-windows.ps1"
exit /b

rmdir /q /s "%~dp0third-party/obs-studio/plugins/win-dshow/libdshowcapture"
rmdir /q /s "%~dp0third-party/obs-studio/plugins/mac-syphon/syphon-framework"
rmdir /q /s "%~dp0third-party/obs-studio/plugins/enc-amf"
rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-browser"
rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-outputs/ftl-sdk"
rmdir /q /s "%~dp0third-party/obs-studio/plugins/obs-websocket"
exit /b 0
