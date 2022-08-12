Function Set-Wallpaper($Wallpaper) {
    $code = 
    @'
    using System.Runtime.InteropServices; 
    namespace Win32 {
        public class Wallpaper {
            [DllImport("user32.dll", CharSet=CharSet.Auto)]
            static extern int SystemParametersInfo (int uAction , int uParam , string lpvParam , int fuWinIni);
             
            public static void SetWallpaper(string path){
                SystemParametersInfo(20, 0, path, 3);
            }
        }
     }
'@

    Add-Type $code 
    [Win32.Wallpaper]::SetWallpaper($Wallpaper)
}

# Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "Wallpaper" -Value "$($key.Path)\resources\images\background.png"
# Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "WallpaperStyle" -Value 4
