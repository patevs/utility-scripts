:: check-disk-health.cmd
:: ---------------------

:: Run from elevated command prompt.
::
:: Source: https://www.howtogeek.com/1033/how-to-use-chkdsk-on-windows/

:: Scan drive for errors
chkdsk

:: Repair file system errors
chkdsk /f C:

:: Scan for bad sectors
chkdsk /r /r C:
