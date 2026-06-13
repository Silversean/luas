  include('organizer-lib')
--[[
                                                                       
88888888ba               88                       88  88               
88      "8b              88                       88  ""               
88      ,8P              88                       88                   
88aaaaaa8P'  ,adPPYYba,  88  ,adPPYYba,   ,adPPYb,88  88  8b,dPPYba,   
88""""""'    ""     `Y8  88  ""     `Y8  a8"    `Y88  88  88P'   `"8a  
88           ,adPPPPP88  88  ,adPPPPP88  8b       88  88  88       88  
88           88,    ,88  88  88,    ,88  "8a,   ,d88  88  88       88  
88           `"8bbdP"Y8  88  `"8bbdP"Y8   `"8bbdP"Y8  88  88       88  ]]
                                                                       
                                                                       

windower.add_to_chat(123,[[PLD Lua Author: Kiddeath #7894 (Discord); Archiie -- Graphic tables and debugging.]])
windower.add_to_chat(160,[[Feel free to DM me if you have any questions or suggestions for this file.]])

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

	-- Load and initialize the include file.
	include('Mote-Include.lua')
end

-- Setup vars that are user-independent.
function job_setup()
    state.Moving = M('false', 'true')
	include('Mote-TreasureHunter')
	setupTextWindow(1700, 1150)
	

	
end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--================================================--

function user_setup()
	state.DamageMode = M('Unlocked','Burtgang','Excalibur', 'Savage', 'Sequence', 'Aeolian','Lv.1 Dagger')
    state.OffenseMode:options('Normal','Tanking','MDEF','Block','Layered','EnmityRetention','Hybrid','DmgMP','Polearm','Absorb')
    state.IdleMode:options('Normal','Tanking','MDEF','Block','Layered', 'EnmityRetention', 'Aminon', 'DmgMP', 'MbozeV25', 'Refresh', 'Absorb')
	state.CastingMode:options('Normal','SIRD','CureCheat')
	state.MajestyMode = M('Off', 'On')
	state.HippoMode = M('Off', 'On')
	state.DynaMode = M('None','RP_Farm')
	state.ShieldMode = M('Aegis','Srivatsa', 'Duban', 'MP')
	state.DoomMode = M('OFF', 'Doom')
	state.HPMode = M('None', 'HighHP')
	state.WeaponLockMode = M('Unlocked','Locked')
	state.WeaponskillMode:options('Normal', 'HighHP')
	state.ReraiseMode = M('None','Reraise')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.EngagedMoving = M('Disabled','Enabled')
	
	send_command('input //gs equip sets.defaultSwordAndShield;wait 0.2;gs c set WeaponLockMode Locked')
	
	send_command('bind f1 gs c cycle EngagedMoving') --Engaged Movespeed
	send_command('bind f6 gs c cycle DamageMode; gs enable sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f1 gs c cycle RP')
	send_command('bind f7 gs c cycle ShieldMode') --Shieldmode swaps current shield to Aegis or Duban
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle IdleMode') --Idle Mode
	send_command('bind f11 gs c set IdleMode Tanking;gs c set OffenseMode Tanking') --Dose what it says is not a toggle or cycle
	send_command('bind insert gs c cycle MajestyMode')
	send_command('bind ^insert gs c cycle HippoMode')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind ^f9 gs c cycle CastingMode')
	--CRTR+ binds
	send_command('bind ^f4 gs c cycle DynaMode')
	send_command('bind ^f7 gs c cycle TreasureMode') -- toggles TH tag on/off
	send_command('bind ^f8 gs c cycle ReraiseMode')
	send_command('bind ^f10 gs c cycle HPMode') --swaps idle and engaged sets to high hp sets
	send_command('bind ^f11 gs c set IdleMode Normal;gs c set OffenseMode Normal')
	send_command('bind ^f12 gs c cycle ZoneRing')
	select_default_macro_book()
	
end





function user_unload()

        send_command('unbind ^f9')
		send_command('unbind ^f6')
		send_command('unbind f6')
        send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
		send_command('unbind f8')
		send_command('unbind !f8')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
		send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
		send_command('unbind f5')
		send_command('unbind f1')
		
		send_command('unbind -')
		send_command('unbind =')
		enable('neck')
		enable('main')
		enable('sub')
		enable('range')
end



function init_gear_sets()

	sets.Enmity = {
    main="Burtgang",
    sub="Duban",
    ammo="Sapience Orb",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+2','Enmity+8','STR+7','Attack+12',}},
    feet="Chev. Sabatons +3",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Trux Earring",
    right_ear="Pluto's Pearl",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}



	sets.EnmityMax = set_combine(sets.Enmity, {sub="Srivatsa",})

--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

    sets.idle = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Regal Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape",
}
		
	sets.idle.Absorb = {
    main="Excalibur",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Warder's Charm +1",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
}


	sets.idle.Normal = {
    main="Burtgang",
    sub="Duban",
    ammo="Brigantia Pebble",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck={ name="Kgt. Beads +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shadow Ring",
    right_ring="Warden's Ring",
    back="Shadow Mantle",
}

	sets.idle.Tanking = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck={ name="Kgt. Beads +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Tuisto Earring",
    left_ring="Shadow Ring",
    right_ring="Warden's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	
	sets.idle.Block = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Sakpata's Cuisses",
    feet="Rev. Leggings +4",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Foresti Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shadow Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}

	sets.idle.Aminon = {
    main="Burtgang",
    sub="Duban",
    ammo="Vanir Battery",
    head="Sworn Crown",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Coatl Gorget +1",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Apeile Ring +1",
    right_ring="Vexer Ring +1",
    back="Null Shawl",
}

	sets.RP = {neck={ name="Kgt. Beads +2", augments={'Path: A',}},}
	
	
	sets.idle.DmgMP = {
    main="Burtang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Rev. Leggings +4",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear="Foresti Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	
	
	sets.idle.MDEF = {
    main="Burtgang",
    sub="Duban",
    ammo="Vanir Battery",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Coatl Gorget +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Shadow Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}

	sets.idle.Layered = {
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Warder's Charm +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Gelatinous Ring +1",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
}

sets.idle.EnmityRetention = {
    main="Burtgang",
    sub="Duban",
    ammo="Eluder's Sachet",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Creed Collar",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Murky Ring",
    right_ring="Fortified Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}


	sets.idle.MbozeV25 = {
    main="Burtang",
    sub="Duban",
    ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Sworn Platemail",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back="Moonbeam Cape",
}

	sets.idle.Refresh = {
    main="Burtang",
    sub="Duban",
    ammo="Homiliary",
    head="Sworn Crown",
    body="Crepuscular Mail",
    hands="Regal Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Rev. Leggings +4",
    neck="Creed Collar",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}


	sets.idle.MaxHP = {
    main="Burtang",
    sub="Duban",
    ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=13},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
	feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={name="Tuisto Earring", priority=11},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Moonbeam Cape",
}

	
sets.Hippomenes = set_combine(idleSet, {feet = "Hippo. Socks +1"})

	--[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]
	
	sets.idle.MDT = {
    main="Burtang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
	neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
		--not relevant unless your idleset uses a body that does not have DT or MDT
		
	sets.latent_refresh = { ammo="Staunch Tathlum",
    head="Sworn Crown",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Ethereal Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring="Moonbeam Ring",
    back="Moonbeam Cape",}
		
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

    sets.engaged = {
    main="Burtang",
    sub="Duban",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Sworn Crown",
    body="Sakpata's Plate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}


	sets.engaged.Absorb = {
    main="Excalibur",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Warder's Charm +1",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
}

	sets.engaged.Normal = {
    main="Burtgang",
    sub="Duban",
    ammo="Brigantia Pebble",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck={ name="Kgt. Beads +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shadow Ring",
    right_ring="Warden's Ring",
    back="Shadow Mantle",
}
	
	sets.engaged.Block = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Sakpata's Cuisses",
    feet="Rev. Leggings +4",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Foresti Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Shadow Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	sets.engaged.Layered = {
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Warder's Charm +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Gelatinous Ring +1",
    right_ring="Shadow Ring",
    back="Shadow Mantle",
}

	sets.engaged.DmgMP =  {
    main="Burtang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Sakpata's Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Rev. Leggings +4",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}},
    waist="Flume Belt +1",
    left_ear="Tuisto Earring",
    right_ear="Foresti Earring",
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}


sets.engaged.EnmityRetention = {
    main="Burtgang",
    sub="Duban",
    ammo="Eluder's Sachet",
    head="Chev. Armet +3",
    body="Sworn Platemail",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Creed Collar",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Murky Ring",
    right_ring="Fortified Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}




    
    --[[In this lua MDT will be handled automatically dependent upon whether you 
	currently have Shell or not to help ensure you are at capped MDT.  This set
	will not be toggleable, and instead will automatically swap in when shell either
	wears off, or is dispelled from you.  Please ensure this set has as much MDT and
	magic evasion as possible without sacrificing too much HP.]]
	
	sets.engaged.MDT = {
    main="Burtang",
    sub="Aegis",
    ammo="Vanir Battery",
    head="Sworn Crown",
    body={name="Sworn Platemail", priority=6},
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Coatl Gorget +1",
    waist="Creed Baudrier",
    left_ear="Eabani Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Shadow Ring",
    right_ring="Vexer Ring +1",
    back="Null Shawl",
}
	
	--[[Generally speaking this set will be your go-to tanking as it is a hybrid set. 
	By default only THIS set will swap in MDT when shell is dropped, but if you copy
	it's functions around you can make it apply to whichever sets you may need.  If 
	you do not know how, simply contact Byrne (Asura) and I will help you if I
	have time]]
	
	sets.engaged.Tanking = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Adamantite Armor",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck={ name="Kgt. Beads +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Tuisto Earring",
    left_ring="Shadow Ring",
    right_ring="Warden's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
		
	sets.engaged.MDEF = {
    main="Burtgang",
    sub="Duban",
    ammo="Vanir Battery",
    head="Sworn Crown",
    body="Sworn Platemail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Coatl Gorget +1",
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Shadow Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
		
	sets.engaged.Hybrid ={
    main="Excalibur",
    sub="Duban",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Crepuscular Mail",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Unmoving Collar +1",
    waist="Sailfi Belt +1",
    left_ear="Crep. Earring",
    right_ear="Alabaster Earring",
    left_ring="Moonlight Ring",
    right_ring="Murky Ring",
    back="Null Shawl",
}
	
	
	
	--[[{
    main="Excalibur",
    sub="Aegis",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Unmoving Collar +1",
    waist="Reiki Yotai",
    left_ear="Tuisto Earring",
    right_ear="Alabaster Earring",
    left_ring="Haverton Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}]]
	
	
	--[[{
    main="Burtgang",
    sub="Duban",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Hjarrandi Breast.",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Vim Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Odnowa Earring +1",
    right_ear="Alabaster Earring",
    left_ring="Moonlight Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}]]
		
	sets.engaged.Polearm = {    main="Shining One",
		ammo="Staunch Tathlum",
		head="Sakpata's Helm",
		body="Sakpata's Plate",
		hands="Sakpata's Gauntlets",
		legs="Sakpata's Cuisses",
		feet="Sakpata's Leggings",
		neck="Asperity Necklace",
		waist="Sailfi Belt +1",
		left_ear="Brutal Earring",
		right_ear="Telos Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}}
	
    sets.engaged.repulse = {back="Philidor Mantle"}

	sets.Adoulin = {body="Councilor's Garb",}
	
	sets.MoveSpeed = {legs="Carmine Cuisses +1",}
	
	sets.Dyna_RP_Farm = {neck={ name="Kgt. Beads +2", augments={'Path: A',}},}
	
	sets.Doom = {}
	
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--


	sets.precast.WS['Aeolian Edge'] = {
		main={ name="Malevolence", augments={'INT+10','Mag. Acc.+10','"Mag.Atk.Bns."+10','"Fast Cast"+5',}},
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear="Ishvara Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Cornelia's Ring",
		right_ring="Weather. Ring +1",
		back={ name="Rudianos's Mantle", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Savage Blade'] = {
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Circle Blade'] = {
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Atonement'] = {
    main="Burtgang",
    sub="Aegis",
    ammo="Sapience Orb",
    head="Loess Barbuta +1",
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+2','Enmity+8','STR+7','Attack+12',}},
    feet="Chev. Sabatons +3",
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Trux Earring",
    right_ear="Pluto's Pearl",
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}

	sets.precast.WS['Hexa Strike'] = {
    main="Beryllium Mace",
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}


	
	sets.precast.WS['Circle Blade'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	sets.precast.WS['Knights of Round'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}


    sets.precast.WS['Swift Blade'] = {
    main="Naegling",
    sub="Duban",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Petrov Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}

	
	sets.precast.WS['Savage Blade'].HighHP = {main="Naegling",
		sub="Kraken Club",
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Rep. Plat. Medal",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Regal Ring",
		right_ring="Cornelia's Ring",
		back={ name="Rudianos's Mantle", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}}}
	
    sets.precast.WS['Chant Du Cygne'] = {main="Burtgang",
		sub="Ochain",
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Rudianos's Mantle", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Sanguine Blade'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Crepuscular Pebble",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},
}
	
	
	sets.precast.WS['Seraph Blade'] = {    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Cornelia's Ring",
    right_ring="Weather. Ring +1",
    back={ name="Rudianos's Mantle", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%',}}}
	
	sets.precast.WS['Impulse Drive'] = {    main="Shining One",
		ammo="Oshasha's Treatise",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Asperity Necklace",
		waist={ name="Kentarch Belt +1", augments={'Path: A',}},
		left_ear="Brutal Earring",
		right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		left_ring="Hetairoi Ring",
		right_ring="Regal Ring",
		back={ name="Rudianos's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10',}}}
--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--

	-- Precast sets to enhance JAs
    
	sets.precast.JA['Invincible'] = {legs="Caballarius Breeches +2"}
    sets.precast.JA['Shield Bash'] = sets.Enmity
	sets.precast.JA['Holy Circle'] = set_combine(sets.Enmity, {feet="Reverence Leggings +3"})
    sets.precast.JA['Sentinel'] = set_combine(sets.Enmity, {feet="Caballarius Leggings +3"})
    sets.precast.JA['Rampart'] = set_combine(sets.Enmity, {head="Caballarius Coronet +2"})
    sets.precast.JA['Fealty'] = set_combine(sets.Enmity, {body="Caballarius Surcoat +2"})
    sets.precast.JA['Divine Emblem'] = set_combine(sets.Enmity, {feet="Chevalier's Sabatons +3"})
    sets.precast.JA['Cover'] = set_combine(sets.Enmity, {head="Reverence Coronet +2"})
	sets.precast.JA['Palisade'] = sets.Enmity
	sets.precast.JA['Cover'] = sets.Enmity
	sets.precast.JA['Provoke'] = sets.Enmity
	sets.precast.JA['Animated Flourish'] = sets.Enmity
	sets.precast.JA['Vallation'] = sets.Enmity
    sets.precast.JA['Valiance'] = sets.Enmity
		
	--[[ Fast cast sets for spells,  FC.Inspired is called when you have Fast Cast buff active from Inspiration, You can use this to get a
	Hybrid set that has more DT and HP while still capping Fast Cast depending on how many merits you have invested in it]]
	
	
	
	sets.Unlocked = {}
	
	sets.Burtgang = {
    main="Burtgang",
    sub="Duban",}
	
	sets.Excalibur = {    
		main="Excalibur",
		sub="Duban",}
		
	
	sets.Savage = {    
		main="Naegling",
		sub="Duban",}


	sets.Sequence= {    
		main="Sequence",
		sub="Duban",}

	sets.Aeolian = {    
		main="Tauret",
		sub="Daybreak",}
		
	sets.Lv1Dagger = {    
		main="Ceremonial Dagger",
		sub="Ceremonial Dagger",}
	
	
    sets.precast.FC = {
    main="Burtgang",
    sub="Duban",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +4",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Enif Cosciales",
    feet="Chev. Sabatons +3",
    neck="Voltsurge Torque",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Alabaster Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Kishar Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}},
}

	

	
	sets.precast.FC['Utsusemi: Ichi'] = set_combine(sets.precast.FC, {neck="Magoraga beads",})
	
	sets.precast.FC['Utsusemi: Ni'] = set_combine(sets.precast.FC['Utsusemi: Ichi'], {})

--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

	
	sets.midcast.Flash = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+2','Enmity+8','STR+7','Attack+12',}},
    feet="Chev. Sabatons +3",
    neck="Moonlight Necklace",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	
	sets.midcast.Reprisal =  {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet="Chev. Sabatons +3",
    neck="Moonlight Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Halasz Earring",
    right_ear="Magnetic Earring",
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}},
}

	sets.midcast.Banishga = {}

	sets.midcast.Crusade = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs="Chev. Cuisses +3",
    feet="Sakpata's Leggings",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring={name="Moonlight Ring",priority=10},
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}, priority=8},
    back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}},
}
	
	sets.midcast.Stoneskin = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
    body="Rev. Surcoat +3",
    hands="Stone Mufflers",
    legs="Haven Hose",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck="Stone Gorget",
    waist="Siegel Sash",
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonbeam Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}},
	}

    sets.midcast.FastRecast = {}
    
	sets.midcast.Enhance = {
    main="Burtgang",
    sub="Duban",
    ammo="Eluder's Sachet",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body="Shab. Cuirass +1",
    hands="Regal Gauntlets",
    legs="Chev. Cuisses +3",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Moonlight Necklace",
    waist="Plat. Mog. Belt",
    left_ear="Mimir Earring",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	
	

	
	sets.midcast['Phalanx'] = {
    main="Sakpata's Sword",
    sub="Priwen",
    ammo="Sapience Orb",
    head={ name="Odyssean Helm", augments={'"Blood Pact" ability delay -3','Accuracy+10','Phalanx +4',}},
    body={ name="Yorium Cuirass", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Incanter's Torque",
    waist="Plat. Mog. Belt",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Weard Mantle", augments={'VIT+2','DEX+3','Enmity+2','Phalanx +4',}},
}


	sets.midcast['Auspice'] = {
    main="Sakpata's Sword",
    sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
    ammo="Sapience Orb",
    head={ name="Yorium Barbuta", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Weard Mantle", augments={'VIT+2','DEX+3','Enmity+2','Phalanx +4',}},
}
	sets.midcast['Cursna'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Sapience Orb",
    head={ name="Yorium Barbuta", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck="Malison Medallion",
    waist="Gishdubar Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Haoma's Ring",
    right_ring="Haoma's Ring",
    back={ name="Weard Mantle", augments={'VIT+2','DEX+3','Enmity+2','Phalanx +4',}},
}
	
	sets.midcast.Refresh = {
    main="Sakpata's Sword",
    sub={ name="Priwen", augments={'HP+50','Mag. Evasion+50','Damage Taken -3%',}},
    ammo="Sapience Orb",
    head={ name="Yorium Barbuta", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    body={ name="Yorium Cuirass", augments={'DEF+24','Spell interruption rate down -10%','Phalanx +3',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs="Sakpata's Cuisses",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist="Gishdubar Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back={ name="Weard Mantle", augments={'VIT+2','DEX+3','Enmity+2','Phalanx +4',}},
}
	
	sets.midcast['Banshiga'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Rev. Surcoat +3",
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs={ name="Odyssean Cuisses", augments={'Mag. Acc.+2','Enmity+8','STR+7','Attack+12',}},
    feet="Chev. Sabatons +3",
    neck="Moonlight Necklace",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Apeile Ring",
    right_ring="Apeile Ring +1",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}


	
	sets.midcast['Banshiga II'] = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Duban",
    ammo="Pemphredo Tathlum",
    head="Chev. Armet +3",
    body="Rev. Surcoat +3",
    hands="Chev. Gauntlets +3",
    legs="Chev. Cuisses +3",
    feet="Chev. Sabatons +3",
    neck="Null Loop",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back="Null Shawl",
}


	 sets.midcast['Elemental Magic'] = {
    main="Excalibur",
    sub="Aegis",
    ammo="Ghastly Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Incanter's Torque",
    waist="Null Belt",
    left_ear="Moldavite Earring",
    right_ear="Crematio Earring",
    left_ring="Shiva Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	

	sets.midcast.CureCheat ={
    main="Burtgang",
    sub="Aegis",
    ammo="Sapience Orb",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Souv. Diechlings +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    neck="Unmoving Collar +1",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Moonlight Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}



	sets.Sirdcure = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist="Cornelia's Belt",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}

	
		

		
	sets.SirdPhalanx = {
		ammo="Staunch Tathlum +1",
		head="Souv. Schaller +1",
		body={ name="Yorium Cuirass", augments={'Spell interruption rate down -10%','Phalanx +3',}},		
		hands="Souv. Handsch. +1", 
		legs={ name="Founder's Hose", augments={'MND+10','Mag. Acc.+15','Attack+15','Breath dmg. taken -5%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
		neck="Moonbeam Necklace",
		waist="Audumbla Sash",
		left_ear="Knightly Earring",
		right_ear="Odnowa Earring +1", 
		left_ring="Defending Ring",
		ring2="Moonlight Ring", 
		back="Weard Mantle", }
---------------------------------------------------------------------------------------SIRD MIDCAST---------------------------------------------------------------------------------------------------------------------------



	
	--[[First SIRD set is intended for phalanx, and SIRD2 is for Reprisal.  Some pieces have Phalanx and SIRD such as augmented Yorium,
	     while Reprisal doesn't benefit from the +Phalanx and benefits more from straight SIRD]]
	
	sets.SIRD = {
    main="Burtgang",
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist="Plat. Mog. Belt",
    left_ear="Nourish. Earring +1",
    right_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
		
		
	sets.midcast.SIRD = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
	


	sets.SIRD2 = {		
		ammo="Staunch Tathlum",
		head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
		body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=13},
		hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
		legs={ name="Founder's Hose", augments={'MND+9','Mag. Acc.+13','Attack+14','Breath dmg. taken -4%',}},
		feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
		neck="Moonlight Necklace",
		waist="Audumbla Sash",
		left_ear="Etiolation Earring",
		right_ear="Ethereal Earring",
		left_ring="Defending Ring",
		right_ring="Moonbeam Ring",
		back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Spell interruption rate down-10%',}}}
	
	
	

	--sets.Enmity.SIRD = {}
	
	
	sets.midcast.Phalanx.SIRD = {}
	
	
	--sets.midcast.Cocoon.SIRD = {}
	
	
	--sets.midcast.Banshiga.SIRD = {}


	sets.midcast.Banishga.SIRD = set_combine(sets.midcast.SIRD, {})
	
	
	sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast.SIRD, {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Duban",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
    body="Rev. Surcoat +3",
    hands="Stone Mufflers",
    legs="Haven Hose",
    feet={ name="Souveran Schuhs +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=8},
    neck="Stone Gorget",
    waist="Siegel Sash",
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Moonbeam Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','HP+20','"Fast Cast"+10',}},
	})
	
 
		
	sets.midcast.Holy = {ammo="Staunch Tathlum",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck="Sibyl Scarf",
		waist="Hachirin-no-Obi",
		left_ear="Friomisi Earring",
		right_ear="Etiolation Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back="Solemnity Cape"}
		
		
	sets.midcast.Cure = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}

sets.midcast.WildCarrot = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
		
sets.midcast.HealingBreeze = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
		

	
	sets.self_healing = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    body={ name="Souv. Cuirass +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}},
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck="Sacro Gorget",
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear="Tuisto Earring",
    right_ear={ name="Nourish. Earring +1", augments={'Path: A',}},
    left_ring="Moonlight Ring",
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','"Cure" potency +10%','Spell interruption rate down-10%',}},
}
		
	sets.midcast.Cocoon = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head={ name="Souv. Schaller +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=14},
    body="Chev. Cuirass +3",
    hands="Chev. Gauntlets +3",
    legs={ name="Founder's Hose", augments={'MND+5','Mag. Acc.+13',}},
    feet={ name="Odyssean Greaves", augments={'Mag. Acc.+16','"Cure" potency +6%','STR+8',}},
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist={name="Plat. Mog. Belt", priority=15},
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Chev. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+12','Mag. Acc.+12','Damage taken-4%',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}
		
sets.midcast.Blastbomb = {
    main="Sakpata's Sword",
    sub="Aegis",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

sets.midcast.SoundBlast = {
    main="Sakpata's Sword",
    sub="Aegis",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

sets.midcast.CursedSphere = {
    main="Sakpata's Sword",
    sub="Aegis",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

sets.midcast.MagnetiteCloud = {
    main="Sakpata's Sword",
    sub="Aegis",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}

sets.midcast.BloodSaber = {
    main="Sakpata's Sword",
    sub="Aegis",
    ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Incanter's Torque",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}



	sets.midcast.OmenLowHP = {}
		
	end	


--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--======================================================================--



mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>25 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x and state.EngagedMoving.Value == 'Disabled' then
			--we want this to return a false value if these conditions were met, but we drew our weapons whilst moving.
			--we also want this value to become false if we Disable EngagedMovement while engaged.
			if state.Moving.value == 'true' and player.status == 'Engaged' then
				state.Moving.value = 'false'
			end
			if player.status ~= 'Engaged' then
				dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
				if dist > 1 and not moving then
					state.Moving.value = 'true'
					send_command('gs c update')
					if world.area:contains("Adoulin") then
						send_command('gs equip sets.Adoulin')
					else
						send_command('gs equip sets.MoveSpeed')
					end

					moving = true

				elseif dist < 1 and moving then
					state.Moving.value = 'false'
					if not midaction() then
						send_command('gs c update')
					end
					moving = false
				end
			end
        elseif pl and pl.x and mov.x and state.EngagedMoving.Value == 'Enabled' then
			dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
			if dist > 1 and not moving then
				state.Moving.value = 'true'
				send_command('gs c update')
				if world.area:contains("Adoulin") then
					send_command('gs equip sets.Adoulin')
				else
					send_command('gs equip sets.MoveSpeed')
				end

				moving = true

			elseif dist < 1 and moving then
				state.Moving.value = 'false'
				if not midaction() then
					send_command('gs c update')
				end
				moving = false
			end
		end
        if pl and pl.x then
            mov.x = pl.x
            mov.y = pl.y
            mov.z = pl.z
        end
        mov.counter = 0
    end
	
end)

--==================================================================--
--   _____                          _     _                         --
--  |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
--  | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
--  |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
--  |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--==================================================================--

function job_aftercast(spell, action, spellMap, eventArgs)

	if state.DoomMode.value == 'Doom' then
		--send_command('input /party IS STILL DOOMED! <scall15>') --[[Uncomment this if you want this to happen after actions]]
	end

end

function job_precast(spell, action, spellMap, eventArgs)


	
end

function job_post_precast(spell, action, spellMap, eventArgs)

	
	if (buffactive['invincible'] or buffactive['sentinel'] or buffactive['palisade'] 
		or spell.english == 'Holy Circle' or spell.english == 'Sentinel' 
		or spell.english == 'Rampart' or spell.english == 'Divine Emblem' or spell.english == 'Cover' 
		or spell.english == 'Palisade' or spell.english == 'Provoke' or spell.english == 'Animated Flourish') then
			equip(sets.EnmityMax)
	end
	
	if state.HPMode.value == 'HighHP' and spell.action_type == 'Magic' then
		equip(sets.precast.HighHP)

	end
	
	if spell.type:lower() == 'weaponskill' and state.HPMode.value == 'HighHP' then
		equip(sets.precast.WS.HighHP)
	end

end

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)

	
	if spell.english == 'Phalanx' and buffactive['Defense Boost'] and buffactive['Phalanx'] then
		equip(set_combine(sets.midcast['Phalanx'], {main="Deacon Sword"}))
	end
	
	if spell.english == 'Phalanx' and not buffactive['phalanx']  then 
		equip(set_combine(sets.midcast['Phalanx'], sets.SIRD_Phalanx))
	end
	
	if spell.english == 'Holy' or spell.english == 'Holy II'  then 
		equip(sets.midcast.Holy)
	end
		
	if state.HPMode.value == 'HighHP' and spell.skill == 'Magic' then 
		equip(sets.idle.HighHP)
	end
	
	if spellMap == 'Healing' and spell.target.type == 'SELF' then
            equip(sets.self_healing)
	end
	
	 if spell.english == 'Reprisal' or (spellMap and spellMap == 'Reprisal') then
        return
    end
	
if (spell.skill == 'Enhancing Magic'
 or spell.skill == 'Blue Magic'
 or spell.skill == 'Divine Magic'
 or spell.skill == 'Healing Magic')
 and spell.english ~= 'Reprisal'     -- exclude Reprisal
 and state.CastingMode.value == 'SIRD'
then
    equip(sets.midcast.SIRD)
end
		

    -- Only for Reprisal while in SIRD mode
    if spell.english == 'Reprisal' and state.CastingMode.value == 'SIRD' then
        equip(sets.midcast.Reprisal)  -- a uniquely named set
        eventArgs.handled = true  -- prevent later layers from changing it
    end

	if spell.skill == ('Healing Magic') and state.CastingMode.value == 'CureCheat' then
		equip(sets.midcast.CureCheat)
	end
	
	
	if (buffactive['invincible'] or buffactive['sentinel'] or buffactive['palisade'])
		and (spell.english == 'Jettatura' or spell.english == 'Geist Wall' 
		or spell.english == 'Soporific' or spell.english == 'Blank Gaze' or spell.english == 'Sheep Song' 
		or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere' or spell.english == 'Stun' 
		or spell.english == 'Awful Eye'or spell.english == 'Grand Slam') then
			equip(sets.Enmity)
	end
	
	if state.HPMode.value == 'HighHP' and spell.english:startswith('Cure') then
		equip(sets.midcast.Cure.HighHP)
	end
	
	if state.ReraiseMode.value == 'Reraise' and spell.skill == 'Magic' then
		equip(sets.Reraise)
	end
	
end

windower.register_event('zone change', function()

	send_command('gs c set ZoneRing None')
	
end)

function job_midcast(spell, action, spellMap, eventArgs)


	if spell.english == 'Invincible' then
		equip(sets.Enmity)
	elseif spell.english == 'Jettatura' or spell.english == 'Geist Wall' or spell.english == 'Soporific' or spell.english == 'Blank Gaze' 
	or spell.english == 'Sheep Song' or spell.english == 'Chaotic Eye' or spell.english == 'Cursed Sphere'
	or spell.english == 'Stun' or spell.english == 'Awful Eye'or spell.english == 'Grand Slam' then
		equip(sets.Enmity)
	end
	
	
	if spell.skill == 'Enhancing Magic' then
		equip(sets.midcast.Enhance)
	end
	
	if state.ReraiseMode.value == 'Reraise' and spell.skill == 'Enhancing Magic' then
		equip(set_combine(sets.midcast.Enhance, sets.Reraise))
	end

	
	if spell.english == 'Pollen' then
		equip(sets.midcast.OmenLowHP)
	end

	
end

function customize_idle_set(idleSet)

    if buffactive['Doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
	end
	
	if not buffactive['Shell'] and state.IdleMode.value == 'Tanking' then
		if not (world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
		idleSet = set_combine(idleSet, sets.idle.MDT)
		end
		
	end

	if state.DamageMode.value == 'Unlocked' then
		idleSet = set_combine(idleSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Burtgang' then
		idleSet = set_combine(idleSet, sets.Burtgang)
	elseif state.DamageMode.value == 'Excalibur' then
		idleSet = set_combine(idleSet, sets.Excalibur)
	elseif state.DamageMode.value == 'Savage' then
		idleSet = set_combine(idleSet, sets.Savage)
	elseif state.DamageMode.value == 'Sequence' then
		idleSet = set_combine(idleSet, sets.Sequence)
	elseif state.DamageMode.value == 'Aeolian' then
		idleSet = set_combine(idleSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		idleSet = set_combine(idleSet, sets.Lv1Dagger)
		return idleSet
	end

	
	if state.ShieldMode.value == 'Aegis' then
			idleSet = set_combine(idleSet, {sub="Aegis"})
		elseif state.ShieldMode.value == 'Duban' then
			idleSet = set_combine(idleSet, {sub="Duban"})
		elseif state.ShieldMode.value == 'MP' then
			idleSet = set_combine({
    main="Burtgang",
    sub="Aegis",
    ammo="Staunch Tathlum +1",
    head="Chev. Armet +3",
	body={name="Sworn Platemail", priority=6},
    hands={ name="Souv. Handsch. +1", augments={'HP+105','Enmity+9','Potency of "Cure" effect received +15%',}, priority=12},
    legs="Chev. Cuisses +3",
    feet="Rev. Leggings +4",
    neck={ name="Unmoving Collar +1", augments={'Path: A',}, priority=7},
    waist="Flume Belt +1",
    left_ear={name="Tuisto Earring", priority=11},
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring={name="Moonlight Ring",priority=10},
    right_ring={ name="Gelatinous Ring +1", augments={'Path: A',}},
    back={ name="Rudianos's Mantle", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Enmity+10','Chance of successful block +5',}},
}, {main="Thibron", sub="Duban"})
	end
	
	
	
	
	
	if state.ShieldMode.value == 'Ochain' and buffactive['reprisal'] then
		idleSet = set_combine(idleSet, {sub="Priwen"})
	end
	
	if state.ZoneRing.value == 'Warp' then
		idleSet = set_combine(idleSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Mea)"})	
		return idleSet
	end
	
	if state.ReraiseMode.value == 'Reraise' then
		idleSet = set_combine(idleSet, sets.Reraise)
	end
	
	if state.HPMode.value == 'HighHP' then
		idleSet = sets.idle.HighHP
	end
	

	
	if state.Moving.value == 'true' then
		idleSet = set_combine(idleSet, sets.MoveSpeed)
	end
	
	
	if state.HippoMode.value == 'On' then 
	idleSet = sets.Hippomenes
	end
	
	return idleSet
end


function job_buff_change(buff, gain)


		if buff == "doom" and gain then
				send_command('gs c set DoomMode Doom')
			elseif buff == "doom" and not gain then
				send_command('gs c set DoomMode OFF')
		end
		
		if buff == 'Shell' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			send_command('input /party Shell is DOWN: Magic Defense Bonus Off <call14>')
			end
		end
		
		
				if buff == 'Stoneskin' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			--send_command('input /party ******** Stoneskin Off ******** <call20>')
			end
		end
		
		
		
		
		
		if state.MajestyMode.value == 'On' and not buffactive['Majesty'] then 
			if not buffactive['Majesty'] then
			if not buffactive['sneak'] or buffactive['invisible'] then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			send_command('wait 1; input /ja majesty <me>')
			end
		end
	end
end

		if state.MajestyMode.value == 'Off' and not buffactive['Majesty'] then 
			if not buffactive['Majesty'] then
			if not buffactive['sneak'] or buffactive['invisible'] then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			end
		end
	end
end
			
		
		if buff == 'Defense Boost' and not gain then
			if not	(world.area:contains("Adoulin") or world.area:contains("Mhaura") 
			or world.area:contains("Selbina") or world.area:contains("Southern San d'Oria") 
			or world.area:contains("Northern San d'Oria") or world.area:contains("Port San d'Oria") 
			or world.area:contains("Chateau d'Oraguille")or world.area:contains("Port Bastok") 
			or world.area:contains("Bastok Mines") or world.area:contains("Bastok Markets") 
			or world.area:contains("Metalworks")or world.area:contains("Windurst Walls") 
			or world.area:contains("Port Windurst") or world.area:contains("Heavens Tower") 
			or world.area:contains("Windurst Waters") or world.area:contains("Windurst Woods")
			or world.area:contains("Norg") or world.area:contains("Kazham") or world.area:contains("Rabao")
			or world.area:contains("Al Zahbi") or world.area:contains("Whitegate")
			or world.area:contains("Port Jeuno") or world.area:contains("Lower Jeuno") 
			or world.area:contains("Upper Jeuno") or world.area:contains("Ru'Lude")
			or world.area:contains("Tavnazian")) then
			windower.add_to_chat(122,'*_*)    COCOON   HAS WORN OFF    (*_*')
			--send_command('input /party Cocoon DOWN: Defense Bonus Off <call21>')
			end
		end
		
		if buff == 'Phalanx' and not gain then
			windower.add_to_chat(122,'*_*)    PHALANX   HAS WORN OFF    (*_*')
		end	
	
end


function job_state_change(stateField, newValue, oldValue)

    if stateField == 'WeaponLockMode' then
        if newValue == 'Unlocked' then
            enable('main','sub','range','ammo')
        elseif newValue == 'Locked' and (player.equipment.range == 'Ullr' or player.equipment.range == 'Kaja Bow') then
            disable('main','sub','range','ammo')
		elseif newValue == 'Locked' then
            disable('main','sub','range')
        end
    end
	
	  if stateField == 'DamageMode' then
        if newValue == 'Unlocked' then
            send_command('wait 0.4;gs c set WeaponLockMode Unlocked')
        end
    end

	
	if stateField == 'DynaMode' then
	if newValue == 'RP_Farm' then
			equip(sets.Dyna_RP_Farm)
			if sets.Dyna_RP_Farm.neck and sets.Dyna_RP_Farm.main then
				disable('main','neck')
			elseif sets.Dyna_RP_Farm.main then
				disable('main')
			elseif sets.Dyna_RP_Farm.neck then
				disable('neck')
			end
		elseif newValue ~= 'RP_Farm' then
			enable('neck')
		end
	end

	send_command('gs c update')


	
	if state.DoomMode.value == 'Doom' then
		send_command("input /party ****DOOMED**** <call2>")
	elseif state.DoomMode.value ==  newValue and newValue == 'OFF' then
		send_command('input /party Doom is off! :D ')
	end
	
	if state.ShieldMode.value == newValue and state.WeaponLockMode.value == 'Locked' then
		send_command('gs enable main sub range;wait 0.1; gs disable main sub range')
	end

end

function customize_melee_set(meleeSet)



	if state.DamageMode.value == 'Unlocked' then
		meleeSet = set_combine(meleeSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Burtgang' then
		meleeSet = set_combine(meleeSet, sets.Burtgang)
	elseif state.DamageMode.value == 'Excalibur' then
		meleeSet = set_combine(meleeSet, sets.Excalibur)
	elseif state.DamageMode.value == 'Savage' then
		meleeSet = set_combine(meleeSet, sets.Savage)
	elseif state.DamageMode.value == 'Sequence' then
		meleeSet = set_combine(meleeSet, sets.Sequence)
	elseif state.DamageMode.value == 'Aeolian' then
		meleeSet = set_combine(meleeSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		meleeSet = set_combine(meleeSet, sets.Lv1Dagger)
	end


	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if not buffactive['Shell'] and state.ShieldMode.value ~= 'Aegis' and (state.OffenseMode.value == 'Hybrid' or state.OffenseMode.value == 'Normal') then
		meleeSet = set_combine(meleeSet, sets.engaged.MDT)
	end
	
	if state.ShieldMode.value == 'Aegis' then
			meleeSet = set_combine(meleeSet, sets.Aegis)
		elseif state.ShieldMode.value == 'Ochain' then
			meleeSet = set_combine(meleeSet, sets.Ochain)
	end
	
	if state.ShieldMode.value == 'Ochain' and buffactive['reprisal'] then
		meleeSet = set_combine(meleeSet, sets.Priwen)
	end
	
	if state.ZoneRing.value == 'Warp' then
		meleeSet = set_combine(meleeSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Mea)"})	
		return meleeSet
	end
	
	if state.HPMode.value == 'HighHP' then
		meleeSet = sets.engaged.HighHP
	end
	
	if state.ReraiseMode.value == 'Reraise' then
		meleeSet = set_combine(meleeSet, sets.Reraise)
	end
	
    return meleeSet
	 
end
 
--this will disable all add_to_chat, reccomend using Echos.  Alternatively, you can disable this.
function add_to_chat(command)
	if handle_unset and command == 'add_to_chat' then
	end
end

--This is used to make sure we will attempt to refresh the window every second
--prerender is actually faster than 1 second as it is called every few milliseconds
time_start = os.time()
windower.register_event(
    "prerender",
    function()
        --Items we want to check every second
        if os.time() > time_start then
            --We want to keep this reset each time we enter so its called every second
            time_start = os.time()

            --Simply refreshes the window
            refreshWindow()
        end
    end
)


--Window
--Default To Set Up the Text Window

-- Place this in the job_function()
-- setupTextWindow(1400, 600)

-- You can toggle this with a command to turn the entire window on and off
-- visible = false
visible = true

function setupTextWindow(pos_x, pos_y)
    tb_name = "run_gs_helper"
    bg_visible = true
    textinbox = " "

    windower.text.create(tb_name)
    -- table_name, x, y
    windower.text.set_location(tb_name, pos_x, pos_y)
    -- transparency, rgb
    windower.text.set_bg_color(tb_name, 170, 30, 30, 40)
    windower.text.set_color(tb_name, 255, 255, 161, 61)
    windower.text.set_font(tb_name, "Trebuchet MS")
    windower.text.set_font_size(tb_name, 10)
    windower.text.set_bold(tb_name, true)
    windower.text.set_italic(tb_name, false)
    windower.text.set_text(tb_name, textinbox)
    windower.text.set_bg_visibility(tb_name, bg_visible)
    windower.text.set_visibility(tb_name, visible)
end

--Hanldles refreshing the current text window
-- refreshWindow() should be called anytime you perform an action that would change what is on the window
function refreshWindow()
    textinbox = " " -- This is what gets drawn on the screen at the end
    textColorNewLine = "\\cr \n" --Placed at the end of a line to end the color and make a new line after
    textColorEnd = " \\cr" -- Placed at the end of what you are displaying to end the given color
    textColor = "\\cs(125, 255, 125)" --RGB color setting

    if not visible then --If not 'true' then it will hide the window all together
        textinbox = ""
        windower.text.set_text(tb_name, textinbox)
        return
    end

    --If you want to Toggle this section uncomment the if and end
    --You'll need to use a variable like this in user_setup():
    --state.textHideMode = M(false, "Hide Mode")
    --then you can toggle it with Mote's
    -- //gs c toggle textHideMode
    
    -- if not state.textHideMode.value then
	
		textinbox = textinbox .. drawTitle("  Local Keybinds  ")
		textinbox = textinbox .. textColor .. "(CTRL+F11) Idle & Engaged -> Normal" .. textColorNewLine
		textinbox = textinbox .. textColor .. "(F11) Idle & Engaged -> Tanking" .. textColorNewLine
	
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in

		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
	
	
		if state.DamageMode.value == 'Burtgang' then
			textinbox = textinbox .. "\\cs(255, 255, 70)" .. "Damage Mode (F6) : " .. "\\cs(3, 236, 252)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Unlocked'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Excalibur'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(235, 252, 3)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Savage'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Sequence'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Aoelian'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.DamageMode.current) .. textColorNewLine
			elseif state.DamageMode.value == 'Lv.1 Dagger'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Damage Mode (F6) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.DamageMode.current) .. textColorNewLine
			end
		
		
		
   
			if state.IdleMode.value == 'Aminon' then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .."Idle Mode (F10) : " .. "\\cr" .. "\\cs(138,43,226)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Normal'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Tanking'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Block'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'MDEF'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Layered'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'EnmityRetention'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'DmgMP'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'MbozeV25'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Refresh'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(220, 20, 60)" .. tostring(state.IdleMode.current) .. textColorNewLine
			elseif state.IdleMode.value == 'Absorb'  then
			textinbox = textinbox .. "\\cs(255, 255, 75)" .. "Idle Mode (F10) : " .. "\\cr" .. "\\cs(220, 20, 60)" .. tostring(state.IdleMode.current) .. textColorNewLine
	
			
	
		
			end
			
				if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		end
	
		
			if state.DynaMode.value == 'RP_Farm' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "DynaRP Mode (CTRL+F4) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.DynaMode.current) .. textColorNewLine
		elseif state.DynaMode.value == 'None' then
		    textinbox = textinbox .. "\\cs(255, 255, 255)" .. "DynaRP Mode (CTRL+F4) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.DynaMode.current) .. textColorNewLine
		end

				if state.MajestyMode.value == 'On' then
			textinbox = textinbox .. "\\cs(255, 75, 255)" .. "Majesty Mode (INS) : " .. "\\cr" .. "\\cs(220, 20, 60)" .. tostring(state.MajestyMode.current) .. textColorNewLine
		elseif state.MajestyMode.value == 'Off' then
			textinbox = textinbox .. "\\cs(255, 75, 255)" .. "Majesty Mode (INS) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.MajestyMode.current) .. textColorNewLine
		end
		
		
		textinbox = textinbox .. "\\cs(220, 20, 60)" .. "Hippo Mode (CNTRL+INS) : " .. tostring(state.HippoMode.current) .. textColorNewLine
		
		if state.ShieldMode.value == 'Aegis' then
		textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Shield Mode (F7) : " .. "\\cr" .. "\\cs(255, 255, 0)" .. tostring(state.ShieldMode.value) .. textColorNewLine
		elseif state.ShieldMode.value == 'MP' then
		textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Shield Mode (F7) : " .. "\\cr" .. "\\cs(255, 255, 0)" .. tostring(state.ShieldMode.value) .. textColorNewLine
		elseif state.ShieldMode.value == 'Duban' then
		textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Shield Mode (F7) : " .. "\\cr" .. "\\cs(148, 0, 211)" .. tostring(state.ShieldMode.value) .. textColorNewLine
		end
        textinbox = textinbox .. textColor .. "Main/Sub Lock (F12) : " .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		textinbox = textinbox .. "\\cs(255, 75, 255)" .. "Casting Mode [SIRD: -Enmity] (CTRL+F9) : " .. "\\cr" .. "\\cs(255, 255, 255)"..tostring(state.CastingMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Reraise Mode (CTRL+F8) : " .. tostring(state.ReraiseMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "HP Mode (CTRL+F10) : " .. tostring(state.HPMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Treasure Mode (CTRL+F7) : " .. tostring(state.TreasureMode.current) .. textColorNewLine
       
		
		if state.ZoneRing.current == 'Warp' then
			textinbox = textinbox .. "Zone Ring (CTRL+F12) : " .. "\\cs(255, 75, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Holla' then
			textinbox = textinbox .. "Zone Ring (CTRL+F12) : " .. "\\cs(255, 75, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Dem' then
			textinbox = textinbox .. "Zone Ring (CTRL+F12) : " .. "\\cs(0, 175, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Mea' then
			textinbox = textinbox .. "Zone Ring (CTRL+F12) : " .. "\\cs(255, 255, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'None' then
			textinbox = textinbox .. "Zone Ring (CTRL+F12) : " .. "\\cs(255, 255, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		end
		if state.Moving.value == 'false' then
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(255, 100, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		else
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(100, 255, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		end
			textinbox = textinbox .. textColor .. "Engaged Movespeed (F1) : " .. tostring(state.EngagedMoving.current) .. textColorNewLine
			

    --end

    --textinbox = textinbox .. drawTitle("  Options  ")

    --This takes a true and false value and will either display ON or OFF on the window instead of true or false
    --state.LockWeapon = M(false, "Lock Weapon") would be placed in user_setup()
    --textinbox = textinbox .. textColor .. "Lock Pet DT Set: " .. ternary(state.LockPetDT.value, "ON", "OFF") .. textColorNewLine
    --textinbox = textinbox .. textColor .. "Lock Weapon: " .. ternary(state.LockWeapon.value, "ON", "OFF") .. textColorNewLine

    windower.text.set_text(tb_name, textinbox)
end


--Creates the Title for a section in the Text Screen
function drawTitle(title)
    return "\\cs(200, 222, 255)" .. pad(tostring(title), 6, ":") .. "\\cr \n"
end

--Pads a given chara on both sides (centering with left justification)
function pad(s, l, c)
    local srep = string.rep
    local c = c or " "

    local res1 = srep(c, l) .. s -- pad to half-length s
    local res2 = res1 .. srep(c, l) -- right-pad our left-padded string to the full length

    return res2
end

--Takes a condition and returns a given value based on if it is true or false
function ternary(cond, T, F)
    if cond then
        return T
    else
        return F
    end
end


--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 2)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 2)
	else
		set_macro_page(1, 2)
	end
end


function get_obi(element)
    if element and elements.obi_of[element] then
        return (player.inventory[elements.obi_of[element]] or player.wardrobe[elements.obi_of[element]]) and elements.obi_of[element]
    end
end

