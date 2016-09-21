Copy-Item -Path "$PSScriptRoot\PinTaskbar" -Container -Include * -Recurse -Destination "$env:windir\ManageTaskbar" -Force
$arguments = 'add "HKEY_LOCAL_MACHINE\Software\Microsoft\Active Setup\Installed Components\Managetaskbar" /v "StubPath" /d "Powershell.exe -NoProfile -ExecutionPolicy ByPass -WindowStyle Hidden -file C:\Windows\Managetaskbar\PinTaskbar\taskband.ps1" /f'
Start-Process $env:windir'\system32\reg.exe' -ArgumentList $arguments -WindowStyle Hidden
