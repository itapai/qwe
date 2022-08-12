Function Disable-GameDVR {
    Write-Host "Disabling Game DVR"
    
    # Create empty key
    New-Item -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -ErrorAction SilentlyContinue | Out-Null

    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\GameBar" -Name "AllowAutoGameMode" -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled" -Value 0
    Set-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -Value 0
    Set-ItemProperty -Path "HKCU:\SYSTEM\GameConfigStore" -Name "GameDVR_Enabled" -Value 0
}
