@echo off
set ServerName=YipritServer
::Set Watchdog title
title %wat% %ServerName%WatchDog
echo (%time%) %ServerName% starting.

:watchdog
start "" /wait /high "DayZServer_x64.exe" "-mod=@CF;@VPPAdminTools;@IEF;@Yiprit;@SkyZ - Skybox Overhaul;@Thermal System;@Better Inspect;@InediaMovement;" "-servermod=" "-profiles=profiles/YipritProfile" -config=serverDZ-Yiprit.cfg -port=3303 -cpuCount=6 -dologs -adminlog -netlog -freezecheck

echo (%time%) %ServerName% closed or crashed, restarting.
goto watchdog