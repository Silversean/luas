--[[                                                                                                     
88888888ba   88                               88b           d88                                       
88      "8b  88                               888b         d888                                       
88      ,8P  88                               88`8b       d8'88                                       
88aaaaaa8P'  88  88       88   ,adPPYba,      88 `8b     d8' 88  ,adPPYYba,   ,adPPYb,d8   ,adPPYba,  
88""""""8b,  88  88       88  a8P_____88      88  `8b   d8'  88  ""     `Y8  a8"    `Y88  a8P_____88  
88      `8b  88  88       88  8PP"""""""      88   `8b d8'   88  ,adPPPPP88  8b       88  8PP"""""""  
88      a8P  88  "8a,   ,a88  "8b,   ,aa      88    `888'    88  88,    ,88  "8a,   ,d88  "8b,   ,aa  
88888888P"   88   `"YbbdP'Y8   `"Ybbd8"'      88     `8'     88  `"8bbdP"Y8   `"YbbdP"Y8   `"Ybbd8"'  
                                                                              aa,    ,88              
                                                                               "Y8bbdP"               
																			   
]]


function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
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

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
setupTextWindow(1700, 1150)

 -- TABLE CONFIGURED FOR 1440p Monitor currently!!!
    state.Buff['Burst Affinity'] = buffactive['Burst Affinity'] or false
    state.Buff['Chain Affinity'] = buffactive['Chain Affinity'] or false
    state.Buff.Convergence = buffactive.Convergence or false
    state.Buff.Diffusion = buffactive.Diffusion or false
    state.Buff.Efflux = buffactive.Efflux or false
	--used for table tracking
	state.Moving = M('false', 'true')

	-- ensure WeaponLockMode exists before any early calls
	state.WeaponLockMode = state.WeaponLockMode or M('Unlocked','Locked')
	-- make sure this exists BEFORE any prerender runs
	state.EngagedMoving = state.EngagedMoving or M('Disabled','Enabled')


	
    include('Mote-TreasureHunter')
	
	
    state.Buff['Unbridled Learning'] = buffactive['Unbridled Learning'] or false


    blue_magic_maps = {}
    
    -- Mappings for gear sets to use for various blue magic spells.
    -- While Str isn't listed for each, it's generally assumed as being at least
    -- moderately signficant, even for spells with other mods.
    
    -- Physical Spells --
    
    -- Physical spells with no particular (or known) stat mods
    blue_magic_maps.Physical = S{
        'Bilgestorm'
    }

    -- Spells with heavy accuracy penalties, that need to prioritize accuracy first.
    blue_magic_maps.PhysicalAcc = S{
        'Heavy Strike',
    }

    -- Physical spells with Str stat mod
    blue_magic_maps.PhysicalStr = S{
        'Battle Dance','Bloodrake','Death Scissors','Dimensional Death',
        'Empty Thrash','Quadrastrike','Sinker Drill','Spinal Cleave',
        'Uppercut','Vertical Cleave'
    }
        
    -- Physical spells with Dex stat mod
    blue_magic_maps.PhysicalDex = S{
        'Amorphic Spikes','Asuran Claws','Barbed Crescent','Claw Cyclone','Disseverment',
        'Foot Kick','Frenetic Rip','Goblin Rush','Hysteric Barrage','Paralyzing Triad',
        'Seedspray','Sickle Slash','Smite of Rage','Terror Touch','Thrashing Assault',
        'Vanity Dive'
    }
        
    -- Physical spells with Vit stat mod
    blue_magic_maps.PhysicalVit = S{
        'Body Slam','Cannonball','Delta Thrust','Glutinous Dart','Grand Slam',
        'Power Attack','Quad. Continuum','Sprout Smack','Saurian Slide','Sweeping Gouge','Sub-zero Smash'
    }
        
    -- Physical spells with Agi stat mod
    blue_magic_maps.PhysicalAgi = S{
        'Benthic Typhoon','Feather Storm','Helldive','Hydro Shot','Jet Stream',
        'Pinecone Bomb','Spiral Spin','Wild Oats'
    }

    -- Physical spells with Int stat mod
    blue_magic_maps.PhysicalInt = S{
        'Mandibular Bite','Queasyshroom'
    }

    -- Physical spells with Mnd stat mod
    blue_magic_maps.PhysicalMnd = S{
        'Ram Charge','Screwdriver','Tourbillion'
    }

    -- Physical spells with Chr stat mod
    blue_magic_maps.PhysicalChr = S{
        'Bludgeon'
    }

    -- Physical spells with HP stat mod
    blue_magic_maps.PhysicalHP = S{
        'Final Sting'
    }

    -- Magical Spells --

    -- Magical spells with the typical Int mod
    blue_magic_maps.Magical = S{
        'Blastbomb','Blazing Bound','Bomb Toss','Cursed Sphere','Dark Orb','Death Ray',
        'Diffusion Ray','Droning Whirlwind','Firespit','Foul Waters',
        'Ice Break','Leafstorm','Maelstrom','Rail Cannon','Rending Deluge',
        'Retinal Glare','Subduction','Tem. Upheaval','Water Bomb'
    }

	--Tenebral Crush
	blue_magic_maps.TenebralCrush = S{'Tenebral Crush'}
	
    -- Magical spells with a primary Mnd mod
    blue_magic_maps.MagicalMnd = S{
        'Acrid Stream','Evryone. Grudge','Nectarous Deluge','Magic Hammer','Mind Blast','Scouring Spate'
    }

    -- Magical spells with a primary Chr mod
    blue_magic_maps.MagicalChr = S{
        'Eyes On Me','Mysterious Light'
    }

    -- Magical spells with a Vit stat mod (on top of Int)
    blue_magic_maps.MagicalVit = S{
        'Atra. Libations','Thermal Pulse'
    }

	--Magical spells with a AGI Stat Mod.
	blue_magic_maps.MagicalAgi = S{
        'Molting Plumage','Palling Salvo','Silent Storm'
    }
	
	--Magical spells with a STR Stat Mod.
	blue_magic_maps.MagicalStr = S{
        'Blinding Fulgor','Searing Tempest'
    }
	
	blue_magic_maps.MagicalInt = S{'Spectral Floe'}
	
    -- Magical spells with a Dex stat mod (on top of Int)
    blue_magic_maps.MagicalDex = S{
        'Anvil Lightning','Charged Whisker','Gates of Hades'
    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
        '1000 Needles','Absolute Terror','Actinic Burst','Auroral Drape','Awful Eye',
        'Blank Gaze','Blistering Roar','Blood Drain','Blood Saber','Chaotic Eye',
        'Cimicine Discharge','Cold Wave','Corrosive Ooze','Demoralizing Roar','Digest',
        'Dream Flower','Enervation','Feather Tickle','Filamented Hold','Frightful Roar',
        'Geist Wall','Hecatomb Wave','Infrasonics','Jettatura','Light of Penance',
        'Lowing','Mind Blast','Mortal Ray','MP Drainkiss','Osmosis','Reaving Wind',
        'Sandspin','Sandspray','Sheep Song','Soporific','Sound Blast','Stinking Gas',
        'Sub-zero Smash','Venom Shell','Voracious Trunk','Yawn','Regurgitation','Embalming Earth','Cruel Joke','Entomb'
    }
        
    -- Breath-based spells
    blue_magic_maps.Breath = S{
        'Bad Breath','Flying Hip Press','Frost Breath','Heat Breath',
        'Hecatomb Wave','Magnetite Cloud','Poison Breath','Radiant Breath','Self-Destruct',
        'Thunder Breath','Vapor Spray','Wind Breath'
    }

    -- Stun spells
    blue_magic_maps.Stun = S{
        'Blitzstrahl','Frypan','Head Butt','Sudden Lunge','Tail slap','Temporal Shift',
        'Thunderbolt','Whirl of Rage'
    }
        
    -- Healing spells
    blue_magic_maps.Healing = S{
        'Healing Breeze','Magic Fruit','Plenilune Embrace','Pollen','Restoral','White Wind',
        'Wild Carrot'
    }
    
    -- Buffs that depend on blue magic skill
    blue_magic_maps.SkillBasedBuff = S{
        'Barrier Tusk','Diamondhide','Magic Barrier','Mighty Guard','Metallic Body','Plasma Charge',
        'Pyric Bulwark','Reactor Cool',
    }

    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Amplification','Animating Wail','Battery Charge','Carcharian Verve','Cocoon',
        'Erratic Flutter','Exuviation','Fantod','Feather Barrier','Harden Shell',
        'Memento Mori','Mighty Guard','Nat. Meditation','Occultation','Orcish Counterstance','Refueling',
        'Regeneration','Saline Coat','Triumphant Roar','Warm-Up','Winds of Promyvion',
        'Zephyr Mantle'
    }
    
    
    -- Spells that require Unbridled Learning to cast.
    unbridled_spells = S{
        'Absolute Terror','Bilgestorm','Blistering Roar','Bloodrake','Carcharian Verve','Cesspool',
        'Crashing Thunder','Droning Whirlwind','Gates of Hades','Harden Shell','Mighty Guard','Polar Roar',
        'Pyric Bulwark','Tearing Gust','Thunderbolt','Tourbillion','Uproot'
    }
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

