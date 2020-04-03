<# scripts/ps1/covid.ps1

.SYNOPSIS
  PowerShell script for tracking the COVID19 pandemic.

  ! Requires bash and curl to be installed.

.DESCRIPTION
  Command line tracker for the Novel Coronavirus or COVID19 pandemic.

.EXAMPLE
  .\covid.ps1

.NOTES
  File Name: covid.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 03/04/2020 - April 3rd 2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/ps1/covid.ps1
#>

# ------------------------------------------------------------------------------------------- #

Invoke-Expression "bash curl -L covid19.trackercli.com/nz"

# EOF #
