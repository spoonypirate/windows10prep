Copy-Item -Path "$PSScriptRoot\File Explorer.lnk" -Destination "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories"
Copy-Item -Path "$PSScriptRoot\Internet Explorer.lnk" -Destination "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Accessories" 

if (Test-Path "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Outlook 2013.lnk") { 
    Import-StartLayout -LayoutPath "$PSScriptRoot\startlayouts\Office2013-LayoutModification.xml" -MountPath $env:SystemDrive\ 
} elseif (Test-Path "$env:ALLUSERSPROFILE\Microsoft\Windows\Start Menu\Programs\Outlook 2016.lnk") { 
    Import-StartLayout -LayoutPath "$PSScriptRoot\startlayouts\Office2016-LayoutModification.xml" -MountPath $env:SystemDrive\ 
} else {
    Import-StartLayout -LayoutPath "$PSScriptRoot\startlayouts\default-LayoutModification.xml" -MountPath $env:SystemDrive\ 
}