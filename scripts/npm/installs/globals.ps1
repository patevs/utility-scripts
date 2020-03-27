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

# Print a welcome message
Write-Host ""
Write-Host " NPM Global Modules Install Script " -BackgroundColor Magenta -ForegroundColor Black

# Verify if PSWriteColor module is installed
if (-Not (ExistsModule PSWriteColor)) {
  Write-Host "`n PSWriteColor module is not installed. " -NoNewline
  Write-Host "Installing Now... " -ForegroundColor Green -NoNewline
  Install-Module -Name PSWriteColor
  # Write-Host "Done." -ForegroundColor Green
  Write-Host " Done " -BackgroundColor Green -ForegroundColor Black
}
# Import PSWriteColor module
Import-Module PSWriteColor
# Uninstall-Module PSWriteColor

# Next we verify NodeJS and NPM are installed.
Write-Color " `n Verifying ", "NodeJS", " and ", "NPM", " Installations... `n" -C White, Cyan, White, Cyan, White

# $nodeVersion = $null
# $npmVersion = $null

# NodeJS
if (ExistsCommand node) {
  $nodeVersion = Invoke-Expression "node --version"
  Write-Color "+--------+----------+" -StartSpace 4
  Write-Color "|", " NodeJS ", "|", " $nodeVersion ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+--------+----------+" -StartSpace 4
} else {
  Write-Color "NodeJS", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# NPM
if (ExistsCommand npm) {
  $npmVersion = Invoke-Expression "npm --version"
  Write-Color "|", "  NPM   ", "|", "  $npmVersion  ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+--------+----------+" -StartSpace 4
} else {
  Write-Color "NPM", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# Begin install
Write-Color " `n All Requirements Satisfied! ", "Installing NPM Global Modules..." -C White, Green

# ------------------------------------------------------------------------------------------- #

# EOF #
