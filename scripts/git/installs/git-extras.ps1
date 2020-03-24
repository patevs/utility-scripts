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

Function WhoIs {
  param (
                  [Parameter(Mandatory=$True,
                             HelpMessage='Please enter domain name (e.g. microsoft.com)')]
                             [string]$domain
          )
  Write-Host "Connecting to Web Services URL..." -ForegroundColor Green
  try {
  #Retrieve the data from web service WSDL
  If ($whois = New-WebServiceProxy -uri "http://www.webservicex.net/whois.asmx?WSDL") {Write-Host "Ok" -ForegroundColor Green}
  else {Write-Host "Error" -ForegroundColor Red}
  Write-Host "Gathering $domain data..." -ForegroundColor Green
  #Return the data
  (($whois.getwhois("=$domain")).Split("<<<")[0])
  } catch {
  Write-Host "Please enter valid domain name (e.g. microsoft.com)." -ForegroundColor Red}
} #end function WhoIs

# ------------------------------------------------------------------------------------------- #

Function Install-Git-Extras {
  # Firstly we verify git is installed
  exists(git)
} #end function Install-Git-Extras

# ------------------------------------------------------------------------------------------- #

# EOF #
