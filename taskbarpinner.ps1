Start-Transcript -Path "C:\IT\smsts-win10prep.txt" -NoClobber -Append -Force 
$PSScriptRoot = Split-Path $MyInvocation.MyCommand.Path -Parent

$Is64Bit = ((Get-WmiObject -Class Win32_Processor -Namespace root\cimv2 | Where-Object { $_.DeviceID -eq 'CPU0' } | Select-Object -ExpandProperty AddressWidth) -eq '64')
if ($is64bit) { $prgfls = "${env:ProgramFiles(x86)}" } 
else { $prgfls = "$env:ProgramFiles" }

& $PSScriptRoot\syspin.exe "$prgfls\Internet Explorer\iexplore.exe" c:5386

#for each office version so I don't have to do it 3 damn times
[string] $dirOffice = Join-Path -Path "$prgfls" -ChildPath "Microsoft Office"
$officever = (get-childitem $dirOffice) | where-object {$_.Name -like "Office*"} | select -ExpandProperty Name

if ($null -ne $officever) {& $PSScriptRoot\syspin.exe "$diroffice\$officever\OUTLOOK.EXE" c:5386 }
Stop-Transcript