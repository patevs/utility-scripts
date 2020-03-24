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
  ./git-extras

.NOTES
  File Name: git-extras.ps1
  Author: PatEvs
  Last Edit: 24/03/2020

.LINK
  https://github.com/tj/git-extras
#>

#

# EOF #
