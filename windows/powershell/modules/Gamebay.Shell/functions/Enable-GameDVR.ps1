Function Enable-GameDVR {
    Write-Host "Enabling Game DVR"

    Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\GameBar" -Name "AllowAutoGameMode" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" -Name "AppCaptureEnabled"
    Remove-ItemProperty -Path "HKCU:\SOFTWARE\Policies\Microsoft\Windows\GameDVR" -Name "AllowGameDVR" -ErrorAction SilentlyContinue
    Remove-ItemProperty -Path "HKCU:\SYSTEM\GameConfigStore" -Name "GameDVR_Enabled" -ErrorAction SilentlyContinue
}
