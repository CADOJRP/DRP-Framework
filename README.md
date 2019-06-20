# DRP-Framework

FiveM Public Framework by: OfficalDarkzy

Backend Built Using Xander1998's DatabaseAPI Resource

# Discord Server If You Need Help and Support

Please join my Discord server for live updates when I make changes and join the FiveM Dev Labs :D

https://discord.gg/hc78sSK

# Installation Guide

## Main DRP-Core Installation

Have a standard working FXServer!!

Download the framework folder from the GitHub, which you are most likely reading this on! - Then you will see numbered folders, please follow it accordingly.

1. In your resource folder you have from making an FXServer please put the [DRPCORE] in the main resource folder.

2. Next remove FiveM from your server.cfg resource list, it will look like this "start FiveM", just remove it completely

3. Next in your main resource folder you will see FiveM-Map-Skater, open that folder then open the \_\_resource.lua file. You will see something like this: `resource_type 'map' { gameTypes = { fivem = true } }` please replace that with `resource_type 'map' { gameTypes = { drp_core = true } }`.

## Database Installation

1. Open Database Installation in the DRP-Framework files and move the [DRPDATABASE] folder into your resource main folder where [DRPCORE] should be located

2. Then open the config file in DatabaseAPI folder (JavaScript) and ExternalSQL folder (LUA)

3. Edit The Config Accordiningly here is what it will look like http://prntscr.com/ns3p54 and http://prntscr.com/ns3pdf

4. Import the Database Dump into your Database Tool of choice (I use HeidiSQL) to load all the tables required

5. Load The Server Up With XAMPP OR MAMP open for your local SQL server etc.

## Server.cfg Installation

`

# DRP-Database Resources

start DatabaseAPI
start externalsql

# DRP-Core Resources

start drp_core
start drp_death
start drp_jobcore

# DRP-Core Addon Resources If Installed

start drp_id
start drp_bank
start drp_inventory

# DRP-Community Addons Resources If Installed

start drp_clothing
start drp_police
start drp_doors
start drp_drugs
start drp_medical
start drp_tattoos
start NativeUI
`

This is a perfect example below, made by myself :D (Please bare in mind you will not see all these resources, that is because some of these are my own personal custom ones, which are not open to the public yet)
http://prntscr.com/ns3kwl

# The Aim

To create a free framework, that is easy to use and fully functional for anyone to use, using a custom DatabaseAPI/ExternalSQL Resource created by Xander1998

## Credits

ToxicBacon For allowing me to use the Front end code for the inventory

Xander1998 For the DatabaseAPI and ExternalSQL resource

Frazzle For NativeUILUA / Client Base Of Model Menu

SEND YOUR CUSTOM RESOURCES TO ME AND ILL ADD IT TO THE COMMUNITY RELEASES
