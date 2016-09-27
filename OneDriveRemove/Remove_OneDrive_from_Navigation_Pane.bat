@echo off

:: Created by: Shawn Brink
:: http://www.tenforums.com/
:: Tutorial: https://www.tenforums.com/tutorials/4818-onedrive-add-remove-navigation-pane-windows-10-a.html


REG ADD "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /V Attributes /T REG_DWORD /D 4035969101 /F

:: To kill and restart explorer
taskkill /f /im explorer.exe
start explorer.exe