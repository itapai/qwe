<#

    - Disable GameDVR
    - Unlock Microsoft Edge
    - Unlock user permissions
    - Stop FriendlyFire.exe (optionally)

#>

Function Stop-Shell {

    Enable-GameDVR
    # Unlock-EdgeBrowser
    Unlock-Permissions

    Stop-Process -Name FriendlyFire -Force -ErrorAction SilentlyContinue
    # Stop-Process -Name gamebayd -Force -ErrorAction SilentlyContinue

    # Disable startup programs
    # Remove-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" -Force

    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoRestartShell" -Value 1
    Stop-Process -Name sihost -Force
}