--====================================================--
--	                                                  --
--	.   .                   ,---.     |               --
--	|   |,---.,---.,---.    `---.,---.|--- .   .,---. --
--	|   |`---.|---'|            ||---'|    |   ||   | --
--	`---'`---'`---'`        `---'`---'`---'`---'|---' --
--	                                            |     --
--                                                    --
--====================================================--

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()


    
	state.OffenseMode:options('Solo', 'Normal', 'Crit', 'Safe', 'DT', 'PDL', 'Tizona', 'Naegling')
	state.DamageMode = M('Unlocked','Tizona', 'Savage', 'Blunt', 'Aeolian','Lv.1 Dagger')
	state.IdleMode:options('PDT', 'Normal', 'Refresh', 'Cleaving')
	state.WeaponskillMode:options('Normal','Capped','High')
	state.WeaponLockMode = M('Unlocked','Locked')
	state.DoomMode = M('OFF', 'Doom')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.EngagedMoving = state.EngagedMoving or M('Disabled','Enabled')

	sets.precast = sets.precast or {}
	sets.precast.WS = sets.precast.WS or {}

	--default starting commands
	send_command('input //gs equip sets.default_melee_weapons;wait 0.2;gs c set WeaponLockMode Locked')
	
    -- Additional local binds
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind f6 gs c cycle DamageMode; gs enable sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f6 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f8 gs c cycle WeaponskillMode')
	send_command('bind f12 gs c set WeaponLockMode Unlocked;wait 0.2;input //gs equip sets.default_melee_weapons;wait 0.2;gs c set WeaponLockMode Locked')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind ^f9 gs c cycle TreasureMode')
	
    select_default_macro_book()



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
 
		send_command('unbind f1')
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
		send_command('unbind f5')
	
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind @`')
		
		send_command('unbind -')
		send_command('unbind =')
		
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





	sets.Unlocked = {}
	
	sets.Tizona = {    
		main="Tizona",
		sub="Thibron",}


	sets.Savage = {    
		main="Naegling",
		sub="Thibron",}


	sets.Blunt = {    
		main="Maxentius",
		sub="Thibron",}

	sets.Aeolian = {    
		main="Tauret",
		sub="Daybreak",}
		
	sets.Lv1Dagger = {    
		main="Ceremonial Dagger",
		sub="Ceremonial Dagger",}
	




    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    sets.buff['Burst Affinity'] = {feet="Hashi. Basmak +2",back="Cornflower Cape",ring2="Mujin Band"}
    sets.buff['Chain Affinity'] = {}
    sets.buff.Convergence = {}
    sets.buff.Diffusion = {feet="Luhlaza Charuqs +1"}
    sets.buff.Enchainment = {}
    sets.buff.Efflux = {}

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--

    sets.precast.JA['Azure Lore'] = {}

	sets.precast.JA['Provoke'] = {}

	sets.enmity = {}
	
    sets.precast.Waltz = {}
        
    sets.precast.Waltz['Healing Waltz'] = {}
	
	sets.precast.Step = {}
    
	
    sets.precast.FC = {
    main="Tizona",
    sub="Thibron",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body="Pinga Tunic",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Pinga Pants",
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Plat. Mog. Belt",
    left_ear="Loquac. Earring",
    right_ear="Alabaster Earring",
    left_ring="Shadow Ring",
    right_ring="Kishar Ring",
    back="Fi Follet Cape +1",
}
        
    sets.precast.FC['Blue Magic'] = set_combine(sets.precast.FC, 
	{})
   
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
   

   
   
--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--                                                                               --
--===============================================================================--



   
    sets.precast.WS = {
		ammo="Falcon Eye",
		head="Hashishin Kavuk +3",
		neck="Fotia gorget",
		ear1="Moonshade earring",
		ear2="Brutal earring",
		body="Abnoba Kaftan",
		hands={ name="Herculean Gloves", augments={'Accuracy+6','Crit. hit damage +5%','STR+6','Attack+15',}},
		ring1="Epona's ring",ring2="Begrudging Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},
		waist="Fotia Belt",
		legs={ name="Herculean Trousers", augments={'Accuracy+25 Attack+25','Crit. hit damage +4%','AGI+7',}},
		feet="Thereoid Greaves"}

    sets.precast.WS['Requiescat'] = {
		ammo="Mantoptera Eye",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +25',}},
		right_ear="Cessance Earring",
		left_ring="Begrudging Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}

	sets.precast.WS['Expiacion'] =  {
    main="Tizona",
    ammo="Coiste Bodhar",
    head="Hashishin Kavuk +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	
	
	
	sets.precast.WS['Expiacion'].High = {
    main="Tizona",
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	
	sets.precast.WS['Expiacion'].Capped = {
    main="Tizona",
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

    sets.precast.WS['Savage Blade'] = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Oshasha's Treatise",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

	sets.precast.WS['Savage Blade'].Capped = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Oshasha's Treatise",
    head="Hashishin Kavuk +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}

	sets.precast.WS['Savage Blade'].High = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Oshasha's Treatise",
    head="Hashishin Kavuk +3",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS['Chant du Cygne'] = {ammo="Aurgelmir Orb",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Gleti's Gauntlets",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Gleti's Boots",
    neck="Mirage Stole +2",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}},
}
		
		
	
		
		
	
	sets.precast.WS['Vorpal Blade'] = {
		ammo="Falcon Eye",
		head="Malignance Chapeau",
		body="Abnoba Kaftan",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet={ name="Herculean Boots", augments={'Accuracy+23 Attack+23','"Triple Atk."+4','DEX+7','Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Brutal Earring",
		left_ring="Ilabrat Ring",
		right_ring="Begrudging Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}
	
    sets.precast.WS['Sanguine Blade'] = {ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Pixie Hairpin +1",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Jhakri Cuffs +2",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Archon Ring",
    right_ring="Epaminondas's Ring",
    back="Seshaw Cape",
}
    
	
	--[[Club Weaponskill]]
	

	sets.precast.WS['Realmrazer'] = {
		ammo="Mantoptera Eye",
		head="Jhakri Coronal +2",
		body="Jhakri Robe +2",
		hands="Jhakri Cuffs +2",
		legs="Jhakri Slops +2",
		feet="Jhakri Pigaches +2",
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +25',}},
		right_ear="Cessance Earring",
		left_ring="Begrudging Ring",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},}
    
	sets.precast.WS['Black Halo'] = {
    main="Maxentius",
    sub="Thibron",
    ammo="Crepuscular Pebble",
    head="Hashishin Kavuk +3",
    body="Assim. Jubbah +4",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Regal Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Rosmerta's Cape", augments={'STR+13','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS['Flash Nova'] = {
		main="Kaja Rod",
		sub="Kaja Sword",
		ammo="Mantoptera Eye",
		head={ name="Herculean Helm", augments={'Pet: INT+2','"Mag.Atk.Bns."+25','Chance of successful block +6','Accuracy+2 Attack+2','Mag. Acc.+20 "Mag.Atk.Bns."+20',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Jhakri Cuffs +2",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Jhakri Pigaches +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	sets.precast.WS['True Strike'] = {
		ammo="Mantoptera Eye",
		head={ name="Herculean Helm", augments={'Attack+23','Weapon skill damage +4%','STR+10',}},
		body="Assimilator's Jubbah +3",
		hands="Jhakri Cuffs +2",
		legs={ name="Herculean Trousers", augments={'Weapon skill damage +5%','STR+8','Accuracy+8','Attack+10',}},
		feet={ name="Herculean Boots", augments={'Accuracy+28','Weapon skill damage +5%','VIT+8','Attack+4',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +25',}},
		right_ear="Ishvara Earring",
		left_ring="Karieyh Ring +1",
		right_ring="Rufescent Ring",
		back={ name="Rosmerta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
	
	
--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--


    sets.midcast['Blue Magic'] = {
	main={ name="Tizona", augments={'Path: A',}},
    sub="Kaja Rod",
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
    waist="Skrymir Cord",
    left_ear="Hermetic Earring",
    right_ear="Hecate's Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Seshaw Cape",
}

    
    --[[PHYSICAL SPELLS]]
    

	
    sets.midcast['Blue Magic'].Physical = {
	main={ name="Tizona", augments={'Path: A',}},
    sub="Kaja Rod",
    ammo="Pemphredo Tathlum",
    head="Nyame Helm",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck="Mirage Stole +2",
    waist="Skrymir Cord",
    left_ear="Hermetic Earring",
    right_ear="Hecate's Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Seshaw Cape",
}



    sets.midcast['Blue Magic'].PhysicalStr = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalDex = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalVit = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalAgi = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalInt = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalMnd = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalChr = set_combine(sets.midcast['Blue Magic'].Physical,
        {})

    sets.midcast['Blue Magic'].PhysicalHP = set_combine(sets.midcast['Blue Magic'].Physical, 
		{})


	--[[MAGICAL SPELLS]]
    
    sets.midcast['Blue Magic'].Magical = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hashishin Tayt +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Seshaw Cape",
}

	sets.midcast['Blue Magic'].MagicalInt = set_combine(sets.midcast['Blue Magic'].Magical, {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Hashishin Tayt +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Orpheus's Sash",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Shiva Ring +1",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back="Seshaw Cape",
})
	
    sets.midcast['Blue Magic'].MagicalMnd = set_combine(sets.midcast['Blue Magic'].Magical,
        {})

    sets.midcast['Blue Magic'].MagicalChr = set_combine(sets.midcast['Blue Magic'].Magical, 
		{})

    sets.midcast['Blue Magic'].MagicalVit = set_combine(sets.midcast['Blue Magic'].Magical,
        {})

	sets.midcast['Blue Magic'].MagicalAgi = set_combine(sets.midcast['Blue Magic'].Magical,
        {})
	
	sets.midcast['Blue Magic'].MagicalStr = set_combine(sets.midcast['Blue Magic'].Magical,
        {})
	
    sets.midcast['Blue Magic'].MagicalDex = set_combine(sets.midcast['Blue Magic'].Magical, 
		{})
	
	sets.midcast['Blue Magic'].TenebralCrush = {
    main="Tizona",
    sub="Thibron",
    ammo="Pemphredo Tathlum",
    head="Pixie Hairpin +1",
    body="Hashishin Mintan +3",
    hands="Malignance Gloves",
    legs="Hashishin Tayt +3",
    feet="Malignance Boots",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Friomisi Earring",
    right_ear="Regal Earring",
    left_ring="Archon Ring",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}


sets.midcast['Blue Magic'].Subduction = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Per. Lucky Egg",
    head={ name="Herculean Helm", augments={'VIT+3','Pet: DEX+8','"Treasure Hunter"+1','Accuracy+9 Attack+9','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    body="Hashishin Mintan +3",
    hands={ name="Herculean Gloves", augments={'AGI+7','Mag. Acc.+28','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    legs="Hashishin Tayt +3",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Regal Earring",
    right_ear="Friomisi Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Seshaw Cape",
}
		
    sets.midcast['Blue Magic'].MagicAccuracy = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Pemphredo Tathlum",
    head="Hashishin Kavuk +3",
    body="Hashishin Mintan +3",
    hands="Malignance Gloves",
    legs="Hashishin Tayt +3",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Hermetic Earring",
    right_ear="Crep. Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
    
    sets.midcast['Blue Magic'].Breath = {    
		main={ name="Tizona", augments={'Path: A',}},
		sub="Sakpata's Sword",
		ammo="Pemphredo Tathlum",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands="Malignance Gloves",
		legs="Jhakri Slops +2",
		feet="Malignance Boots",
		neck="Mirage Stole +2",
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Digni. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Cornflower Cape", augments={'MP+16','DEX+1','Blue Magic skill +9',}},}

    
    sets.midcast['Blue Magic'].Stun = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Per. Lucky Egg",
    head={ name="Herculean Helm", augments={'VIT+3','Pet: DEX+8','"Treasure Hunter"+1','Accuracy+9 Attack+9','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    body="Hashishin Mintan +3",
    hands={ name="Herculean Gloves", augments={'AGI+7','Mag. Acc.+28','"Treasure Hunter"+1','Accuracy+8 Attack+8','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    legs="Hashishin Tayt +3",
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Chaac Belt",
    left_ear="Regal Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
        
    sets.midcast['Blue Magic']['White Wind'] = {
    main="Tizona",
    ammo="Staunch Tathlum +1",
    head="Sworn Crown",
    body="Pinga Tunic",
    hands="Nyame Gauntlets",
    legs="Pinga Pants",
    feet="Nyame Sollerets",
    neck="Voltsurge Torque",
    waist="Plat. Mog. Belt",
    left_ear="Tuisto Earring",
    right_ear="Alabaster Earring",
    left_ring="Shadow Ring",
    right_ring="Murky Ring",
    back="Solemnity Cape",
}

    sets.midcast['Blue Magic'].Healing = {
    main="Tizona",
    sub="Thibron",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Pinga Tunic",
    hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
    legs="Pinga Pants",
    feet={ name="Medium's Sabots", augments={'MP+40','MND+6','"Conserve MP"+5','"Cure" potency +3%',}},
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Tuisto Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}

    sets.midcast['Blue Magic'].SkillBasedBuff = {
		ammo="Mavi Tathlum",
		head="Carmine Mask +1",
		body="Assim. Jubbah +4",
		hands={ name="Rawhide Gloves", augments={'DEX+10','STR+7','INT+7',}},
		legs="Aya. Cosciales +1",
		feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
		neck="Incanter's Torque",
		waist="Kentarch Belt +1",
		left_ear="Digni. Earring",
		right_ear="Zennaroi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Cornflower Cape", augments={'MP+16','DEX+1','Blue Magic skill +9',}},}

    sets.midcast['Blue Magic'].Buff = {
		ammo="Mavi Tathlum",
		head="Carmine Mask +1",
		body="Assim. Jubbah +4",
		hands={ name="Rawhide Gloves", augments={'DEX+10','STR+7','INT+7',}},
		legs="Aya. Cosciales +1",
		feet={ name="Luhlaza Charuqs +1", augments={'Enhances "Diffusion" effect',}},
		neck="Incanter's Torque",
		waist="Kentarch Belt +1",
		left_ear="Digni. Earring",
		right_ear="Zennaroi Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Cornflower Cape", augments={'MP+16','DEX+1','Blue Magic skill +9',}},}
    

   
	sets.midcast['Phalanx'] = {    
		main={ name="Tizona", augments={'Path: A',}},
		sub="Sakpata's Sword",
		ammo="Staunch Tathlum +1",
		head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%','Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'Accuracy+19 Attack+19','Spell interruption rate down -10%','Phalanx +3',}},
		hands={ name="Herculean Gloves", augments={'MND+4','VIT+13','Phalanx +5','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
		legs={ name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
		feet={ name="Herculean Boots", augments={'VIT+10','Pet: "Store TP"+2','Phalanx +4',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}},}



--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--                                 --
--=================================--
    

    sets.idle = {main="Tizona",
    sub="Sakpata's Sword",
    ammo="Crepuscular Pebble",
    head="Null Masque",
    body="Assim. Jubbah +4",
    hands="Nyame Gauntlets",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Flume Belt",
    left_ear="Hermetic Earring",
    right_ear="Crep. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",}

	sets.idle.Refresh = {
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Hashishin Mintan +3",
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +4%','Weapon Skill Acc.+14','"Refresh"+2',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Shadow Mantle",
}
		
    sets.idle.PDT = {main={ name="Tizona", augments={'Path: A',}},
    sub="Sakpata's Sword",
    ammo="Staunch Tathlum +1",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Shadow Ring",
    right_ring="Defending Ring",
    back="Shadow Mantle",
}

    sets.idle.Cleaving = {main={ name="Tizona", augments={'Path: A',}},
    sub="Sakpata's Sword",
    ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Assim. Jubbah +4",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Static Earring",
    left_ring="Warden's Ring",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}


--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--                                                    --
--====================================================--
    
	sets.default_melee_weapons = {main="Tizona",sub="Thibron",}

    sets.engaged = {
    main="Tizona",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands="Nyame Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.Tizona = {
    main="Tizona",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands="Nyame Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.Naegling = {ammo="Aurgelmir Orb",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Mirage Stole +2",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Dedition Earring",
    right_ear="Suppanomimi",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
	
	sets.engaged.Haste_30 = {
    main="Tizona",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands="Nyame Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
	--Reiki Yotai
	
	
    sets.engaged.Crit = {
		main="Tizona",
		sub="Sequence",
		ammo="Ginsen",
		head="Hashishin Kavuk +3",
		body="Abnoba Kaftan",
		hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
		legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
		feet="Ayanmo Gambieras +2",
		neck="Lissome Necklace",
		waist="Reiki Yotai",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Begrudging Ring",
		back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10',}},}

	sets.engaged.Solo ={
    main={ name="Tizona", augments={'Path: A',}},
    sub={ name="Thibron", augments={'TP Bonus +1000',}},
    ammo="Aurgelmir Orb",
    head="Malignance Chapeau",
    body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    hands="Malignance Gloves",
    legs={ name="Gleti's Breeches", augments={'Path: A',}},
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Kentarch Belt",
    left_ear="Alabaster Earring",
    right_ear="Telos Earring",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10',}},
}
		
	sets.engaged.Safe = {
    main="Tizona",
    sub="Thibron",
    ammo="Aurgelmir Orb",
    head="Null Masque",
    body="Adamantite Armor",
    hands="Malignance Gloves",
    legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
    feet="Malignance Boots",
    neck="Null Loop",
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Suppanomimi",
    left_ring="Shadow Ring",
    right_ring="Epona's Ring",
    back="Null Shawl",
}
		
	sets.engaged.DT = {
    main="Tizona",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Gleti's Cuirass",
    hands="Nyame Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}


sets.engaged.PDL = {
    main={ name="Tizona", augments={'Path: A',}},
    sub="Sakpata's Sword",
    ammo="Crepuscular Pebble",
    head="Gleti's Mask",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck="Ainia Collar",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
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

	sets.TreasureHunter = {    
		legs={ name="Herculean Trousers", augments={'MND+5','Accuracy+7','"Treasure Hunter"+1','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		waist="Chaac Belt",
		ammo="Perfect Lucky Egg",}

	sets.MaxTP = {ear2="Cessance Earring"}

	sets.Adoulin = {body="Councilor's Garb",}
	
	sets.MoveSpeed = {legs="Carmine Cuisses +1"} 

	sets.latent_refresh = {waist="Fucho-no-obi"}

	sets.engaged.Aftermath3 = {
    main="Tizona",
    ammo="Aurgelmir Orb",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}

	sets.engaged.AM3HasteCap = {
    main="Tizona",
    ammo="Aurgelmir Orb",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Mirage Stole +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Petrov Ring",
    right_ring="Epona's Ring",
    back={ name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}},
}
	
    sets.self_healing = set_combine(sets.midcast['Blue Magic'].Healing, {
		main="Tamaxchi",
		sub="Bolelabunga",
		ammo="Staunch Tathlum +1",
		head="Nyame Helm",
		body="Pinga Tunic",
		hands={ name="Telchine Gloves", augments={'"Fast Cast"+2','Enh. Mag. eff. dur. +10',}},
		legs="Pinga Pants",
		feet="Medium's Sabots",
		neck="Loricate Torque +1",
		waist="Gishdubar Sash",
		left_ear="Digni. Earring",
		right_ear="Mendicant's Earring",
		left_ring="Defending Ring",
		right_ring="Dark Ring",
		back="Solemnity Cape",})
		

	sets.Doom = {waist="Gishdubar Sash",right_ring="Purity Ring",left_ring="Saida Ring"}
	
end


--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--                                                                      --
--======================================================================--



mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    if not (state and state.EngagedMoving) then return end
    mov.counter = mov.counter + 1;
    if mov.counter> 21 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x and state.EngagedMoving.value == 'Disabled' then
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
					
						send_command('gs equip sets.MoveSpeed')
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
        elseif pl and pl.x and mov.x and state.EngagedMoving.value == 'Enabled' then
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

-- Set eventArgs.handled to true if we don't want the automatic display to be run.

function display_current_job_state(eventArgs)
    local msg = ""

    handle_equipping_gear(player.status)

    add_to_chat(122, msg)
    eventArgs.handled = true
end

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

--=================================================================--
--  _____                          _     _                         --
-- |  ___|  _   _   _ __     ___  | |_  (_)   ___    _ __    ___   --
-- | |_    | | | | | '_ \   / __| | __| | |  / _ \  | '_ \  / __|  --
-- |  _|   | |_| | | | | | | (__  | |_  | | | (_) | | | | | \__ \  --
-- |_|      \__,_| |_| |_|  \___|  \__| |_|  \___/  |_| |_| |___/  --
--                                                                 --
--=================================================================--


function job_precast(spell, action, spellMap, eventArgs)

    if unbridled_spells:contains(spell.english) and not state.Buff['Unbridled Learning'] then
        eventArgs.cancel = true
        windower.send_command('@input /ja "Unbridled Learning" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
    end
	
end




function job_post_precast(spell, action, spellMap, eventArgs)

	if player.tp > 2750 then
		equip(sets.MaxTP)	
	end
	
	if spell.skill == 'Blue Magic' then
		equip(set_combine(sets.precast.FC['Blue Magic'], sets.precast.FC['Blue Magic']))
	end
	
	if spell.english == 'Stoneskin' and buffactive['Stoneskin'] then
		cancel_buff()
	end
	
end




function job_post_midcast(spell, action, spellMap, eventArgs)

    if spell.skill == 'Blue Magic' then
        for buff,active in pairs(state.Buff) do
            if active and sets.buff[buff] then
                equip(sets.buff[buff])
            end
        end
		
		if spellMap == 'Healing' and spell.target.type == 'SELF' then
            equip(sets.self_healing)
		end
	
    end
	
	if spell.skill == 'Blue Magic'  then
        if spell.element == world.day_element or spell.element == world.weather_element then
            equip({waist="Hachirin-No-Obi"})

        end
    end

end





function job_aftercast(spell, action, spellMap, eventArgs)

	if state.DoomMode.value == 'Doom' then
		send_command('input /party IS STILL DOOMED! AM SCAREBOYE PLES HALP!! <scall15>')
	end

	if not spell.interrupted then
       if spell.english == "Dream Flower" then -- Sleep Countdown --
            send_command('wait 60;input /echo DREAM FLOWER: [WEARING OFF IN 30 SEC.];wait 15;input /echo DREAM FLOWER: [WEARING OFF IN 15 SEC.];wait 10;input /echo DREAM FLOWER: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Entomb" then -- Petrify Countdown --
            send_command('wait 30;input /echo ENTOMB: [WEARING OFF IN 30 SEC.];wait 15;input /echo ENTOMB: [WEARING OFF IN 15 SEC.];wait 10;input /echo ENTOMB: [WEARING OFF IN 5 SEC.]')        
        elseif spell.english == "Tenebral Crush" then -- Defense Down Countdown --
			send_command('wait 30;input /echo Defense Down wearing off (maybe?) in [30 seconds];wait 15;input /echo Defense Down wearing off (maybe?) [15 seconds];wait 10;input /echo Defense Down wearing off (maybe?) [5 seconds]')
		elseif spell.english == "Nat. Meditation" then -- Attack up Countdown Countdown --
			send_command('wait 60;input /echo Nat. Meditation RECAST!!! [30 Sec.];wait 15;input /echo Nat. Meditation RECAST!!! [15 Sec.];wait 10;input /echo Nat. Meditation RECAST!!! [5 Sec.]')	
		end
    end
	
end




function customize_idle_set(idleSet)

    if player.mpp < 51 then
        set_combine(idleSet, sets.latent_refresh)
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
	
	if buffactive['doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
    end
	
	if state.DamageMode.value == 'Unlocked' then
		idleSet = set_combine(idleSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Tizona' then
		idleSet = set_combine(idleSet, sets.Tizona)
	elseif state.DamageMode.value == 'Savage' then
		idleSet = set_combine(idleSet, sets.Savage)
	elseif state.DamageMode.value == 'Blunt' then
		idleSet = set_combine(idleSet, sets.Blunt)
	elseif state.DamageMode.value == 'Aeolian' then
		idleSet = set_combine(idleSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		idleSet = set_combine(idleSet, sets.Lv1Dagger)
		return idleSet
	end

	
	
	
    return idleSet
	
end



function customize_melee_set(meleeSet)
    -- Start from the OffenseMode variant (if it exists)

    -- Your existing overlays (AM3/Haste, ZoneRing, Doom, etc.) can follow:
    -- [leave your current logic here]
   

	if player.equipment.main == 'Tizona' and (buffactive['Aftermath: Lv.3'] and (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard'])) and (state.OffenseMode.value ~= 'Safe' and state.OffenseMode.value ~= 'DT') then
		meleeSet = set_combine(meleeSet, sets.engaged.Aftermath3, sets.engaged.AM3HasteCap)
	elseif player.equipment.main == 'Tizona' and buffactive['Aftermath: Lv.3'] and not (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) and (state.OffenseMode.value ~= 'Safe' and state.OffenseMode.value ~= 'DT') then
		meleeSet = set_combine(meleeSet, sets.engaged.Aftermath3)
	end

    if not ((buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) and 
		(state.OffenseMode.value == 'Normal' or state.OffenseMode.value == 'Crit' or state.OffenseMode.value == 'Solo')) and not (state.OffenseMode.value ~= 'Safe' or state.OffenseMode.value ~= 'DT') then
        meleeSet = set_combine(meleeSet, sets.engaged.Haste_30)
	end
	
	
	if state.ZoneRing.value == 'Warp' then
		meleeSet = set_combine(meleeSet, {right_ring="Warp Ring"})
	elseif state.ZoneRing.value == 'Holla' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Holla)"})
	elseif state.ZoneRing.value == 'Dem' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Dem)"})
	elseif state.ZoneRing.value == 'Mea' then
		meleeSet = set_combine(meleeSet, {right_ring="Dimensional ring (Mea)"})	
		return meleeSets
	end
	
	if buffactive['doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
		
    end

	if state.DamageMode.value == 'Unlocked' then
		meleeSet = set_combine(meleeSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Tizona' then
		meleeSet = set_combine(meleeSet, sets.Tizona)
	elseif state.DamageMode.value == 'Savage' then
		meleeSet = set_combine(meleeSet, sets.Savage)
	elseif state.DamageMode.value == 'Blunt' then
		meleeSet = set_combine(meleeSet, sets.Blunt)
	elseif state.DamageMode.value == 'Aeolian' then
		meleeSet = set_combine(meleeSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		meleeSet = set_combine(meleeSet, sets.Lv1Dagger)
	end

    return meleeSet

end



function job_buff_change(buff, gain)

	if (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end
	
	if buff == "doom" and gain then
			send_command('gs c set DoomMode Doom')
	elseif buff == "doom" and not gain then
			send_command('gs c set DoomMode OFF')
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
	
    -- Force engaged set swap when Offense Mode changes
    if stateField == 'Offense Mode' and player.status == 'Engaged' then
        local mode = state.OffenseMode.value
        if sets.engaged[mode] then
            equip(sets.engaged[mode])
        else
    
        end
        return
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
	
end


windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
	end
	
end)
	

	
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == 'Blue Magic' then
        for category,spell_list in pairs(blue_magic_maps) do
            if spell_list:contains(spell.english) then
                return category
            end
        end
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
    windower.text.set_font(tb_name, "Consolas")
    windower.text.set_font_size(tb_name, 12)
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

		textinbox = textinbox .. textColor .. "(F8) Equip & Lock Weapons" .. textColorNewLine
		
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in
		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
		textinbox = textinbox .. "\\cs(255, 255, 70)" .. "Damage Mode (F6) : " .. "\\cs(100, 255, 100)" .. tostring(state.DamageMode.current) .. "\\cr \n"
		textinbox = textinbox .. textColor .. "WS Mode (F8) : " .. tostring(state.WeaponskillMode.current) .. textColorNewLine
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "TreasureMode (CTRL+F9) : " .. tostring(state.TreasureMode.value) .. textColorNewLine
        textinbox = textinbox .. textColor .. "WeaponLockMode (F12) : " .. tostring(state.WeaponLockMode.value) .. textColorNewLine
       
		
		if state.ZoneRing.current == 'Warp' then
			textinbox = textinbox .. "Zone Ring (F5) : " .. "\\cs(255, 75, 255)" .. tostring(state.ZoneRing.current) .. textColorNewLine
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
			textinbox = textinbox .. textColor .. "Engaged Movespeed (F1) : " .. tostring(state.EngagedMoving.current) .. textColorNewLine

		if state.DoomMode.value == 'Doom' then
			textinbox = textinbox .. "\\cs(255, 75, 255)" .. "~~~~~~DOOOOOOOOM~~~~~~" .. textColorNewLine
		end	
			
    -- end

    --textinbox = textinbox .. drawTitle("  Options  ")

    --This takes a true and false value and will either display ON or OFF on the window instead of true or false
    --state.LockWeapon = M(false, "Lock Weapon") would be placed in user_setup()
    --textinbox = textinbox .. textColor .. "Lock Pet DT Set: " .. ternary(state.LockPetDT.value, "ON", "OFF") .. textColorNewLine
    --textinbox = textinbox .. textColor .. "Lock Weapon: " .. ternary(state.LockWeapon.value, "ON", "OFF") .. textColorNewLine

    windower.text.set_text(tb_name, textinbox)
end


--Creates the Title for a section in the Text Screen
function drawTitle(title)
    return "\\cs(200, 222, 255)" .. pad(tostring(title), 6, "*") .. "\\cr \n"
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

--this will disable all add_to_chat, reccomend using Echos.  Alternatively, you can disable this.
function add_to_chat(command)
	if handle_unset and command == 'add_to_chat' then
	end
end

--=-----------------------------=--
--          __   __   __   __    --
--    /|/| /  | /    /  | /  |   --
--   ( / |(___|(    (___|(   |   --
--   |   )|   )|   )|\   |   )   --
--   |  / |  / |__/ | \  |__/    --
--=-----------------------------=--


    -- Default macro set/book
	







