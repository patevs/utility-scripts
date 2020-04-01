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
  Last Edit: 01/04/2020 - April 1st 2020

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
# Write-Color " `n Verifying ", "Python", " and ", "Pip", " Installations... `n" -C White, Cyan, White, Cyan, White
Write-Color " `n Verifying ", "Requirements... `n" -C Green, White

# Python
if (ExistsCommand python) {
  $pythonVersion = Invoke-Expression "python --version"
  $pythonVersion = $pythonVersion -replace "Python "
  Write-Color "+------------+------------+" -StartSpace 4
  Write-Color "|", " Install    ", "|", " Version    ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
  Write-Color "|", " Python     ", "|", " $pythonVersion      ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
} else {
  Write-Color "Python", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# Pip
if (ExistsCommand pip) {
  $pipVersion = Invoke-Expression "pip --version"
  $pipVersion = $pipVersion -replace "pip "
  $pipVersion = $pipVersion.Split(" ")[0]
  Write-Color "|", " Pip        ", "|", " $pipVersion     ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
} else {
  Write-Color "Pip", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# ffmpeg
if (ExistsCommand ffmpeg) {
  $ffmpegVersion = Invoke-Expression "ffmpeg -version"
  $ffmpegVersion = $ffmpegVersion -replace "ffmpeg version "
  $ffmpegVersion = $ffmpegVersion.Split(" ")[0]
  Write-Color "|", " ffmpeg     ", "|", " $ffmpegVersion      ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
} else {
  Write-Color "ffmpeg", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# mpv
if (ExistsCommand mpv) {
  $mpvVersion = Invoke-Expression "mpv --version"
  $mpvVersion = $mpvVersion -replace "mpv "
  $mpvVersion = $mpvVersion.Split(" ")[0]
  Write-Color "|", " mpv        ", "|", " $mpvVersion     ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
} else {
  Write-Color "mpv", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# youtube-dl
if (ExistsCommand youtube-dl) {
  $ytdlVersion = Invoke-Expression "youtube-dl --version"
  Write-Color "|", " Youtube-dl ", "|", " $ytdlVersion ", "|" -C White, Cyan, White, Green, White -StartSpace 4
  Write-Color "+------------+------------+" -StartSpace 4
} else {
  Write-Color "youtube-dl", " installation could not be found. " -C Cyan, White -StartSpace 2 -NoNewLine
  Write-Color " Exiting " -B Red
  exit
}

# Begin Setup
Write-Color " `n All Requirements Satisfied! ", "Beginning Environment Setup..." -C White, Green

$venvName = "venv"

# Create a virtual environment
Write-Color ""
Write-Color "Creating", " Virtual Environment... `n" -C Green, White -StartSpaces 2  # -NoNewLine
Invoke-Expression "python -m venv $venvName"
# Write-Color "Done" -C Green

# Activate the virtual environment
Write-Color "`n  Activating", " Virtual Environment... " -C Green, White # -NoNewLine
Invoke-Expression "$venvName/Scripts/activate"
# Write-Color "Done" -C Green

# Upgrade pip and setuptools
Write-Color "`n  Upgradeing ", "pip", " and ", "setuptools", "... `n" -C White, Cyan, White, Cyan, White -StartSpace 2
Invoke-Expression "pip install --upgrade pip"
Invoke-Expression "pip install --upgrade setuptools"

# Begin Install
Write-Color " `n Environment Setup Complete! ", "Beginning Install... `n" -C White, Green

# Install spotify-downloader
Invoke-Expression "pip install spotdl"

# Install YouTube Music Downloader
# Invoke-Expression "pip install ytmdl"

# Install mps-youtube
# Invoke-Expression "pip install mps-youtube"

# Install Beets
# Invoke-Expression "pip install beets"

Write-Color ""
Write-Color " DONE `n" -B Green -C Black -StartSpaces 2

# ------------------------------------------------------------------------------------------- #

# EOF #
