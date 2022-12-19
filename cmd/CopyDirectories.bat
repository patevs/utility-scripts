:: CopyDirectories.bat
:: -------------------

:: Change the `BaseSrcDir` and `DestDir` variables as needed.

@echo off
setlocal
set "BaseSrcDir=c:\data"
set "DestDir=m:\backup"
for /d %%A in ("%BaseSrcDir%\*") do (
  if exist "%%A\data.db" (
    echo "%%A\data.db" =^> "%DestDir%\data_%%~nA.db"
    copy /y "%%A\data.db" "%DestDir%\data_%%~nA.db"
  )
)

:: EOF
