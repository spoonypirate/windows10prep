if (!(Test-Path "$env:SystemDrive\IT")) { New-Item -Path "$env:SystemDrive\" -Name "IT" -ItemType Directory }
Start-Transcript -Path "$env:SystemDrive\IT\smsts-win10prep.txt" -NoClobber -Append -Force 
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent
$Is64Bit = ((Get-WmiObject -Class Win32_Processor -Namespace root\cimv2 | Where-Object { $_.DeviceID -eq 'CPU0' } | Select-Object -ExpandProperty AddressWidth) -eq '64')
if ($is64bit) { $prgfls = "${env:ProgramFiles(x86)}" } 
else { $prgfls = "$env:ProgramFiles" }
Copy-Item -Path "$PSScriptRoot\PinTaskbar\Internet Explorer.lnk" -Destination "$env:SystemDrive\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories"
Copy-Item -Path "$PSScriptRoot\PinTaskbar\File Explorer.lnk" -Destination "$env:SystemDrive\ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories"
#for each office version so I don't have to do it 3 damn times
[string] $dirOffice = Join-Path -Path "$prgfls" -ChildPath "Microsoft Office"
$officever = (get-childitem $dirOffice) | where-object {$_.Name -like "Office*"} | select -ExpandProperty Name

if (!$officever) { Import-StartLayout -LayoutPath "$PSScriptRoot\startlayouts\default\LayoutModification.xml" -MountPath "$env:SystemDrive\" -Verbose } 
else { Import-StartLayout -LayoutPath "$PSScriptRoot\startlayouts\$officever\LayoutModification.xml" -MountPath "$env:SystemDrive\" -Verbose }

Stop-Transcript