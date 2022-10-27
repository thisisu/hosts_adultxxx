:: Build Hosts Solo
:: Created by thisisu
@echo off && SET "hostsD=C:\Windows\System32\drivers\etc" && SET "githubD=C:\Users\d1savow3d\Documents\GitHub\hosts_adultxxx"
Echo(Build_Hosts_Solo.bat loaded!
ECHO.
ECHO.
color 17
sc config Dnscache start= disabled
sc stop Dnscache
NIRCMD wait 2000

GREP -vP "^#" <"%githubD%\hosts" >"%TEMP%\repairhosts1"
SED -R "s/\:443$//" <"%TEMP%\repairhosts1" >"%TEMP%\repairhosts2"
SED -R "/^0\.0\.0\.0/!s/(.*)/0\.0\.0\.0 \1/" <"%TEMP%\repairhosts2" >"%TEMP%\repairhosts3"
SORT_ -f -u <"%TEMP%\repairhosts3" >"%TEMP%\repairhosts4"
ECHO(# Title: thisisu/hosts_adultxxx>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
ECHO(# Hosts file for browsing porn>>"%TEMP%\repairhosts1"
ECHO(# Raw: https://raw.githubusercontent.com/thisisu/hosts_adultxxx/master/hosts>>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
ECHO(# 127.0.0.1 localhost>>"%TEMP%\repairhosts1"
ECHO(# ::1 localhost>>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
TYPE "%TEMP%\repairhosts4">>"%TEMP%\repairhosts1"
COPY /Y "%TEMP%\repairhosts1" "%githubD%\hosts"
COPY /Y "%TEMP%\repairhosts1" "%hostsD%\hosts"
DEL /F/Q "%TEMP%\repairhosts?" >NUL 2>&1
sc config Dnscache start= auto
SC start Dnscache
NIRCMD WAIT 2000
ipconfig /flushdns
taskkill /f /im git.exe