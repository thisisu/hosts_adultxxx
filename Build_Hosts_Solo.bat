:: Build Hosts Solo
:: Created by thisisu
@echo off && SET "hostsD=C:\Windows\System32\drivers\etc"
Echo(Build_Hosts_Solo.bat loaded!
ECHO.
ECHO.
color 17
sc config Dnscache start= disabled
sc stop Dnscache
NIRCMD wait 2000
COPY /Y "%hostsD%\hosts" "%hostsD%\hosts.backup"
MOVE /Y "%hostsD%\hosts" "%userprofile%\desktop\hosts"
COPY /Y "E:\Github\hosts_adultxxx\hosts" "%userprofile%\desktop\hosts"
COPY /Y "%userprofile%\desktop\hosts" "%hostsD%\hosts"
sc config Dnscache start= auto
SC start Dnscache
NIRCMD WAIT 2000
ipconfig /flushdns
taskkill /f /im git.exe