@echo off
set ServerName=IztekServer
::Set Watchdog title
title %wat% %ServerName%WatchDog
echo (%time%) %ServerName% starting.

:watchdog
start "" /wait /high "DayZServer_x64.exe" "-mod=@CF;@VPPAdminTools;@Winter Chernarus V2;@Winter Livonia;@Iztek_Zarge;@Iztek;@Winter Iztek;@IEF;@SkyZ - Skybox Overhaul;@Thermal System;@Better Inspect;@InediaMovement;" "-servermod=" "-profiles=profiles/IztekProfile" -config=serverDZ-Iztek.cfg -port=3303 -cpuCount=6 -dologs -adminlog -netlog -freezecheck

echo (%time%) %ServerName% closed or crashed, restarting.
goto watchdog