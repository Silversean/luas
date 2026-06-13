--[[ States:
Weapon Lock
Luzaf Mode
Idle Mode
Engaged mode
]]

--[[ Utility
]]

include('organizer-lib')

function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('movement.lua')

end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--                                                --
--================================================--


function job_setup()

end


--====================================================--
--	                                                  --
--	.   .                   ,---.     |               --
--	|   |,---.,---.,---.    `---.,---.|--- .   .,---. --
--	|   |`---.|---'|            ||---'|    |   ||   | --
--	`---'`---'`---'`        `---'`---'`---'`---'|---' --
--	                                            |     --
--                                                    --
--====================================================--


function user_setup()
	state.OffenseMode:options('DT', 'Normal', 'Acc')
	state.RangedMode:options('Acc', 'Normal', 'Mid')
	state.DamageMode = M('Rolls', 'Leaden', 'Savage Blade', 'Fomalhaut', 'Hot Shot', 'Aeolian','Lv.1 Dagger')
    state.WeaponLockMode = M('Unlocked', 'Locked')
	state.LuzafMode = M ('On','Off')
    state.IdleMode:options('DT', 'Town')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea', 'Living', 'Fomal')
	state.DoomMode = M('OFF', 'Doom')
    state.Moving = M('false', 'true')
	state.CorsairShot = M('Normal','Accuracy','Proc','StoreTP')


	--sets Weapon Lock Mode to 'Locked' by default.
	send_command('wait 1; gs c update; wait 0.2; gs c set WeaponLockMode Locked')

	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle DamageMode; gs enable sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f11 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind ^f9 gs c cycle CorsairShot')
	send_command('bind !f9 gs c cycle RangedMode')
	send_command('bind insert gs c set ZoneRing Living; wait 2; gs disable waist; wait 11; input /item "Living Bullet Pouch" <me>; wait 3; gs c set ZoneRing None; wait 1; gs enable waist')
	send_command('bind delete gs c set ZoneRing Fomal; wait 1; gs enable range; wait 0.2; gs disable range; wait 11; input /item "Fomalhaut" <me>; wait 3; gs c set ZoneRing None; wait 1; gs enable range; wait 1; gs c set WeaponLockMode Locked')
	

end

function job_setup()
setupTextWindow(1650, 1150)--[[(1650, 1150)]]
include('Mote-TreasureHunter')
end


--=================================--
--  _  _ _  _ _    ____ ____ ___   --
--  |  | |\ | |    |  | |__| |  \  --
--  |__| | \| |___ |__| |  | |__/  --
--                                 --
--=================================--

function user_unload()

        send_command('unbind ^f9')
        send_command('unbind ^f10')
		send_command('unbind ^f11')
		send_command('unbind ^f12')
		send_command('unbind f8')
       
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


function user_unload()
	send_command('unbind ^insert')
