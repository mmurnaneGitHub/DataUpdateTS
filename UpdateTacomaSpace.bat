:: *****************************************************************************
:: UpdateTacomaSpace.bat  1/28/2019 
:: Summary: Update TacomaSpace.com data
::
:: Description: The process to update CSV file used by TacomaSpace.com 
:: Updates previous process: 
::	\\geobase-win\ced\GADS\R2015\R185\UpdateProcess\UpdateTacomaSpace.bat 
::
:: *****************************************************************************

:: Log directory for process verification file
    SET LogDir= \\geobase-win\ced\GADS\R2017\R192\TacomaSpaceUpdate\log\TacomaSpace

:: Date stamp for today's date (YYYYMMDD)
    for /f "tokens=2,3,4 delims=/ " %%a in ('date/t') do set theDate=%%c%%a%%b

:: Record starting time
    time /T > %LogDir%%theDate%.log

Echo Downloading latest CBA data... >> %LogDir%%theDate%.log

::Send standard output (1) & errors (2) to log file
 C:\Python27\ArcGISx6410.4\python.exe \\geobase-win\ced\GADS\R2017\R192\TacomaSpaceUpdate\CBA_Download.py 1>>%LogDir%%theDate%.log 2>&1

:: Record ending time
 time /T >> %LogDir%%theDate%.log

Echo  See TacomaSpace.com for latest data - https://wspdsmap.cityoftacoma.org/website/tacomaspace >> %LogDir%%theDate%.log

::Send Email with log file content
  cscript \\geobase-win\ced\GADS\R2017\R192\TacomaSpaceUpdate\Send_Email.vbs %LogDir%%theDate%.log

::For manual testing -
  ::pause