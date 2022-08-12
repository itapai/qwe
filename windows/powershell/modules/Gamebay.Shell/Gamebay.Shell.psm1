Get-ChildItem -Path $PSScriptRoot\functions\*.ps1 | ForEach-Object { . $_.FullName }

[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
