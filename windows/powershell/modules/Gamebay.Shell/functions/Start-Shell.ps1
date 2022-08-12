<#

    - Set custom shell (registry)
    - Ensure WinRM is running
    - Disable GameDVR
    - Lock Microsoft Edge
    - Lock user permissions
    - Start FriendlyFire.exe, if not running

#>

Function Start-Shell {
    # Use default path if not found in env or regkeys (mostly for testing and for launching the shell from the installer)
    $GAMEBAY_PATH= $env:GAMEBAY_PATH
    if (!$GAMEBAY_PATH) {
        $GAMEBAY_PATH = "C:\Program Files\Friendly Fire"
    }

    # Check connection requirments ( winrm endpoints )
    Set-Service -Name WinRM -Status Running

    # Lock user permissions
    Disable-GameDVR
    Lock-EdgeBrowser
    # Lock-Permissions

    try {
        # if (!(Get-Process gamebayd -ErrorAction SilentlyContinue)) {
        #     & Start-Process "$GAMEBAY_PATH\gamebayd.exe" -WindowStyle Hidden -ErrorAction Stop

        #     # If we don't wait, gamebayd tray icon doesn't load :S
        #     Start-Sleep -Seconds 1
        # }
   
        # Stop-Process -Name FriendlyFire -Force -ErrorAction SilentlyContinue
        & Start-Process "$GAMEBAY_PATH\FriendlyFire.exe"

        # Kill explorer.exe
        Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AutoRestartShell" -Value 0
        Stop-Process -Name explorer -Force        
    }
    catch {
        Write-Output $_.Exception

        Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableTaskMgr" -ErrorAction SilentlyContinue
        Start-Process powershell
    }



    # Set custom shell on every start
    # New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -ErrorAction SilentlyContinue | Out-Null
    # Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "Shell" -Value "$path\bootstrap.bat"
}
