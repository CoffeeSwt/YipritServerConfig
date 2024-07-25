@echo off
set ServerName=IztekServer
::Set Watchdog title
title %wat% %ServerName%WatchDog
echo (%time%) %ServerName% starting.

:watchdog
start "" /wait /high "DayZServer_x64.exe" "-mod=@BleedTrail;@CF;@CJ187-ToxicZoneAlarm;@Community-Online-Tools;@Dabs Framework;@DayZ-Expansion-AI;@DayZ-Expansion-Animations;@DayZ-Expansion-BaseBuilding;@DayZ-Expansion-Core;@DayZ-Expansion-Licensed;@DayZ-Expansion-Missions;@DayZ-Expansion-Weapons;@DayZ-TukTuk;@Dogtags;@DZR Rags by hands;@Flashlight on weapon raise;@FuelControl;@Give&Take;@Huge Advance Weapon Pack;@IEF;@In-Vehicle-Inventory;@Increased Lumens;@InediaMovement;@Inventory_Zipper;@Iztek;@Iztek_Zarge;@Killfeed;@MMG - Mightys Military Gear;@SkyZ - Skybox Overhaul;@SNAFU Weapons;@Storage Containers;@Survivor name changer;@Tactical Flava;@Thermal System;@VanillaPlusPlusMap;@VPP Map GPS Requirement;@VPPAdminTools;@Winter Chernarus V2;@Winter Iztek;@Winter Livonia;@Winter Map VPP;@Winter Yiprit;@Yiprit;@Zen's Static Barbed Wire;" "-servermod=" "-profiles=profiles/IztekProfile" -config=serverDZ-Iztek.cfg -port=3303 -cpuCount=6 -dologs -adminlog -netlog -freezecheck

echo (%time%) %ServerName% closed or crashed, restarting.
goto watchdog