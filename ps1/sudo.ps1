# ------------ #
# ps1/sudo.ps1 #
# ------------ #

# Testings methods of implementing the sudo unix command in powershell

function sudo() {
    if ($args.Length -eq 1) {
        start-process $args[0] -verb "runAs"
    }
    if ($args.Length -gt 1) {
        start-process $args[0] -ArgumentList $args[1..$args.Length] -verb "runAs"
    }
}

# From https://github.com/Pscx/Pscx
function sudo(){
    Invoke-Elevated @args
}

function sudo {
    $file, [string]$arguments = $args;
    $psi = new-object System.Diagnostics.ProcessStartInfo $file;
    $psi.Arguments = $arguments;
    $psi.Verb = "runas";
    $psi.WorkingDirectory = get-location;
    [System.Diagnostics.Process]::Start($psi) >> $null
}

# https://stackoverflow.com/questions/7690994/running-a-command-as-administrator-using-powershell
function sudo {
    Start-Process powershell -Verb runAs
    if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")) {
        Start-Process powershell.exe "-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"" -Verb RunAs;
        exit
    }
}

# EOF #
