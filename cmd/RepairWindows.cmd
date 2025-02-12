:: RepairWindows.cmd
:: -----------------

:: Run from elevated command prompt.
::
:: Source: https://answers.microsoft.com/en-us/windows/forum/all/i-am-getting-windows-update-error-0x800705b4-and/a1132fb3-1108-4919-bcc1-9113a6ec7252

:: Scan all system files and compare them with official system files, checking for any inconsistencies.
DISM /Online /Cleanup-Image /ScanHealth

:: This command should be used if the previous command detects damaged system files.
DISM /Online /Cleanup-Image /CheckHealth

:: This command will restore those different system files to the official system source files.
DISM /Online /Cleanup-image /RestoreHealth

:: NOTE: A system reboot is recommended after the above commands have completed.

:: Repair corrupt Windows system files.
SFC /ScanNow
