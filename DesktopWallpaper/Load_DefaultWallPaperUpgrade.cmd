@echo off
set "wallpath=%windir%\web\wallpaper"
set "fourkwallpath=%windir%\web\4k\wallpaper"
set "oldwall=%wallpath%\Windows\img0.jpg"
set "newwall=%~dp0img0.jpg"

(
Takeown.exe /F "%WallPath%" /R /D Y
Takeown.exe /F "%fourkwallpath%" /R /D Y
Icacls.exe "%WallPath%" /Grant "%username%":"F" /T
Del /Q "%oldWall%"
Copy "%newWall%" "%oldWall%"
REG ADD "HKCU\Control Panel\Desktop" /V "Wallpaper" /T "REG_SZ" /D "%oldWall%" /F
icacls "%wallpath%\img0.jpg" /Grant System:"F" /T
icacls "%fourkwallpath%\*.*" /Grant System:"F" /T
)1>Nul