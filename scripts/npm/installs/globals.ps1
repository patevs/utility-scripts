<#
# -------------------------------- #
# scripts/npm/installs/globals.ps1 #
# -------------------------------- #

.SYNOPSIS
  PowerShell script used to install npm global modules.

.DESCRIPTION
  Ensures NodeJS and NPM are installed. Validates NodeJS and NPM
  versions along with any other required dependencies. Then installs
  NPM global modules.

  NOTE:
    This script requires the PSWriteColor module which will be installed
    if not already.

    https://github.com/EvotecIT/PSWriteColor

.EXAMPLE
  .\globals.ps1

.NOTES
  File Name: globals.ps1
  Author: PatEvs
  Last Edit: 27/03/2020

.LINK
  https://github.com/patevs/utility-scripts
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

Function Setup {
  # Print a welcome message
  Write-Host ""
  Write-Host " Git Extras Utility Install Script " -BackgroundColor Green -ForegroundColor Black
  # Firstly we verify if the PSWriteColor module is installed
  if (-Not (ExistsModule PSWriteColor)) {
    Write-Host "`n PSWriteColor module is not installed. Installing now..."
    Install-Module -Name PSWriteColor
  }
  # Now we can import the PSWriteColor module
  Import-Module PSWriteColor
  # Clear-Host
}

# Print a welcome message
Write-Host "`n NPM Global Modules Install Script " -BackgroundColor Green -ForegroundColor Black

# ------------------------------------------------------------------------------------------- #

# EOF #
