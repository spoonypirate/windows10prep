if (!(Test-Path "$env:SystemDrive\IT")) { New-Item -Path "$env:SystemDrive\" -Name "IT" -ItemType Directory }
Copy-Item -Path (Join-Path -Path $PSScriptRoot -ChildPath "EdgeWelcome.ps1") -Destination (Join-Path -Path $env:SystemDrive -ChildPath "Windows") 
New-Item -Path "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\EdgeWelcome" -type Directory
new-itemproperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\EdgeWelcome" -Name "Version" -Value 1 -PropertyType String -Force 
new-itemproperty "HKLM:\SOFTWARE\Microsoft\Active Setup\Installed Components\EdgeWelcome" -Name "StubPath" -Value "powershell.exe  -NoProfile -ExecutionPolicy ByPass -File C:\windows\EdgeWelcome.ps1" -PropertyType ExpandString -Force
