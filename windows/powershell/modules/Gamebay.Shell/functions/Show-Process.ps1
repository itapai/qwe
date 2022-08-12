Function Show-Process {
    Param(
        $Process,
        [Switch]$Maximize
    )

    $sig = '
      [DllImport("user32.dll")] public static extern bool ShowWindowAsync(IntPtr hwnd, int nCmdShow);
      [DllImport("user32.dll")] public static extern int SetForegroundWindow(IntPtr hwnd);
      [DllImport("user32.dll")] public static extern void SwitchToThisWindow(IntPtr hwnd, bool fUnknown);
    '

    # if ($Maximize) { $Mode = 3 } else { $Mode = 4 }

    $type = Add-Type -MemberDefinition $sig -Name WindowAPI -PassThru
    $hwnd = $process.MainWindowHandle

    # $null = $type::ShowWindowAsync($hwnd, 4)
    # $null = $type::SetForegroundWindow($hwnd) 

    # https://docs.microsoft.com/en-us/windows/win32/api/winuser/nf-winuser-switchtothiswindow
    $type::SwitchToThisWindow($hwnd, $true)
}
