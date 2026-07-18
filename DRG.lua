-------------------------------------------------------------------------------------------------------------------
-- Initialization function that defines sets and variables to be used.
-------------------------------------------------------------------------------------------------------------------

-- IMPORTANT: Make sure to also get the Mote-Include.lua file (and its supplementary files) to go with this.

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
	-- Load and initialize the include file.
	include('Mote-Include.lua')
	include('organizer-lib')
end

--================================================--
--                                                --
--      |     |        ,---.     |                --
--      |,---.|---.    `---.,---.|--- .   .,---.  --
--      ||   ||   |        ||---'|    |   ||   |  --
--  `---'`---'`---'    `---'`---'`---'`---'|---'  --
--                                         |      --
--================================================--

function job_setup()
setupTextWindow(1700, 1150)

end


function user_setup()
	state.IdleMode:options('Town','Normal','DT','Emergency')
	state.OffenseMode:options('Normal','XHit','STP','DT', 'Crit','PetDT', 'Emergency','Fencer','Arke', 'Xeviosov25')
	state.DamageMode = M('Unlocked','Prime','Naegling','ShiningOne','Trishula')
	state.WeaponskillMode:options('Normal','WSD','PDL', 'Enmity', 'Fotia')
    state.WeaponLockMode = M('Unlocked', 'Locked')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.HippoMode = M('Off', 'On')
	state.SCMode = M('Normal','Skillchain')
	state.EngagedMoving = M('Disabled','Enabled')
	state.DoomMode = M('OFF', 'Doom')
	state.SubtleBlow = M('On', 'Off')
	state.Following = M('Follow','Stay')
    state.Moving = M('false', 'true')
	state.HassoMode = M('Off', 'On')
	state.EmergencyMode = M('Off', 'On')
	
	
	send_command('bind ^f7 gs c cycle SubtleBlow')
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f6 gs c cycle DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f6 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind insert gs c cycle HassoMode')
	send_command('bind f8 gs c cycle WeaponskillMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind ^insert gs c cycle EmergencyMode')
	send_command('bind f7 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind !f8 gs c cycle SCMode')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^` input /impact <stnpc>')

	
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



-- Define sets and vars used by this job file.
function init_gear_sets()


	sets.precast.JA.Angon = {ammo="Angon",}
  

    sets.Organizer = {
	item="",
	item="",
	item="",
	item="",
	item="",
	item="",
	item="",
	item="",}
	
--[[ So honestly JR, you can put any items you want to make sure you don't leave home without here if you want to use organizer; if not it's w/e.
Organizer tends to throw all of your stuff around between your inventory and safe/locker haphazardly, so I dont use it, but on the plus side, it DOES 
ensure you never leave home without the items in the set. ]]
  
  sets.Unlocked = {}
	
  sets.Prime = {    
	main="Gae Buide",
	sub="Utu Grip"}
	
   sets.Naegling = {
   main="Naegling",
   sub=""}
	
   sets.ShiningOne = {
   main="Shining One",
   sub="Utu Grip"}

	sets.Trishula = {    
	main="Trishula",
	sub="Utu Grip"}


	sets.precast.JA.Jump ={
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Ptero. Mail +4",
    hands="Vish. Fin. +4",
    legs="Ptero. Brais +4",
    feet="Ostro Greaves",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Telos Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}




	sets.precast.JA['Ancient Circle'] = {
		legs="Vishap Brais +1",
	}

	sets.precast.JA['High Jump'] = set_combine(sets.precast.JA.Jump, {
		legs="Ptero. Brais +4",
    }) 
	sets.precast.JA['Soul Jump'] = set_combine(sets.precast.JA.Jump, {body="Pelt. Plackart +3",
    hands="Gleti's Gauntlets",})
	
	
	

	sets.precast.JA['Spirit Jump'] = set_combine(sets.precast.JA.Jump, {
        legs="Peltast's Cuissots +3",
        feet="Peltlast's Schynbalds +2"
    })
	sets.precast.JA['Super Jump'] = sets.precast.JA.Jump

	sets.precast.JA['Spirit Link'] = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Ptero. Armet +4",
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs="Vishap Brais +1",
    feet="Ptero. Greaves +4",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	sets.precast.JA['Call Wyvern'] = {
        main="Gae Buide",
        right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
        neck="Dragoon's Collar +2",
		body="Pteroslaver Mail +4",
		legs="Vishap brais +1",
        feet="Gleti's Boots",
		
	}
	sets.precast.JA['Deep Breathing'] = {
		head="Pteroslaver Armet +1",
    }
	sets.precast.JA['Spirit Surge'] = {
		body="Pteroslaver Mail +4",
    }
	
	-- Healing Breath sets
	sets.HB = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Ptero. Armet +4",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Vishap Brais +1",
    feet="Ptero. Greaves +4",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--	
	
	
	sets.precast.FC = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Sapience Orb",
    head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
    body={ name="Taeon Tabard", augments={'Accuracy+22','Haste+2','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Enif Cosciales",
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Warden's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

    sets.precast.FC['Blue Magic'] = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Sapience Orb",
    head="Vishap Armet +1",
    body={ name="Taeon Tabard", augments={'Accuracy+22','Haste+2','Phalanx +3',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Enif Cosciales",
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Defending Ring",
    right_ring="Warden's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}


	sets.midcast.Breath = set_combine(sets.midcast.FastRecast, { head="Vishap Armet +1" })

--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--
	
	sets.precast.WS =  {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}



	sets.precast.WS['Stardiver'] =   {
    main="Trishula",
    sub="Utu Grip",
    ammo="Oshasha's Treatise",
    head="Peltast's Mezail +3",
    body={ name="Gleti's Cuirass", augments={'Path: A',}},
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}


	sets.precast.WS['Sonic Thrust'] = {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    sets.precast.WS['Diarmuid'] ={
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS['Diarmuid'].WSD = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Sherida Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}


	sets.precast.WS['Diarmuid'].PDL = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Gleti's Cuirass",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	sets.precast.WS['Diarmuid'].Enmity ={
    main="Gae Buide",
    sub="Khonsu",
    ammo="Hesperiidae",
    head="Gleti's Mask",
    body="Nyame Mail",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Halasz Earring",
    left_ring="Niqmaddu Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS['Diarmuid'].Fotia = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Epaminondas's Ring",
    right_ring="Regal Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

	sets.precast.WS['Stardiver'].WSD = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}

    sets.precast.WS['Stardiver'].PDL= {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Gleti's Cuirass",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	
	--Since default WS set is WSD gear, no point in changing these at this time.
    
   sets.precast.WS["Camlann's Torment"] = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}



	
	
	sets.precast.WS["Drakesbane"] = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Blistering Sallet +1",
    body="Gleti's Cuirass",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Niqmaddu Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	



	sets.precast.WS['Impulse Drive'] = {
        main="Shining One",
        sub="Utu Grip",
        ammo="Knobkierrie",
        head="Peltast's Mezail +3",
        body={ name="Gleti's Cuirass", augments={'Path: A',}},
        hands="Gleti's Gauntlets",
        legs="Gleti's Breeches",
        feet={ name="Nyame Sollerets", augments={'Path: B',}},
        neck={ name="Dgn. Collar +2", augments={'Path: A',}},
        waist={ name="Sailfi Belt +1", augments={'Path: A',}},
        left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
        right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
        left_ring="Epaminondas's Ring",
        right_ring="Ephramad's Ring",
        back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
    }
	
	sets.precast.WS['Impulse Drive'].WSD = {}
	sets.precast.WS['Impulse Drive'].PDL = {}
	



	sets.precast.WS['Leg Sweep'] = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Oshasha's Treatise",
    head="Peltast's Mezail +3",
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs="Pelt. Cuissots +3",
    feet="Pelt. Schyn. +2",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Moonshade Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}


	sets.precast.WS['Savage Blade'] = {
    main="Naegling",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	sets.precast.WS['Savage Blade'].WSD = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Nyame Mail",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}


	sets.precast.WS['Savage Blade'].PLD = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Knobkierrie",
    head="Peltast's Mezail +3",
    body="Pelt. Plackart +3",
    hands="Ptero. Fin. G. +4",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Epaminondas's Ring",
    right_ring="Sroda Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Damage taken-5%',}},
}



	sets.precast.WS['Drakesbane'].Mid = set_combine(sets.precast.WS['Drakesbane'], {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS['Drakesbane'].Mid, {})

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {
        main="Ryunohige",
		sub="Utu Grip",
		ammo="Staunch Tathlum",
		head="Sulevia's Mask +2",
		body="Sulevia's Plate. +2",
		hands="Sulev. Gauntlets +2",
		legs="Sulev. Cuisses +2",
		feet="Wym. Greaves +1",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Ethereal Earring",
		right_ear="Sherida Earring",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Magic dmg. taken -3%','Phys. dmg. taken -5%','Spell interruption rate down -4%',}},
		back="Solemnity Cape",
    }
	
	
sets.Doom = {
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Nicander's Necklace",
		waist="Gishdubar Sash",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Blenmot's Ring +1",
		right_ring="Blenmot's Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}
		
		
sets.SubtleBlow = {}

sets.MoveSpeed = {legs="Carmine Cuisses +1"}
sets.Adoulin = {body="Councilor's Garb",}

sets.Skillchain = {
		ammo="Sroda Tathlum",
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		waist="Orpheus's Sash",
		neck={ name="Warder's Charm +1", augments={'Path: A',}},
		ring1="Mujin Band",}
	
--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--


	sets.idle = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Peltast's Mezail +3",
    body="Adamantite Armor",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Alabaster Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	
	sets.idle.DT = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Peltast's Mezail +3",
    body="Adamantite Armor",
    hands="Pel. Vambraces +3",
    legs="Nyame Flanchard",
    feet="Ptero. Greaves +4",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	--[[This set is to toggle during emergencies when your Wyvern is about to die, it equips Wyvern DT, Absorb damage, and Regen gear to prevent Wyvern death. When the Emergency is over, toggle again and your gear
	will function normally with your toggles]]

	sets.Emergency = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Peltast's Mezail +3",
    body="Vishap Mail +2",
    hands="Pel. Vambraces +3",
    legs="Nyame Flanchard",
    feet="Ptero. Greaves +4",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Sherida Earring",
    right_ear="Alabaster Earring",
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}

	sets.idle.Town = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Staunch Tathlum +1",
    head="Peltast's Mezail +3",
    body="Councilor's Garb",
    hands="Gleti's Gauntlets",
    legs="Pelt. Cuissots +3",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Defending Ring",
    right_ring="Warden's Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Pet: "Regen"+5',}},
}
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

    sets.TreasureHunter = {
		waist="Chaac belt"}
		
    sets.engaged.Normal =  {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Gleti's Cuirass",
    hands="Pel. Vambraces +3",
    legs="Gleti's Breeches",
    feet="Flam. Gambieras +2",
    neck="Vim Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Sroda Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

    sets.engaged.Xeviosov25 = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Peltast's Mezail +3",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Alabaster Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Moonlight Ring",
    right_ring="Shadow Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
}

	sets.engaged.XHit = {
    main="Gae Buide",
    sub="Ultio Grip",
    ammo="Coiste Bodhar",
    head="Gleti's Mask",
    body="Pelt. Plackart +3",
    hands="Pel. Vambraces +3",
    legs="Gleti's Breeches",
    feet="Nyame Sollerets",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Sroda Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back="Null Shawl",
}

	sets.engaged.Arke = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Arke Zuchetto",
    body="Arke Corazza",
    hands="Arke Manopolas",
    legs="Arke Cosciales",
    feet="Arke Gambieras",
    neck="Vim Torque +1",
    waist="Sailfi Belt +1",
    left_ear="Sroda Earring",
    right_ear="Sherida Earring",
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back="Null Shawl",
}

	sets.engaged.STP = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Pelt. Plackart +3",
    hands={ name="Emi. Gauntlets +1", augments={'Accuracy+25','"Dual Wield"+6','Pet: Accuracy+25',}},
    legs="Ptero. Brais +4",
    feet="Nyame Sollerets",
    neck="Vim Torque +1",
    waist="Cornelia's Belt",
    left_ear="Crep. Earring",
    right_ear="Alabaster Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	
	
	sets.engaged.DT = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Hjarrandi Helm",
    body="Gleti's Cuirass",
    hands="Pel. Vambraces +3",
    legs="Ptero. Brais +4",
    feet="Nyame Sollerets",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Sroda Earring",
    left_ring="Moonlight Ring",
    right_ring="Defending Ring",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','"Store TP"+10','Phys. dmg. taken-10%',}},
}
	
	sets.engaged.Crit = {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Gleti's Mask",
    body="Hjarrandi Breast.",
    hands="Gleti's Gauntlets",
    legs="Gleti's Breeches",
    feet="Gleti's Boots",
    neck={ name="Dgn. Collar +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Sroda Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Crit.hit rate+3',}},
    left_ring="Moonlight Ring",
    right_ring="Niqmaddu Ring",
    back="Null Shawl",
}

    sets.engaged.Fencer = {
    main="Naegling",
    sub="Regis",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Hjarrandi Breast.",
    hands="Pel. Vambraces +3",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Vim Torque +1",
    waist="Ioskeha Belt +1",
    left_ear="Sherida Earring",
    right_ear="Sroda Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back="Null Shawl",
}

	sets.SubtleBlow =  {
    main="Gae Buide",
    sub="Utu Grip",
    ammo="Coiste Bodhar",
    head="Nyame Helm",
    body="Dagon Breast.",
    hands="Mercy Kote",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Bathy Choker +1",
    waist="Plat. Mog. Belt",
    left_ear="Sherida Earring",
    right_ear={ name="Pel. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+14','Mag. Acc.+14','Crit.hit rate+5',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
	

	
	sets.Adoulin = {body="Councilor's Garb",}
	
	
	
end

function job_state_change(stateField, newValue, oldValue)


	
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
	
end



	function job_aftercast(spell, action, spellMap, eventArgs)

    if not spell.interrupted then
        if spell.english == "Angon" then -- Angon Duration Countdown --
            send_command('wait 60;input /party Angon > 90 Seconds <scall 14> (90 Seconds);wait 75;input /party Angon: [WEARING OFF IN 15 SEC.];wait 15;input /party Angon [OFF]')
		end
	end
end


function customize_melee_set(meleeSet)





    --[[if (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value == 'DT' then
		meleeSet = set_combine(meleeSet, sets.engaged.HasteCap, sets.engaged.HasteCap.DT)
	elseif (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value ~= 'Shield' then
        meleeSet = set_combine(meleeSet, sets.engaged.HasteCap)
    ]]
	
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
	
	if state.DamageMode.value == 'Unlocked' then
		meleeSet = set_combine(meleeSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Prime' then
		meleeSet = set_combine(meleeSet, sets.Prime)
	elseif state.DamageMode.value == 'Naegling' then
		meleeSet = set_combine(meleeSet, sets.Naegling)
	elseif state.DamageMode.value == 'ShiningOne' then
		meleeSet = set_combine(meleeSet, sets.ShiningOne)
	elseif state.DamageMode.value == 'Trishula' then
		meleeSet = set_combine(meleeSet, sets.Trishula)

	
	end
	
	if state.SubtleBlow.value == 'On' then
		meleeSet = set_combine(meleeSet, sets.SubtleBlow)
	end

	

		if state.EmergencyMode.value == 'On' then 
	meleeSet = sets.Emergency
	end

	return meleeSet
	
end

--======================================================================--
--    __  __                                                     _      --
--   |  \/  |   ___   __   __   ___   _ __ ___     ___   _ __   | |_    --
--   | |\/| |  / _ \  \ \ / /  / _ \ | '_ ` _ \   / _ \ | '_ \  | __|   --
--   | |  | | | (_) |  \ V /  |  __/ | | | | | | |  __/ | | | | | |_    --
--   |_|  |_|  \___/    \_/    \___| |_| |_| |_|  \___| |_| |_|  \__|   --
--======================================================================--





