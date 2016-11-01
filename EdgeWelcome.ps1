Start-Transcript -Path "$env:SystemDrive\IT\smsts-win10prep.txt" -NoClobber -Append -Force 
function Start-Proc
{
     param([string]$Exe = $(Throw "An executable must be specified"),
           [string]$Arguments,
           [switch]$Hidden,
           [switch]$waitforexit)
 
     $startinfo = New-Object System.Diagnostics.ProcessStartInfo
     $startinfo.FileName = $Exe
     $startinfo.Arguments = $Arguments
     if ($Hidden) {
         $startinfo.WindowStyle = 'Hidden'
         $startinfo.CreateNoWindow = $True
     }
     $process = [System.Diagnostics.Process]::Start($startinfo)
     if ($waitforexit) { $process.WaitForExit() }
     return $process.ExitCode
}
 
$RunScript=$args[0]
 
if(!$RunScript)
{
     $args = "-ExecutionPolicy ByPass -File $($PSScriptRoot)\edgewelcome.ps1 Run"
     Start-Proc -Exe "Powershell.exe" -Arguments $args -Hidden
     exit 0
}
 
do {
     Start-Sleep -Milliseconds 2000
} While (!(Test-Path -path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe"))
 
New-Item -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge" -type Directory
New-Item -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Firstrun" -type Directory
New-Item -Path "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -type Directory
# These two values removes the Edge Welcome screen
new-itemproperty "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\FirstRun" -Name "LastFirstRunVersionDelivered" -Value 1 -Type DWORD -Force -ErrorAction SilentlyContinue | Out-Null
new-itemproperty "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name IE10TourShown -Value 1 -Type DWORD -Force -ErrorAction SilentlyContinue | Out-Null
# This registry entry disabled the prompt to make Edge the default browser
new-itemproperty "HKCU:\SOFTWARE\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge\Main" -Name "DisallowDefaultBrowserPrompt" -Value 1 -Type DWORD -Force -ErrorAction SilentlyContinue | Out-Null

new-itemproperty "HKCU:\SOFTWARE\Microsoft\Windows Defender" -Name "UIFirstRun" -Value 0 -Type DWORD -Force -ErrorAction SilentlyContinue | Out-Null

Stop-Transcript