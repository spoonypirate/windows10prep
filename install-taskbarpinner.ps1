Copy-Item -Path (Join-Path -Path $PSScriptRoot -ChildPath "EdgeWelcome.ps1") -Destination (Join-Path -Path $env:SystemDrive -ChildPath "IT")
Copy-Item -Path (Join-Path -Path $PSScriptRoot -ChildPath "syspin.exe") -Destination (Join-Path -Path $env:SystemDrive -ChildPath "IT") 
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\taskbarpinner" -type Directory
new-itemproperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\taskbarpinner" -Name "Version" -Value 1 -PropertyType String -Force 
new-itemproperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\taskbarpinner" -Name "StubPath" -Value "powershell.exe -NoProfile -WindowStyle Hidden -ExecutionPolicy ByPass -File C:\IT\taskbarpinner.ps1" -PropertyType ExpandString -Force