-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks that are called to process player actions at specific points in time.
-------------------------------------------------------------------------------------------------------------------

function job_state_change(stateField, newValue, oldValue)

    if stateField == 'WeaponLockMode' then
        if newValue == 'Unlocked' then
            enable('main','sub','range','ammo')
		elseif newValue == 'Locked' then
            disable('main','sub','range')
        end
    end
end

-- Set eventArgs.handled to true if we don't want any automatic target handling to be done.
function job_pretarget(spell, action, spellMap, eventArgs)
    if spell.english == "Spirit Jump" then
        if not pet.isvalid then
            cancel_spell()
            send_command('Jump')
        end
    elseif spell.english == "Soul Jump" then
        if not pet.isvalid then
            cancel_spell()
            send_command("High Jump")
        end
    end
end


-- Runs when a pet initiates an action.
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_pet_midcast(spell, action, spellMap, eventArgs)
    if spell.english:startswith('Healing Breath') or spell.english == 'Restoring Breath' or spell.english == 'Steady Wing' or spell.english == 'Smiting Breath' then
		equip(sets.HB)
	end
end



function customize_idle_set(idleSet)



    

	if state.IdleMode.value == 'Town' then
		idleSet = sets.idle.Town 
	elseif state.IdleMode.value == 'Normal' then
		idleSet = sets.idle
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
		return idleSet
	end
	
	if buffactive['doom'] then
        idleSet = set_combine(idleSet, sets.Doom)
    end
	
	if state.DamageMode.value == 'Unlocked' then
		idleSet = set_combine(idleSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Prime' then
		idleSet = set_combine(idleSet, sets.Prime)
	elseif state.DamageMode.value == 'Naegling' then
		idleSet = set_combine(idleSet, sets.Naegling)
	elseif state.DamageMode.value == 'ShiningOne' then
		idleSet = set_combine(idleSet, sets.ShiningOne)
	elseif state.DamageMode.value == 'Trishula' then
		idleSet = set_combine(idleSet, sets.Trishula)
	end

		if state.HippoMode.value == 'On' then 
			idleSet = sets.Hippomenes
		return idleSet
	end

	
	if state.Moving.value == 'true' then
		idleSet = set_combine(idleSet, sets.MoveSpeed)
	end
	
	if state.EmergencyMode.value == 'On' then 
	idleSet = sets.Emergency
	end
	
	
    return idleSet
	
end


function job_buff_change(buff, gain)

if (not midaction() and not state.Moving.Value == 'true') and (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end


if buff == "doom" and gain then
send_command('gs c set DoomMode Doom')
elseif buff == "doom" and not gain then
send_command('gs c set DoomMode OFF')
end
	
		if state.HassoMode.value == 'On' and not buffactive['Hasso'] then 
			if not buffactive['Hasso'] then
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
			send_command('wait 1; input /ja hasso <me>')
			end
		end
	end
end

		if state.HassoMode.value == 'Off' and not buffactive['Hasso'] then 
			if not buffactive['Hasso'] then
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
end


windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
		send_command('setbgm 25')
	end
	
	
end)

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter> 21 then
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
							if state.Following.value == 'Follow' then
								send_command('send @others /follow Byrne')
							end
					elseif state.Following.value == 'Follow' then
								send_command('send @others /follow Byrne')
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

		
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		end
       
		if state.SubtleBlow.value == 'On' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Subtle Blow (CNTRL+F7) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.SubtleBlow.current) .. textColorNewLine
		elseif state.SubtleBlow.value == 'Off' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Subtle Blow (CNTRL+F7) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.SubtleBlow.current) .. textColorNewLine
		end
		if state.HassoMode.value == 'On' then
			textinbox = textinbox .. "\\cs(255, 75, 255)" .. "Hasso Mode (INS) : " .. "\\cr" .. "\\cs(220, 20, 60)" .. tostring(state.HassoMode.current) .. textColorNewLine
		elseif state.HassoMode.value == 'Off' then
			textinbox = textinbox .. "\\cs(255, 75, 255)" .. "Hasso Mode (INS) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.HassoMode.current) .. textColorNewLine
		end
		if state.EmergencyMode.value == 'On' then
			textinbox = textinbox .. "\\cs(255, 0, 0)" .. "Emergency Mode (CNTRL+INS : " .. "\\cr" .. "\\cs(255, 0, 0)" .. tostring(state.EmergencyMode.current) .. textColorNewLine
		elseif state.EmergencyMode.value == 'Off' then
			textinbox = textinbox .. "\\cs(255, 0, 0)" .. "Emergency (CNTRL+INS) : " .. "\\cr" .. "\\cs(255, 0, 0)" .. tostring(state.EmergencyMode.current) .. textColorNewLine
		end
		
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
			textinbox = textinbox .. textColor .. "SCMode(Alt+F8) : " .. tostring(state.SCMode.current) .. textColorNewLine
			
		
			


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

function job_post_precast(spell, action, spellMap, eventArgs)


		if spell.type:lower() == 'weaponskill' and state.SCMode.Value == 'Skillchain' then
			equip(sets.Skillchain)
	end
end