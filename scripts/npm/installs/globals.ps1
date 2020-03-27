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

#

# ------------------------------------------------------------------------------------------- #

# EOF #
