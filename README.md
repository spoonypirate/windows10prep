# windows10prep

This performs some of the initial customizations for freshly imaged Windows 10 PCs.

This targets the following areas: 

### Edge welcome prompt 
- uses powershell/active setup
- `InstallEdgeWelcome.ps1`
### Windows Defender prompt
-  also handled in edge welcome
- `InstallEdgeWelcome.ps1`
### Program Defaults
- browser default - Internet Explorer
- .pdf default - Adobe Reader DC
- handled with xml/dism
- `defaultapps.cmd`
### Start Layout Defaults
- check 64/32
- set for each office version
- `ApplyCustomMenu.ps1`
### Taskbar defaults
- handled via activesetup
- custom shortcuts
- `ApplyTaskbar.ps1`
### additional telemetry modifications if necessary 