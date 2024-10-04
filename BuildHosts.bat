::BuildHosts
:: Created by Furtivex
@echo OFF && color 17
SET "hostsD=C:\Windows\System32\drivers\etc" && SET "githubD=C:\Users\d1savow3d\Documents\GitHub\hosts_adultxxx"
title BuildHosts by Furtivex - Version 1.0.0
ECHO(BuildHosts by Furtivex - Version 1.0.0
ECHO.
ECHO.
REM ~~~~~~~~~~~~~~~~~~~~~~~~>
cd /d %~dp0
COPY /y "%CD%\dependencies\sed.exe" %windir%\sed.exe >NUL 2>&1
COPY /y "%CD%\dependencies\grep.exe" %windir%\grep.exe >NUL 2>&1
COPY /y "%CD%\dependencies\sort_.exe" %windir%\sort_.exe >NUL 2>&1
COPY /y "%CD%\dependencies\libiconv2.dll" %windir%\libiconv2.dll >NUL 2>&1
COPY /y "%CD%\dependencies\libintl3.dll" %windir%\libintl3.dll >NUL 2>&1
COPY /y "%CD%\dependencies\nircmd.exe" %windir%\nircmd.exe >NUL 2>&1
COPY /y "%CD%\dependencies\pcre3.dll" %windir%\pcre3.dll >NUL 2>&1
COPY /y "%CD%\dependencies\regex2.dll" %windir%\regex2.dll >NUL 2>&1
sc stop Dnscache>NUL
sc config Dnscache start= disabled>NUL
NIRCMD wait 2000

GREP -Ev "^#" <"%githubD%\hosts" >"%TEMP%\repairhosts1"
SED -r "s/\:443$//" <"%TEMP%\repairhosts1" >"%TEMP%\repairhosts2"
SED -r "/^0\.0\.0\.0/!s/(.*)/0\.0\.0\.0 \1/" <"%TEMP%\repairhosts2" >"%TEMP%\repairhosts3"
SORT_ -f -u <"%TEMP%\repairhosts3" >"%TEMP%\repairhosts4"
ECHO(# Title: thisisu/hosts_adultxxx>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
ECHO(# Hosts file for browsing porn>>"%TEMP%\repairhosts1"
ECHO(# Filters out ads, banners, redirects and more>>"%TEMP%\repairhosts1"
ECHO(# Raw: https://raw.githubusercontent.com/thisisu/hosts_adultxxx/master/hosts>>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
ECHO(# 127.0.0.1 localhost>>"%TEMP%\repairhosts1"
ECHO(# ::1 localhost>>"%TEMP%\repairhosts1"
ECHO(# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~>>"%TEMP%\repairhosts1"
TYPE "%TEMP%\repairhosts4">>"%TEMP%\repairhosts1"
COPY /Y "%TEMP%\repairhosts1" "%githubD%\hosts" >NUL 2>&1
COPY /Y "%TEMP%\repairhosts1" "%hostsD%\hosts" >NUL 2>&1
DEL /F/Q "%TEMP%\repairhosts?" >NUL 2>&1
sc config Dnscache start= auto>NUL
SC start Dnscache>NUL
NIRCMD WAIT 2000
ipconfig /flushdns >NUL 2>&1
taskkill /f /im git.exe >NUL 2>&1