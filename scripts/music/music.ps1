<# scripts/music/music.ps1

.SYNOPSIS
  `PowerShell` script for setting up a music environment.

  ! Requires `Python` and `Pip` to be installed.

.DESCRIPTION
  1. Ensure `Python` and `Pip` are installed and check versions.
  2. (Optional) Upgrade `Pip` installation.
  4. Install `Pip` packages ensuring required dependencies are met for each.

  Tested Python Versions:
    * 3.8.2

  **NOTE** : This script will install the [`PSWriteColor`](https://github.com/EvotecIT/PSWriteColor) module.

.EXAMPLE
  .\music.ps1

.NOTES
  File Name: music.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 30/03/2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/music/music.ps1
#>

# ---------------- #
# HELPER FUNCTIONS #
# ---------------- #

# Check if a given PowerShell module is installed
Function ExistsModule ($moduleName) {
  return [bool](Get-Module -ListAvailable -Name $moduleName)
}

# Check if a given command exists
# https://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
Function ExistsCommand($cmdName) {
  # return [bool](Get-Command -Name $cmdName -ea 0)
  return [bool](Get-Command -Name $cmdName -ErrorAction SilentlyContinue)
}

# ------------------------------------------------------------------------------------------- #

# Print a welcome message
Write-Host ""
Write-Host " Music Environment Setup Script " -BackgroundColor Magenta -ForegroundColor Black

# Verify if PSWriteColor module is installed
if (-Not (ExistsModule PSWriteColor)) {
  Write-Host "`n PSWriteColor module is not installed. " -NoNewline
  Write-Host "Installing Now... " -ForegroundColor Green -NoNewline
  Install-Module -Name PSWriteColor
  Write-Host " Done " -BackgroundColor Green -ForegroundColor Black
}
Import-Module PSWriteColor
# Uninstall-Module PSWriteColor

# Verify Python and Pip are installed
Write-Color " `n Verifying ", "Python", " and ", "Pip", " Installations... `n" -C White, Cyan, White, Cyan, White

# Python
if (ExistsCommand python) {
  $pythonVersion = Invoke-Expression "python --version"
  $pythonVersion = $pythonVersion -replace "Python "
  Write-Color "+--------+-------+" -StartSpace 4
  Write-Color "|", " Python ", "|", " $pythonVersion ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+--------+-------+" -StartSpace 4
} else {
  Write-Color "Python", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# ------------------------------------------------------------------------------------------- #

# EOF #