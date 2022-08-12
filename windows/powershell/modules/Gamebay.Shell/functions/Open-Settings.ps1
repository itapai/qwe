Function Open-Settings {
    Param(
        [string]$Name
    )

    switch ($Name) {
        "audio" { mmsys.cpl }
        "display" { desk.cpl }
        "mouse" { main.cpl }
        "keyboard" { main.cpl keyboard }
        "controller" { joy.cpl }
    }

    # Write-Host $Name
}