end
--=============================================--
--                                             --
--   ..|'''.|  '||''''|      |     '||''|.     --
--  .|'     '   ||  .       |||     ||   ||    --
--  ||    ....  ||''|      |  ||    ||''|'     --
--  '|.    ||   ||        .''''|.   ||   |.    --
--   ''|...'|  .||.....| .|.  .||. .||.  '|'   --
--                                             --
--=============================================--


function init_gear_sets()

	sets.Rostam = {    
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: B',}},
		range="Compensator",
		ammo="Living Bullet",}

	sets.DP = {    
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",}

	sets.Fomal = {    
		main="Kustawi +1",
		sub="Nusku Shield",
		range="Fomalhaut",
		ammo="Chrono Bullet",}
		
	sets.HotShot = {
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret",
		range="Fomalhaut",
		ammo="Living Bullet"}
		
	sets.Naegling = {    
		main="Naegling",
		sub="Gleti's Knife",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
		ammo="Chrono Bullet",}

	sets.Aeolian = {    
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
		ammo="Living Bullet",}

	sets.Lv1Dagger = {    
		main="Mercurial Kris",
		sub="Bronze Knife",
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",}


--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--

	sets.precast.FC = {head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Herculean Vest", augments={'Mag. Acc.+24','"Fast Cast"+6','"Mag.Atk.Bns."+11',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+3','"Fast Cast"+6','MND+9','Mag. Acc.+11',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Carrier's Sash",
    left_ear="Loquac. Earring",
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	-- DT | SIRD | Utsu spellcasting - 
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket",})

	-- Snapshot | Rapid Shot | DT
	sets.precast.RA = {
    main={ name="Rostam", augments={'Path: B',}},
    sub="Tauret",
    range={ name="Death Penalty", augments={'Path: A',}},
    ammo="Living Bullet",
    head="Chass. Tricorne +3",
    body="Oshosi Vest +1",
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Adhemar Kecks +1", augments={'AGI+12','"Rapid Shot"+13','Enmity-6',}},
    feet="Meg. Jam. +2",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Yemaya Belt",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Hajduk Ring",
    right_ring="Crepuscular Ring",
    back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15',}},
}
	
	--[[Job Abilities]]
	
	
	sets.precast.JA = {}
	
	-- DT Gear | Relic Body | -enmity
	sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}

	-- DT Gear | Relic Feet | -enmity
	sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +4"}
	
	-- DT Gear | Relic Legs | -enmity
	sets.precast.JA['Snake Eye'] = {legs="Lanun Trews +3"}
	
	sets.precast.JA['Double-Up'] = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    ammo="Living Bullet",
    head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs={ name="Desultor Tassets", augments={'"Phantom Roll" ability delay -5','Sklchn.dmg.+5%',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Regal Necklace",
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Luzaf's Ring",
    back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15',}},
}
	
	sets.precast.JA['Fold'] = {hands="Lanun Gants +3"}
	
	-- Phantom Roll + | Relic Head | Roll Duration Gear | -enmity/DT
	sets.precast.JA['Phantom Roll'] = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    ammo="Living Bullet",
    head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs={ name="Desultor Tassets", augments={'"Phantom Roll" ability delay -5','Sklchn.dmg.+5%',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Regal Necklace",
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Luzaf's Ring",
    back={ name="Camulus's Mantle", augments={'INT+20','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Snapshot"+10','Mag. Evasion+15',}},
}
	
	-- Phantom Roll + | Empy Body | Relic Head | Roll Duration Gear | -enmity/DT
	sets.precast.JA['Tactician Roll'] = {
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: B',}},
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
		body="Nyame Mail",
		hands="Chasseur's Gants +3",
		legs="Malignance Tights",
		feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
		neck="Regal Necklace",
		waist="Yemaya Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring="Archon Ring",
		right_ring="Luzaf's Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	
	-- Phantom Roll + | Empy Boots | Relic Head | Roll Duration Gear | -enmity/DT
	sets.precast.JA['Courser Roll'] = {    
		main={ name="Rostam", augments={'Path: C',}},
		sub="Tauret",
		range="Compensator",
		ammo="Bronze Bullet",
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
		body="Nyame Mail",
		hands="Chasseur's Gants +3",
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +3%','STR+8',}},
		feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
		neck="Regal Necklace",
		waist="Yemaya Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring="Archon Ring",
		right_ring="Luzaf's Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
	
	-- Phantom Roll + | Empy Head | Relic Head | Roll Duration Gear | -enmity/DT
	sets.precast.JA['Blitzer Roll'] = {    
		main={ name="Rostam", augments={'Path: C',}},
		sub="Tauret",
		range="Compensator",
		ammo="Bronze Bullet",
		head={ name="Lanun Tricorne +3", augments={'Enhances "Winning Streak" effect',}},
		body="Nyame Mail",
		hands="Chasseur's Gants +3",
		legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+23','Weapon skill damage +3%','STR+8',}},
		feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
		neck="Regal Necklace",
		waist="Yemaya Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Friomisi Earring",
		left_ring="Archon Ring",
		right_ring="Luzaf's Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},}
	
	--  MAB Gear | Empy Boots | -enmity
	
	
	sets.precast.Waltz =  {
    head={ name="Herculean Helm", augments={'"Waltz" potency +11%','Accuracy+8',}},
    body="Passion Jacket",
    hands={ name="Herculean Gloves", augments={'"Waltz" potency +11%','Attack+2',}},
    legs={ name="Taeon Tights", augments={'Accuracy+17','"Cure" potency +2%','Weapon skill damage +2%',}},
    feet={ name="Herculean Boots", augments={'Attack+13','"Waltz" potency +9%','STR+1','Accuracy+15',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Gishdubar Sash",
    left_ring="Asklepian Ring",
	right_ring="Valseur's Ring",
}

	sets.Doom = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Lethargy Gantherots +2",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Blenmot's Ring +1",
		right_ring="Blenmot's Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}
		
		
	sets.Phalanx = {
    main={ name="Rostam", augments={'Path: B',}},
    sub="Tauret",
    range={ name="Death Penalty", augments={'Path: A',}},
    ammo="Living Bullet",
    head={ name="Taeon Chapeau", augments={'Accuracy+11','"Snapshot"+4','Phalanx +3',}},
    body={ name="Taeon Tabard", augments={'Accuracy+22','Haste+2','Phalanx +3',}},
    hands={ name="Taeon Gloves", augments={'"Mag.Atk.Bns."+20','"Subtle Blow"+6','Phalanx +3',}},
    legs={ name="Taeon Tights", augments={'Accuracy+17','"Cure" potency +2%','Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Accuracy+9','"Fast Cast"+3','Phalanx +3',}},
}
--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

	-- DT | SIRD | Utsu spellcasting - (For recast reduction)
	sets.midcast.Utsusemi = {
		head="Malignance Chapeau",
		body="Chasseur's Frac +3",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Carrier's Sash",
		left_ear="Telos Earring",
		right_ear={ name="Chas. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Breath dmg. taken -4%','Phys. dmg. taken -5%',}},
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
		
		
		
	sets.midcast['Absorb-TP'] = {
    main={ name="Rostam", augments={'Path: C',}},
    sub="Nusku Shield",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Living Bullet",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Chasseur's Frac +3",
    hands="Chasseur's Gants +3",
    legs="Chas. Culottes +3",
    feet="Chass. Bottes +3",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="K. Kachina Belt +1",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Enchntr. Earring +1",
    left_ring="Kishar Ring",
    right_ring="Weather. Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	
	
	
	sets.midcast.CorsairShot = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    ammo="Living Bullet",
    head="Ikenga's Hat",
    body={ name="Lanun Frac +3", augments={'Enhances "Loaded Deck" effect',}},
    hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Friomisi Earring",
    right_ear="Hermetic Earring",
    left_ring="Dingir Ring",
    right_ring="Shiva Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	

	
	sets.midcast.CorsairShot.Accuracy = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    ammo="Living Bullet",
    head="Laksa. Tricorne +2",
    body="Ikenga's Vest",
    hands="Chasseur's Gants +3",
    legs="Ikenga's Trousers",
    feet="Malignance Boots",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="K. Kachina Belt +1",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Regal Ring",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
    sets.midcast.CorsairShot.Proc = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    range="Compensator",
    ammo="Living Bullet",
    head={ name="Blood Mask", augments={'Mag. Acc.+2','"Quick Draw" ability delay -5',}},
    body={ name="Mirke Wardecors", augments={'"Quick Draw" ability delay -5','Mag. Acc.+4',}},
    hands="Chasseur's Gants +3",
    legs="Malignance Tights",
    feet="Chass. Bottes +3",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="K. Kachina Belt +1",
    left_ear="Crep. Earring",
    right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}


    sets.midcast.CorsairShot.StoreTP ={
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Chasseur's culottes +3",
    feet="Chass. Bottes +3",
    neck="Iskur Gorget",
    waist="Gerdr Belt",
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring="Crepuscular Ring",
    right_ring="Chirich Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
}
	
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--

	-- WSD | STR | Accuracy | Attack | High fTP (No Fotia)
	sets.precast.WS['Savage Blade'] = {
    main="Naegling",
    sub={ name="Gleti's Knife", augments={'Path: A',}},
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	-- Multi-Attack | MND | Accuracy | Attack | XFer fTP (USE Fotia) | Non-Elemental Magical
	sets.precast.WS['Requiescat'] = {}
	
	-- WSD | AGI | R.Accuracy | R.Attack | High fTP (No Fotia)
	sets.precast.WS['Last Stand'] = {
    main={ name="Rostam", augments={'Path: C',}},
    sub="Nusku Shield",
    range="Fomalhaut",
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Ikenga's Vest", augments={'Path: A',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+3','Weapon skill damage +10%','Mag. Evasion+6',}},
}
	
	-- WSD | MAB | AGI | M.Accuracy/R.Accuracy | Darkness Elemental (Use Obi/O-Sash) | Archon Ring/Pixie Hairpin +1
	sets.precast.WS['Leaden Salute'] = {
    main={ name="Rostam", augments={'Path: B',}},
    sub="Tauret",
    range={ name="Death Penalty", augments={'Path: A',}},
    ammo="Living Bullet",
    head="Pixie Hairpin +1",
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Svelt. Gouriz +1",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Archon Ring",
    right_ring="Dingir Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	
	-- WSD | MAB | AGI | R.Attack | R.Accuracy | Elemental Hybrid (Obi/Sash) | Low-fTP (Fotia Gorget)
	sets.precast.WS['Hot Shot'] = {range="Fomalhaut",
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Telos Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Dingir Ring",
    right_ring="Epanimodas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+3','Weapon skill damage +10%','Mag. Evasion+6',}},
}
	
	-- WSD | STR | Attack | Accuracy | AREA OF EFFECT | Low-fTP (Fotia Gorget/Belt)
	sets.precast.WS['Circle Blade'] = {}
	
	sets.precast.WS['Wildfire'] = {
	-- WSD | MAB | AGI | M.Accuracy/R.Accuracy | Fire Elemental Magical(Use Obi/O-Sash)
    main="Naegling",
    sub="Tauret",
    range="Fomalhaut",
    ammo="Chrono Bullet",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Lanun Frac +3",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Lanun Bottes +4",
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Ishvara Earring",
    left_ring="Dingir Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','AGI+3','Weapon skill damage +10%','Mag. Evasion+6',}},
}
	
	-- Accuracy | Bad Stats for Omen Skillchains | DT
	sets.precast.WS['Burning Blade'] = {}
	
	-- Accuracy | DT
	sets.precast.WS['Flat Blade'] = {}
	
	-- Multi-Attack | DEX | Critical Hit + | Attack | Accuracy | XFer fTP (USE Fotia)
	sets.precast.WS['Evisceration'] = {
		main="Tauret",
		sub="Blurred Knife +1",
		range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
		ammo="Chrono Bullet",
		head={ name="Adhemar Bonnet +1", augments={'DEX+10','AGI+10','Accuracy+15',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+10','AGI+10','Accuracy+15',}},
		hands="Mummu Wrists +1",
		legs={ name="Herculean Trousers", augments={'Crit. hit damage +5%','DEX+6','Attack+6',}},
		feet="Mummu Gamash. +1",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
		left_ring="Mummu Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}
	
	-- WSD | MAB | DEX/INT | AREA OF EFFECT | Wind Elemental Magical | High fTP (No Fotia)
	sets.precast.WS['Aeolian Edge'] = {
    main={ name="Rostam", augments={'Path: B',}},
    sub="Tauret",
    range={ name="Anarchy +2", augments={'Delay:+60','TP Bonus +1000',}},
    ammo="Living Bullet",
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Chasseur's Gants +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Lanun Bottes +4", augments={'Enhances "Wild Card" effect',}},
    neck={ name="Comm. Charm +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Shiva Ring +1",
    back={ name="Camulus's Mantle", augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}},
}

--------------------------------------------------------------------------------------------------------	
---- _____    ____    _   _   _____    _____   _______   _____    ____    _   _              _      ----
--  / ____|  / __ \  | \ | | |  __ \  |_   _| |__   __| |_   _|  / __ \  | \ | |     /\     | |       --
-- | |      | |  | | |  \| | | |  | |   | |      | |      | |   | |  | | |  \| |    /  \    | |       --
-- | |      | |  | | | . ` | | |  | |   | |      | |      | |   | |  | | | . ` |   / /\ \   | |       --
-- | |____  | |__| | | |\  | | |__| |  _| |_     | |     _| |_  | |__| | | |\  |  / ____ \  | |____   --
--  \_____|  \____/  |_| \_| |_____/  |_____|    |_|    |_____|  \____/  |_| \_| /_/    \_\ |______|  --
----																								----
--------------------------------------------------------------------------------------------------------

	sets.Doom = {}

	--25% movement in Adoulin city
	sets.Adoulin = {body="Councilor's Garb",}

	--18% movement when moving
    sets.MoveSpeed = {legs="Carmine Cuisses +1",}

	--Extend Phantom Roll area of effect.  (16 yalms vs 8 yalms without)
	sets.Luzaf = {ring1="Luzaf's Ring"}
	
	sets.Obi = {waist="Hachirin-no-Obi",}
	
	sets.Orpheus = {waist="Orpheus's Sash"}
	
--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--

	-- PDT | Magic Evasion | Regen +

	sets.idle = {}
	
	-- Show-off gear
	sets.idle.Town = {    
		main={ name="Rostam", augments={'Path: C',}},
		sub="Tauret",
		range={ name="Anarchy", augments={'DMG:+5','Sniper Shot:DMG:+10%',}},
		ammo="Bronze Bullet",
		head="Nyame Helm",
		body="Nyame Mail",
		hands="Nyame Gauntlets",
		legs="Nyame Flanchard",
		feet="Nyame Sollerets",
		neck="Loricate Torque +1",
		waist="Carrier's Sash",
		left_ear="Telos Earring",
		right_ear={ name="Chas. Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+6','Mag. Acc.+6',}},
		left_ring="Defending Ring",
		right_ring="Regal Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}
	
	-- PDT/MDT/DT | Magic Evasion | Regen +
	sets.idle.DT = {
    main={ name="Rostam", augments={'Path: C',}},
    sub={ name="Rostam", augments={'Path: B',}},
    range="Compensator",
    ammo="Living Bullet",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Carrier's Sash",
    left_ear="Odnowa Earring +1",
    right_ear="Etiolation Earring",
    left_ring="Defending Ring",
    right_ring="Roller's Ring",
    back="Null Shawl",
}

	
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

--[[Melee Sets]]

	-- 25~26% Gear Haste | 25~31 Dual Wield | Multi-Attack | Store-TP | Accuracy | "Some" DT
	sets.engaged = {
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Chasseur's Culottes +3",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back="Null Shawl",}

	-- ~50% PDT/MDT | 25~26% Gear Haste | 20+ DW If you can manage | Multi-Attack | Store-TP | Asccuracy

	sets.engaged.DT = {
    range="Anarchy +2",
    ammo="Chrono Bullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Chas. Culottes +3",
    feet="Nyame Sollerets",
    neck="Iskur Gorget",
    waist="Windbuffet Belt +1",
    left_ear="Cessance Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Defending Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	-- 25~26% Gear Haste | 9~11 Dual Wield | Multi-Attack | Store-TP | Accuracy | "Some" DT
	sets.engaged.HasteCap = {
		main={ name="Rostam", augments={'Path: B',}},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Iskur Gorget",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	
	-- ~50% PDT/MDT | 25~26% Gear Haste | 10 DW If you can manage | Multi-Attack | Store-TP | Accuracy
	sets.engaged.HasteCap.DT = {
    main="Kustawi +1",
    sub="Nusku Shield",
    range="Compensator",
    ammo="Living Bullet",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Chas. Culottes +3",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Telos Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}

	sets.engaged.HasteCap.Acc = {
		main={ name="Rostam", augments={'Path: B',}},
		sub={ name="Rostam", augments={'Path: C',}},
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head="Malignance Chapeau",
		body="Chasseur's Frac +3",
		hands="Chasseur's Gants +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}


	sets.engaged.Acc = {
		main={ name="Rostam", augments={'Path: B',}},
		sub={ name="Rostam", augments={'Path: C',}},
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head="Malignance Chapeau",
		body="Chasseur's Frac +3",
		hands="Chasseur's Gants +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Suppanomimi",
		right_ear="Telos Earring",
		left_ring="Petrov Ring",
		right_ring="Epona's Ring",
		back={ name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},
}
	
	
	
	
	
	
	
	
	
--[[Ranged Sets]]

	-- Store-TP | R.Accuracy | R.Attack
	sets.midcast.RA = {
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: B',}},
		range="Compensator",
		ammo="Living Bullet",
		head="Ikenga's Hat",
		body="Ikenga's Vest",
		hands="Ikenga's Gloves",
		legs="Chas. Culottes +3",
		feet="Ikenga's Clogs",
		neck="Iskur Gorget",
		waist="Yemaya Belt",
		left_ear="Crep. Earring",
		right_ear={ name="Chas. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
		left_ring="Ilabrat Ring",
		right_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
	}

	sets.midcast.RA.Acc = {
		main={ name="Rostam", augments={'Path: C',}},
		sub={ name="Rostam", augments={'Path: B',}},
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head="Chass. Tricorne +3",
		body="Chasseur's Frac +3",
		hands="Chasseur's Gants +3",
		legs="Chas. Culottes +3",
		feet="Chass. Bottes +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Hajduk Ring",
		right_ring="Crepuscular Ring",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
	}
	
	-- Oshosi Pieces You own for Triple Shot, will be combined with previous RA set.
	sets.TripleShot = {
		main={ name="Rostam", augments={'Path: C',}},
		sub="Tauret",
		range={ name="Death Penalty", augments={'Path: A',}},
		ammo="Living Bullet",
		head="Oshosi Mask +1",
		body="Chasseur's Frac +3",
		hands={ name="Lanun Gants +3", augments={'Enhances "Fold" effect',}},
		legs="Osh. Trousers +1",
		feet="Osh. Leggings +1",
		neck="Ocachi Gorget",
		waist="Yemaya Belt",
		left_ear="Crep. Earring",
		right_ear="Telos Earring",
		left_ring="Crepuscular Ring",
		right_ring="Chirich Ring +1",
		back={ name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10','Damage taken-5%',}},
}

end

--=================================================================--
--  _____                          _     _                         --
-- |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
-- | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
-- |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
-- |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--                                                                 --
--=================================================================--



function job_precast(spell, action, spellMap, eventArgs)

	if spell.english == 'Aeolian Edge' then
		equip(sets.precast.WS['Aeolian Edge'])
	end
	
	if spell.english == "Corsair's Roll" or spell.english == "Ninja's Roll" 
		or spell.english == "Hunter's Roll" or spell.english == "Chaos Roll" 
		or spell.english == "Magus's Roll" or spell.english == "Healer's Roll" 
		or spell.english == "Drachen Roll" or spell.english == "Choral Roll" 
		or spell.english == "Monk's Roll" or spell.english == "Beast Roll" 
		or spell.english == "Samurai Roll" or spell.english == "Evoker's Roll" 
		or spell.english == "Rogue's Roll" or spell.english == "Warlock's Roll" 
		or spell.english == "Fighter's Roll" or spell.english == "Puppet Roll" 
		or spell.english == "Gallant's Roll" or spell.english == "Wizard's Roll" 
		or spell.english == "Dancer's Roll" or spell.english == "Scholar's Roll" 
		or spell.english == "Bolter's Roll" or spell.english == "Allies' Roll" 
		or spell.english == "Miser's Roll" or spell.english == "Caster's Roll" 
		or spell.english == "Companion's Roll" or spell.english == "Avenger's Roll" then
		equip(sets.precast.JA['Phantom Roll'])
	end
	
	if spell.english == "Tactician's Roll" then
		equip(sets.precast.JA['Tactician Roll'])
	end
	
	if spell.english == "Courser's Roll" then
		equip(sets.precast.JA['Courser Roll'])
	end
	
	if spell.english == "Blitzer's Roll" then
		equip(sets.precast.JA['Blitzer Roll'])
	end
	
	
	if spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot" or spell.english == "Light Shot" or spell.english == "Dark Shot" then
		equip(sets.precast.JA['Quick Draw'])
	end
	

	
	return
	
end



function job_post_precast(spell, action, spellMap, eventArgs)
			
	if spell.action_type == 'Ranged Attack' and player.equipment.ammo:lower() == 'hauksbok bullet' then
		equip({ammo=empty,})
		cancel_spell()
		add_to_chat(8,'!!!WARNING!!! Attempted to fire Hauksbok bullet! Shot canceled.')
	end

	if (spell.type:lower() == 'weaponskill' and spell.english ~= 'Savage Blade') and player.equipment.ammo:lower() == 'hauksbok bullet' then
		equip({ammo=empty,})
		cancel_spell()
		add_to_chat(8,'!!!WARNING!!! Attempted to fire Hauksbok bullet! Weaponskill canceled.')
	end
			
			


	if (spell.english == 'Hot Shot' or spell.english == 'Leaden Salute' or spell.english == 'Wildfire' or spell.english == 'Aeolian Edge')
		and (spell.element == world.weather_element) and world.weather_intensity == 2 then
			equip(sets.Obi)
	elseif (spell.english == 'Hot Shot' or spell.english == 'Leaden Salute' or spell.english == 'Wildfire' or spell.english == 'Aeolian Edge')
			and (spell.element == world.weather_element) and spell.target.distance >5 then
			equip(sets.Obi)
	elseif (spell.english == 'Hot Shot' or spell.english == 'Leaden Salute' or spell.english == 'Wildfire' or spell.english == 'Aeolian Edge')
			and spell.target.distance <9 then
			equip(sets.Orpheus)
	end 
	
	
	
	if spell.english == "Corsair's Roll" or spell.english == "Ninja's Roll" 
		or spell.english == "Hunter's Roll" or spell.english == "Chaos Roll" 
		or spell.english == "Magus's Roll" or spell.english == "Healer's Roll" 
		or spell.english == "Drachen Roll" or spell.english == "Choral Roll" 
		or spell.english == "Monk's Roll" or spell.english == "Beast Roll" 
		or spell.english == "Samurai Roll" or spell.english == "Evoker's Roll" 
		or spell.english == "Rogue's Roll" or spell.english == "Warlock's Roll" 
		or spell.english == "Fighter's Roll" or spell.english == "Puppet Roll" 
		or spell.english == "Gallant's Roll" or spell.english == "Wizard's Roll" 
		or spell.english == "Dancer's Roll" or spell.english == "Scholar's Roll" 
		or spell.english == "Bolter's Roll" or spell.english == "Allies' Roll" 
		or spell.english == "Miser's Roll" or spell.english == "Caster's Roll" 
		or spell.english == "Companion's Roll" or spell.english == "Avenger's Roll"
		or spell.english == "Tactician's Roll" or spell.english == "Blitzer's Roll"
		or spell.english == "Courser's Roll" and state.LuzafMode.Value == 'On' then
		equip(sets.Luzaf)
	end
	

	
	
end


function job_midcast(spell, action, spellMap, eventArgs)

	
	if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
		if buffactive['Copy Image'] then
				windower.ffxi.cancel_buff(66)
		elseif buffactive['Copy Image (2)'] then
				windower.ffxi.cancel_buff(444)
		elseif buffactive['Copy Image (3)'] then
				windower.ffxi.cancel_buff(445)
		end
	end
	
	
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot" or spell.english == "Light Shot" or spell.english == "Dark Shot") and state.CorsairShot.value == 'Accuracy' then
		equip(sets.midcast.CorsairShot.Accuracy)
	elseif (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot" or spell.english == "Light Shot" or spell.english == "Dark Shot") and state.CorsairShot.value == 'Recast' then
		equip(sets.midcast.CorsairShot.Proc)		
	elseif (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot" or spell.english == "Light Shot" or spell.english == "Dark Shot") and state.CorsairShot.value == 'StoreTP' then
		equip(sets.midcast.CorsairShot.StoreTP)
	elseif (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot" or spell.english == "Light Shot" or spell.english == "Dark Shot") and state.CorsairShot.value == 'Normal' then
		equip(sets.midcast.CorsairShot.Normal)
	end
	if (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot")
		and (spell.element == world.weather_element) and world.weather_intensity == 2 then
			equip(sets.Obi)
	elseif (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or 	spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot")
			and (spell.element == world.weather_element) and spell.target.distance >5 then
			equip(sets.Obi)
	elseif (spell.english == "Fire Shot" or spell.english == "Thunder Shot" or spell.english == "Water Shot" or spell.english == "Ice Shot" or spell.english == "Earth Shot" or spell.english == "Wind Shot")
			and spell.target.distance <9 then
			equip(sets.Orpheus)
	end 
	
	if spell.action_type == 'Ranged Attack' and buffactive['Triple Shot'] then
		equip(set_combine(sets.midcast.RA, sets.TripleShot))
	elseif spell.action_type == 'Ranged Attack' then
		equip(sets.midcast.RA)
	end
	
end


function job_aftercast(spell, action, spellMap, eventArgs)

   
	if spell and spell.name == 'Utsusemi: Ni' then
		ShadowType = 'Ni'
	elseif spell and spell.name == 'Utsusemi: Ichi' then
		ShadowType = 'Ichi'
	end
	
end

function job_state_change(stateField, newValue, oldValue)

    if stateField == 'WeaponLockMode' then
        if newValue == 'Unlocked' then
            enable('main','sub','range','ammo')
        elseif newValue == 'Locked' and (player.equipment.range == 'Death Penalty') then
            disable('main','sub','range','ammo')
		elseif newValue == 'Locked' then
            disable('main','sub','range','ammo')
        end
    end
	
end

function job_buff_change(buff, gain)
	if (buff and gain) or (buff and not gain) then
		if not midaction() then
			send_command('gs c update')
		end
	end
end

function customize_melee_set(meleeSet)

    if (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value == 'Acc' then
		meleeSet = set_combine(meleeSet, sets.engaged.HasteCap.Acc)
	elseif (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value == 'DT' then
		meleeSet = set_combine(meleeSet, sets.engaged.HasteCap.DT)
	elseif (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) then
        meleeSet = set_combine(meleeSet, sets.engaged.HasteCap)
    end
	

	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if buffactive['Elvorseal'] then 
		meleeSet = set_combine(meleeSet, sets.Domain)
	end
	
	if state.ZoneRing.value == 'Warp' then
		meleeSet = set_combine(meleeSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Mea)"})
	elseif state.ZoneRing.value == 'Living' then
		meleeSet = set_combine(meleeSet, {waist="Living Bullet Pouch",})
	elseif state.ZoneRing.value == 'Fomal' then
		meleeSet = set_combine(meleeSet, {range='Fomalhaut',})
		return meleeSet
	end
	
	
	if state.DamageMode.value == 'Rolls' then
		meleeSet = set_combine(meleeSet, sets.Rostam)
	elseif state.DamageMode.value == 'Leaden' then
		meleeSet = set_combine(meleeSet, sets.DP)
	elseif state.DamageMode.value == 'Fomalhaut' then
		meleeSet = set_combine(meleeSet, sets.Fomal)
	elseif state.DamageMode.value == 'Savage Blade' then
		meleeSet = set_combine(meleeSet, sets.Naegling)
	elseif state.DamageMode.value == 'Aeolian' then
		meleeSet = set_combine(meleeSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		meleeSet = set_combine(meleeSet, sets.Lv1Dagger)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		meleeSet = set_combine(meleeSet, sets.Lv1Dagger)
		return meleeSet
	end
	
	
	return meleeSet
	
	
	
end

function customize_idle_set(idleSet)
    
	if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
	elseif state.IdleMode.value == 'Normal' then
		idleSet = sets.idle.Normal
	elseif state.IdleMode.value == 'Town' then
		idleSet = sets.idle.Town
	elseif state.IdleMode.value == 'DT' then
		idleSet = sets.idle.DT
    end
	
	if state.ZoneRing.value == 'Warp' then
		idleSet = set_combine(idleSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		idleSet = set_combine(idleSet, {right_ring="Dimensional ring (Mea)"})	
	elseif state.ZoneRing.value == 'Living' then
		idleSet = set_combine(idleSet, {waist="Living Bullet Pouch",})
	elseif state.ZoneRing.value == 'Fomal' then
		idleSet = set_combine(idleSet, {range='Fomalhaut',})
		return idleSet
	end
	
	
	if state.DamageMode.value == 'Rolls' then
		idleSet = set_combine(idleSet, sets.Rostam)
	elseif state.DamageMode.value == 'Leaden' then
		idleSet = set_combine(idleSet, sets.DP)
	elseif state.DamageMode.value == 'Fomalhaut' then
		idleSet = set_combine(idleSet, sets.Fomal)
	elseif state.DamageMode.value == 'Savage Blade' then
		idleSet = set_combine(idleSet, sets.Naegling)
	elseif state.DamageMode.value == 'Aeolian' then
		idleSet = set_combine(idleSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		idleSet = set_combine(idleSet, sets.Lv1Dagger)
	elseif state.DamageMode.value == 'Hot Shot' then
		idleSet = set_combine(idleSet, sets.HotShot)	
		
		return idleSet
	end
		
		
	if buffactive['doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
    end
	
    return idleSet
	
end

function equip_gear_by_status(status)

end

windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
	end
	
	
end)






--this will disable all add_to_chat, reccomend using Echos.  Alternatively, you can disable this.
function add_to_chat(command)
	if handle_unset and command == 'add_to_chat' then
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'BLM' then
        set_macro_page(10, 5)
    elseif player.sub_job == 'WHM' then
        set_macro_page(10, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(10, 5)
    else
        set_macro_page(10, 5)
    end
end
---------------------------------------------------------------------------------------------------
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
    windower.text.set_font_size(tb_name, 14)
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
		textinbox = textinbox .. textColor .. "(INS) Living Bullets" .. textColorNewLine
		textinbox = textinbox .. textColor .. "(DEL) Chrono Bullets" .. textColorNewLine
	
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in
		textinbox = textinbox .. "\\cs(255, 255, 70)" .. "Damage Mode (F11): " .. "\\cs(100, 255, 100)" .. tostring(state.DamageMode.value) .. "\\cr \n"
		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Quick Draw Mode (CTRL+F9) : " .. tostring(state.CorsairShot.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Ranged TP Mode (ALT+F9) : " .. tostring(state.RangedMode.current) .. textColorNewLine
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		
		
		--[[if state.Enfeeb.value == 'Potency' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. tostring(state.Enfeeb.current) .. textColorNewLine
		elseif state.Enfeeb.value == 'Accuracy' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. tostring(state.Enfeeb.current) .. textColorNewLine
		elseif state.Enfeeb.value == 'Skill' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. "\\cs(255, 75, 75)" .. tostring(state.Enfeeb.current) .. textColorNewLine
		end]]
		
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		end
       
		
		if state.ZoneRing.current == 'Warp' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 75, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Living' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Fomal' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Holla' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 75, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Dem' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(0, 175, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'Mea' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 75)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		elseif state.ZoneRing.current == 'None' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 255, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
		end
		if state.Moving.value == 'false' then
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(255, 100, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		else
			textinbox = textinbox .. "Player Moving (Auto) : " .. "\\cs(100, 255, 100)" .. tostring(state.Moving.value) .. "\\cr \n"
		end
			
			textinbox = textinbox .. "\\cs(255, 255, 70)" .. "TreasureHunter Mode : " .. "\\cs(100, 255, 100)" .. tostring(state.TreasureMode.value) .. "\\cr \n"
			
			


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


function select_default_macro_book()
    -- Default macro set/book
    --[[if player.sub_job == 'BLM' then
        set_macro_page(10, 5)
    elseif player.sub_job == 'WHM' then
        set_macro_page(10, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(10, 5)
    else
        set_macro_page(10, 5)
    end]]
end

organizer_items = {
	echo="Echo Drops",
	echo2="Echo Drops",
	pana="Panacea",
	pana2="Panacea",
	reme="Remedy",
	reme2="Remedy",
	sush2="Sublime Sushi +1",
	sush1="Sublime Sushi",
	stew="Marine Stewpot",
	hall="Hallowed Water",
	shih="Shihei"}
