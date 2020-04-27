<# scripts/ps1/check-git.ps1

.SYNOPSIS
  Check if the current directory is a git reposityory.

.DESCRIPTION
  Check if the current directory is a git reposityory.

.EXAMPLE
  .\check-git.ps1

.NOTES
  File Name: check-git.ps1
  Author: PatEvs (https://github.com/patevs)
  Last Edit: 24/04/2020 - April 1st 2020

.LINK
  Repository:
    * https://github.com/patevs/utility-scripts
  Script:
    * https://github.com/patevs/utility-scripts/blob/master/scripts/ps1/check-git.ps1
#>

# https://gist.github.com/brettinternet/0d2225ffb6b224c515643f630a65b463

function is-git-repo {
  if ((Test-Path .git) -or (git rev-parse --git-dir 2>&1 /dev/null)) {
    return $TRUE
  } else {
    return $FALSE
  }
}

# -------------------------------------------------------------------------------- #
