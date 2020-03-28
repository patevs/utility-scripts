<#
# ----------------------------------- #
# scripts/git/installs/git-extras.ps1 #
# ----------------------------------- #

TODO:
  * Allow for passing of git location as an argument.
  * Tidy up the script.

.SYNOPSIS
  PowerShell script used to install `git-extras` utilities.
  Requires `git` to be installed.

  * https://github.com/tj/git-extras


.DESCRIPTION
  1. Ensure `git` is installed and attempts to find the executable
      location (first path in where git.exe wins) on disk.

  2. Clone the `git-extras` repository, set location to cloned repository,
      then run the provided install.cmd script.

  3. Delete the `git-extras` repository as it is no longer needed.

  Note:
    This script requires the `PSWriteColor` module which will be installed.

    * https://www.powershellgallery.com/packages/PSWriteColor
    * https://github.com/EvotecIT/PSWriteColor

.EXAMPLE
  .\git-extras.ps1

.NOTES
  File Name: git-extras.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 28/03/2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/git/installs/git-extras.ps1
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

# TODO: Tidy up these functions

Function InstallGitExtras {
  # Firstly we verify git is installed
  if (ExistsCommand git){
    Write-Host "`n Installing git-extras utilities..."  -ForegroundColor Green
    # Get git executable location
    # Default Git location:
    $gitPath = "$env:ProgramFiles\Git"
    # Test if path exists
    if (-Not (Test-Path $gitPath)) {
      # Attempt to find the path using scoop
      $gitPath = Invoke-Expression "scoop prefix git"
    }
    # Clone the repository
    Write-Host "`n Cloning git-extras repository... `n"  -ForegroundColor Green
    Invoke-Expression "git clone https://github.com/tj/git-extras.git"
    # Run the install script
    Write-Host "`n Running git-extras install script... `n"  -ForegroundColor Green
    # Invoke-Expression "git-extras\install.cmd $gitLocation"
    git-extras\install.cmd $gitPath
    # Finally remove the git-extras repository
    Remove-Item -Recurse -Force "git-extras"
    Write-Host "`n DONE!"  -ForegroundColor Green
  } else {
    Write-Host "`n Git installation could not be found!" -NoNewline
    Write-Host " Exiting!" -ForegroundColor red
  }
} #end function Install-Git-Extras

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

Setup
InstallGitExtras

# ------------------------------------------------------------------------------------------- #

# EOF #
