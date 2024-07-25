@echo off
set ServerName=IztekServer
::Set Watchdog title
title %wat% %ServerName%WatchDog
echo (%time%) %ServerName% starting.

:watchdog
start "" /wait /high "DayZServer_x64.exe" "-mod=@CF;@Dabs Framework;@DayZ-Expansion-Core;@DayZ-Expansion-Licensed;@DayZ-Expansion-Animations;@DayZ-Expansion-Missions;@DayZ-Expansion-AI;@DayZ-Expansion-BaseBuilding;@DayZ-Expansion-Weapons;@Community-Online-Tools;@VPPAdminTools;@Winter Chernarus V2;@Winter Livonia;@Iztek_Zarge;@Iztek;@Winter Iztek;@IEF;@SkyZ - Skybox Overhaul;@Thermal System;@InediaMovement;@Increased Lumens;@In-Vehicle-Inventory;@Inventory_Zipper;@Killfeed;@MMG - Mightys Military Gear;@SNAFU Weapons;@Storage Containers;@Survivor name changer;@Tactical Flava;@VanillaPlusPlusMap;@VPP Map GPS Requirement;@Winter Map VPP;@Zen's Static Barbed Wire;@CJ187-ToxicZoneAlarm;@BleedTrail;" "-servermod=" "-profiles=profiles/IztekProfile" -config=serverDZ-Iztek.cfg -port=3303 -cpuCount=6 -dologs -adminlog -netlog -freezecheck

echo (%time%) %ServerName% closed or crashed, restarting.
goto watchdog