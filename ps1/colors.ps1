<# scripts/ps1/colors.ps1

.SYNOPSIS
  List all colors available to PowerShell.

.DESCRIPTION
  PowerShell script to list all colors available to use with PowerShell.

.EXAMPLE
  .\colors.ps1

.NOTES
  File Name: colors.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 01/04/2020 - April 1st 2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/ps1/colors.ps1
#>

# https://stackoverflow.com/a/20541733
# The console colors are in an enum called [System.ConsoleColor].
# You can list all the values using the GetValues static method of [Enum]
#   $ [Enum]::GetValues([System.ConsoleColor])
# or
#   $ [Enum]::GetValues([ConsoleColor])

# -------------------------------------------------------------------------------- #

# https://stackoverflow.com/a/41954792
$colors = [enum]::GetValues([System.ConsoleColor])
Foreach ($bgcolor in $colors){
    Foreach ($fgcolor in $colors) {
      Write-Host "$fgcolor|"  -ForegroundColor $fgcolor -BackgroundColor $bgcolor -NoNewLine
    }
    Write-Host " on $bgcolor"
}

# EOF #
