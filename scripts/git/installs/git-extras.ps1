<#
# ----------------------------------- #
# scripts/git/installs/git-extras.ps1 #
# ----------------------------------- #

.SYNOPSIS
  PowerShell script used to install git-extras utilities.

.DESCRIPTION
  Ensures git is installed then finds the git executable
  location (first path in where git.exe wins) on disk.
  Finally clones the git-extras repository and runs the
  provided install.cmd script.

  Please note that this script requires the PSWriteColor module
  which will be installed if not already.

    https://www.powershellgallery.com/packages/PSWriteColor

.EXAMPLE
  .\git-extras.ps1

.NOTES
  File Name: git-extras.ps1
  Author: PatEvs
  Last Edit: 24/03/2020

.LINK
  https://github.com/tj/git-extras
#>

# Install-Module -Name PSWriteColor

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

Function InstallGitExtras {
  # Firstly we verify git is installed
  if (ExistsCommand git){
    Write-Host "`n Installing git-extras utilities..."  -ForegroundColor Green
    # Get git executable location
    # TODO: Find git executable at runtime
    # Default location: %ProgramFiles%\Git
    # $gitLocation = "$envLUSERPROFILE\scoop\apps\git\current"
    # $gitLocation = "$env:USERPROFILE\scoop\apps\git\2.26.0.windows.1"
    $gitPath = "$env:ProgramFiles\Git"
    # Test if path exists
    if (-Not (Test-Path $gitPath)) {
      # Attempt to find the path using scoop
      $gitPath = Invoke-Expression "scoop prefix git"
      Write-Host "Git Path: $gitPath"
      Exit
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
  Write-Host "`n Git Extras Utility Install Script " -BackgroundColor Green -ForegroundColor Black
  # Firstly we verify if the PSWriteColor module is installed
  if (-Not (ExistsModule PSWriteColor)) {
    Write-Host " PSWriteColor module is not installed. Installing now..."
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
