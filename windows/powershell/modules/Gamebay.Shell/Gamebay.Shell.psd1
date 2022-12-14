@{
    RootModule           = "Gamebay.Shell.psm1"
    ModuleVersion        = "1.0.0"
    GUID                 = "ccec0ab2-270a-4a81-8fc7-023211241f3c"

    Author               = "itapai"
    Description          = "A set of powershell scrips for managing the gamebay shell."

    # Minimum version of the Windows PowerShell engine required by this module
    PowerShellVersion    = "5.1"

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport    = @(
        "Install-Shell",
        "Uninstall-Shell",
        "Repair-Shell",
        "Start-Shell",
        "Stop-Shell",

        "Open-Settings",
        "Show-Process"
    )

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    CmdletsToExport      = @()

    # Variables to export from this module
    VariablesToExport    = "*"

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    AliasesToExport      = @()

    # DSC resources to export from this module
    DscResourcesToExport = @()

    # List of all modules packaged with this module
    ModuleList           = @()

    # List of all files packaged with this module
    FileList             = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData          = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            # Tags = @()

            # A URL to the license for this module.
            # LicenseUri = ""

            # A URL to the main website for this project.
            # ProjectUri = ""

            # A URL to an icon representing this module.
            # IconUri = ""

            # ReleaseNotes of this module
            # ReleaseNotes = ""

        } 

    } 

}
