# ----------- #
# ps1/top.ps1 #
# ----------- #

# https://superuser.com/a/176625

While(1) {
  Get-Process | Sort-Object -des cpu | Select-Object -f 15 | Format-Table -a;
  Start-Sleep 1
  Clear-Host
}

# One-liner
# While(1) { ps | sort -des cpu | select -f 15 | ft -a; sleep 1; cls }

# EOF #
