# --------------- #
# enable-wsl2.ps1 #
# --------------- #

# ! NOTE: Must be run from an elevated prompt

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

# EOF #
