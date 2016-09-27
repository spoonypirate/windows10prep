takeown /f c:\windows\WEB\wallpaper\Windows\img0.jpg
takeown /f C:\Windows\Web\4K\Wallpaper\Windows\*.*
icacls c:\windows\WEB\wallpaper\Windows\img0.jpg /Grant System:(F)
icacls C:\Windows\Web\4K\Wallpaper\Windows\*.* /Grant System:(F)

xcopy DesktopWallpaper\img0.jpg C:\Windows\Web\Wallpaper\Windows\ /Q /Y