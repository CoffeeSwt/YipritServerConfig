@echo off
set ServerName=IztekServer
::Set Watchdog title
title %wat% %ServerName%WatchDog
echo (%time%) %ServerName% starting.

:watchdog
start "" /wait /high "DayZServer_x64.exe" "-mod=@BleedTrail;@BoomLay's Things;@CF;@CJ187-ToxicZoneAlarm;@Community-Online-Tools;@Dabs Framework;@DayZ-Expansion-AI;@DayZ-Expansion-BaseBuilding;@DayZ-Expansion-Core;@DayZ-Expansion-Licensed;@DayZ-Expansion-Missions;@DayZ-TukTuk;@Dogtags;@DZR Rags by hands;@Ear-Plugs;@Flashlight on weapon raise;@Give&Take;@IEF;@Increased Lumens;@InediaMovement;@Inventory Move Sounds;@InventoryInCar;@Inventory_Zipper;@Iztek;@Iztek_Zarge;@Killfeed;@MMG - Mightys Military Gear;@SkyZ - Skybox Overhaul;@Storage Containers;@Survivor name changer;@Tactical Flava;@Thermal System;@VanillaPlusPlusMap;@VPP Map GPS Requirement;@VPPAdminTools;@Winter Chernarus V2;@Winter Iztek;@Winter Livonia;@Winter Map VPP;@WindstridesClothingPack;" "-servermod=" "-profiles=profiles/IztekProfile" -config=serverDZ-Iztek.cfg -port=3303 -cpuCount=6 -dologs -adminlog -netlog -freezecheck

echo (%time%) %ServerName% closed or crashed, restarting.
goto watchdog