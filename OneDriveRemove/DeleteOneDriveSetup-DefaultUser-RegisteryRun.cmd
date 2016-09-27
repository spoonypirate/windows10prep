reg.exe load HKEY_LOCAL_MACHINE\defuser c:\users\default\ntuser.dat
reg.exe delete HKEY_LOCAL_MACHINE\defuser\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v OneDriveSetup /f
reg.exe unload HKEY_LOCAL_MACHINE\defuser