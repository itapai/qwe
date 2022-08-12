<#

    - Set-ExecutionPolicy -Bypass -Force
    - Install winget
    - Add Microsoft Defender exclusion for $GAMEBAY_PATH
    - Add Windows firewall exception for gamebayd.exe
    - Create HTTP and HTTPS endpoints for WinRM
    - Pin gamebay to taskbar 
    - Set custom desktop wallpaper

#>

Function Install-Shell {

    # Use default path if not found in env or regkeys (mostly for testing)
    $path = $env:GAMEBAY_PATH
    if (!$path) {
        $path = "C:\Program Files\Gamebay"
    }

    # Make sure we're running as Administrator
    # Check HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\EnableLUA, set to 0
    Set-ExecutionPolicy Bypass -Force

    # Install winget
    # & "$PSScriptRoot/../internal/Install-Winget.ps1"

    # Exclude Gamebay folder from Windows Defender
    Add-MpPreference -ExclusionPath $path

    # Firewall exception for gamebayd.exe
    # New-NetFirewallRule -Displayname 'Gamebay' -Name 'Gamebay' -Program $path\gamebayd.exe -Profile Any -Protocol TCP -LocalPort 9837

    # Create WinRM endpoints
    # Enable-PSRemoting -SkipNetworkProfileCheck
    # $cert = New-SelfSignedCertificate -DnsName $env:COMPUTERNAME -CertStoreLocation Cert:\CurrentUser\My -FriendlyName "Ansible Gamebay" -NotAfter (Get-Date).AddYears(10)
    # New-Item -Path WSMan:\localhost\Listener\ -Transport HTTPS -Address * -CertificateThumbPrint $cert.Thumbprint -Force
    # New-NetFirewallRule -Displayname 'WinRM - Powershell remoting HTTPS-In' -Name 'WinRM - Powershell remoting HTTPS-In' -Profile Any -Protocol TCP -LocalPort 5986
    # Restart-Service WinRM

    # For removing, delete LayoutModification.xml from C:\Users\Default\AppData\Local\Microsoft\Windows\Shell
    # Import-StartLayout -LayoutPath "$PSScriptRoot/../files/CustomTaskbar.xml" -MountPath $env:SystemDrive\

    # Set-Wallpaper("$($key.Path)\resources\images\background.png")
}
