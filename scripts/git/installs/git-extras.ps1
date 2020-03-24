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

.EXAMPLE
  .\git-extras.ps1

.NOTES
  File Name: git-extras.ps1
  Author: PatEvs
  Last Edit: 24/03/2020

.LINK
  https://github.com/tj/git-extras
#>

# ---------------- #
# HELPER FUNCTIONS #
# ---------------- #

# Check if a given installation or command exists
# https://stackoverflow.com/questions/3919798/how-to-check-if-a-cmdlet-exists-in-powershell-at-runtime-via-script
function exists($cmdname) {
  # return [bool](Get-Command -Name $cmdname -ea 0)
  return [bool](Get-Command -Name $cmdname -ErrorAction SilentlyContinue)
}

# ------------------------------------------------------------------------------------------- #

Function InstallGitExtras {
  # Firstly we verify git is installed
  if (exists git){
    Write-Host "`n Installing git-extras utilities... `n"  -ForegroundColor Green
    # Get git executable location
    # TODO: Find git executeable at runtime
    # $gitLocation = "~\scoop\apps\git\current\bin\git.exe"
    $gitLocation = "~\scoop\apps\git\2.26.0.windows.1\bin\git.exe"
    # Clone the repository
    Invoke-Expression "git clone https://github.com/tj/git-extras.git"
    # Move into the git-extras directory
    # Set-Location git-extras
    # Run the install script
    # Invoke-Expression
    Write-Host "git-extras\install.cmd $gitLocation"
    # Finally remove the git-extras repository
    Remove-Item -Recurse "git-extras"
    Write-Host "`n DONE! `n"  -ForegroundColor Green
  } else {
    Write-Host "`n Git installation could not be found!" -NoNewline
    Write-Host " Exiting!" -ForegroundColor red
  }
} #end function Install-Git-Extras

InstallGitExtras

# ------------------------------------------------------------------------------------------- #

# EOF #
