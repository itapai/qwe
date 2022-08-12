<#

    - Remove Microsoft Defender exclusion for $GAMEBAY_PATH
    - Remove Windows firewall exception for gamebayd.exe
    - Unpin gamebay from taskbar
    - Restore default desktop wallpaper
 
#>

Function Uninstall-Shell {
    $path = $env:GAMEBAY_PATH
    if (!$path) {
        $path = "C:\Program Files\Gamebay"
    }

    # Exclude Gamebay folder from Windows Defender
    Remove-MpPreference -ExclusionPath $path

    # Remove our shell
    Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "Shell" -ErrorAction SilentlyContinue

    # Set-Wallpaper("$($key.Path)\resources\images\background.png")
}
