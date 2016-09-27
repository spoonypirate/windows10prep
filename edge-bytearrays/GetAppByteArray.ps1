$noApp = (Get-ItemProperty -Path "hkcu:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites").Favorites

Write-Output "Please pin the app to the taskbar and move it as far left as possible, to the first location in the taskbar."
Write-Output "Note that you can't move it past Cortana/Search or Task View buttons, that's alright."

$x = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")

$app = (Get-ItemProperty -Path "hkcu:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Taskband" -Name "Favorites").Favorites

if ($app.Length -le $noApp.Length)
{
    Write-Output "It seems that no app was pinned. Aborting."
}
else
{
    $lastIndex = (($app.Length - $noApp.Length) - 1)
    $appByteArray = $app[0..$lastIndex]

    Write-Output "App byte array found, writing to file."

    Out-File -FilePath ".\appByteArray.txt" -Encoding ascii -InputObject ($appByteArray -join ",")
}