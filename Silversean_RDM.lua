--[[

8888888b.                888     888b     d888                            
888   Y88b               888     8888b   d8888                            
888    888               888     88888b.d88888                            
888   d88P  .d88b.   .d88888     888Y88888P888  8888b.   .d88b.   .d88b.  
8888888P"  d8P  Y8b d88" 888     888 Y888P 888     "88b d88P"88b d8P  Y8b 
888 T88b   88888888 888  888     888  Y8P  888 .d888888 888  888 88888888 
888  T88b  Y8b.     Y88b 888     888   "   888 888  888 Y88b 888 Y8b.     
888   T88b  "Y8888   "Y88888     888       888 "Y888888  "Y88888  "Y8888  
                                                             888          
                                                        Y8b d88P          
                                                         "Y88P"           
]]

windower.add_to_chat(123,[[Red Mage Lua Author: Byrne #7894 (Discord))]])
windower.add_to_chat(160,[[Movement speed by default will not equip when engaged, Press F1 to handle auto-kiting while engaged.]])
--windower.add_to_chat(123,[[   <> It is reccommended you use User- .lua at https://github.com/Byrne119/Gearswap ]]) --Right click and save link as...
--windower.add_to_chat(123,[[   <> if you have done this, put -- before lines 18 and 19. Remove -- before sharing!]])
include('organizer-lib')


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------





-- Initialization function for this job file.
function get_sets()

	-- Capes:
    -- Sucellos's And such, add your own.
    RDMCape = {}
    RDMCape.TP = {}
    RDMCape.MACC	=	{ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}}

    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	
	--[[pcall(function()]]
    include('lagguard.lua')
	include('tables.lua')
	include('movement.lua')
	end


	






--[[These numbers determine where your table will show update
This is affected both by your resolution and your scaling mode so
you may need to lower these numbers quite significantly depending
on your settings.  Start with 100,100, and reload the file to find
where the box moves as you edit it.  Unfortunately I am not certain
how to make this context box draggable.]]

    blue_magic_maps = {}
    


    -- Magical Spells --
    -- Magical spells with the typical Int mod

    blue_magic_maps.Magical = S{
        'Bomb Toss',


    }
            
    -- Magical spells (generally debuffs) that we want to focus on magic accuracy over damage.
    -- Add Int for damage where available, though.
    blue_magic_maps.MagicAccuracy = S{
		'Awful Eye','Blank Gaze','Blood Drain','Blood Saber','Chaotic Eye',
		'Geist Wall','Jettatura','Sheep Song','Soporific','Blitzstrahl',
    }
        


    -- Other general buffs
    blue_magic_maps.Buff = S{
        'Cocoon',

    }





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
	state.OffenseMode:options('Normal', 'DT', 'Shield', 'ShieldTP', 'Enspell', 'NoDW', 'TH')
	state.DamageMode = M('Unlocked','Shikargar','Crocea', 'Savage', 'Excalibur', 'Blunt', 'Aeolian','Lv.1 Dagger')
    state.WeaponLockMode = M('Unlocked', 'Locked')
    state.IdleMode:options('Normal','Town','DT', 'Shield', 'Aminon')
	state.CastingMode:options('Normal', 'Burst', 'SIRD', 'Occult')
	state.Enfeeb = M('Potency', 'Accuracy', 'Skill')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.HippoMode = M('Off', 'On')
	state.WSMode = M('Normal','Skillchain')
	state.EngagedMoving = M('Disabled','Enabled')
	state.DoomMode = M('OFF', 'Doom')
	state.SubtleBlow = M('On', 'Off')
	state.Following = M('Follow','Stay')
    state.Moving = M('false', 'true')
	state.Kiting = M('false', 'true')
    state.EnWeatherMatch = M('Default','Matched')
    select_default_macro_book()

	send_command('bind ^f7 gs c cycle SubtleBlow')
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f6 gs c cycle DamageMode; gs enable main sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f6 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle CastingMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind ^insert gs c cycle HippoMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind f7 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind !f8 gs c cycle WSMode')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind ^` input /impact <stnpc>')
	
    select_default_macro_book()
end

function user_job_setup()
	gear.macc_jse_back = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Mag. Acc+20 /Mag. Dmg.+20','Damage taken-5%',}}

end

 

--=================================--
--  _  _ _  _ _    ____ ____ ___   --
--  |  | |\ | |    |  | |__| |  \  --
--  |__| | \| |___ |__| |  | |__/  --
--                                 --
--=================================--

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

--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--
	
	sets.Unlocked = {}
	
	sets.Crocea = {    
		main="Crocea Mors",
		sub="Daybreak",}
	
	sets.Shikargar = {
		main="Nitric baselard",}
		
	
	sets.Savage = {    
		main="Naegling",
		sub="Thibron",}

	sets.Excalibur = {    
		main="Excalibur",
		sub="Sacro Bulwark",}

	sets.Blunt = {    
		main="Maxentius",
		sub="Archduke's Shield",}

	sets.Aeolian = {    
		main="Tauret",
		sub="Daybreak",}
		
	sets.Lv1Dagger = {    
		main="Ceremonial Dagger",
		sub="Ceremonial Dagger",}
	







    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard +3"}

	sets.buff.Saboteur = {hands="Leth. Ganth. +3"}


	sets.precast.JA['Composure'] = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark",
		ammo="Homiliary",
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs="Leth. Fuseau +3",
		feet="Leth. Houseaux +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear="Thureous Earring",
		right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
		left_ring="Roller's Ring",
		right_ring="Stikini Ring +1",
		back="Moonbeam Cape",
	}
    
    --Red Mage gets plenty of Fast Cast through traits and gear
	--So I would reccomend avoiding quick cast due to equipping errors.
	sets.precast.FC = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Sacro Bulwark",
    ammo="Sroda Tathlum",
    head="Atro. Chapeau +2",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Loquac. Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
    left_ring="Kishar Ring",
    right_ring="Weather. Ring",
	back="Fi Follet Cape +1",
}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {})
	
	sets.precast.RA = {    
		ammo="Hawkeye",
		head={ name="Taeon Chapeau", augments={'Accuracy+15 Attack+15','"Snapshot"+5','"Snapshot"+5',}},
		body="Malignance Tabard",
		hands={ name="Carmine Fin. Ga. +1", augments={'Rng.Atk.+20','"Mag.Atk.Bns."+12','"Store TP"+6',}},
		legs={ name="Taeon Tights", augments={'Accuracy+22','"Snapshot"+4','"Snapshot"+5',}},
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Yemaya Belt",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	--don't play with the name of this set, it breaks very easily. (Libraries problem)
	sets.precast.FC.Impact = {sub="Ammurapi Shield",
    ammo="Sapience Orb",
    body="Twilight Cloak",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
	back="Fi Follet Cape +1",
}
		
	--[[this set needs to be a clone of sets.precast.FC.Impact
		I know this setup seems insane and unneccessary, but Impact requires
		the Twilight cloak to be equipped to begin casting unlike other spells
		and as such I must define sets.precast.FC.Impact to sets.precast.FC.ImpactQC
		to check for Chainspell or Spontaneity, then I must redefine it to
		This set when you cast it next without those buffs active.
		It's complicated, but I promise it's neccessary.
		Also, do not make this a setcombine with the previous Impact FC set
		or it will defeat it's purpose.]]
	
	sets.precast.FC.Impact2 = {sub="Ammurapi Shield",
    ammo="Sapience Orb",
    body="Twilight Cloak",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
	right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
	back="Fi Follet Cape +1",
}
		
	sets.precast.FC.ImpactQC = {
		main="Crocea Mors",
		sub="Ammurapi Shield",
		range="Kaja Bow",
		head=empty,
		body="Twilight Cloak",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','Enmity-2','INT+6','Mag. Acc.+14','"Mag.Atk.Bns."+3',}},
		feet={ name="Vitiation Boots +4", augments={'Enhances "Paralyze II" effect',}},
		neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},}

    sets.precast.FC.Stoneskin = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Sacro Bulwark",
		ammo="Sroda Tathlum",
		head="Atro. Chapeau +2",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
		legs="Shedir Seraweels",
		feet={ name="Carmine Greaves", augments={'Accuracy+10','DEX+10','MND+15',}},
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Earthcry Earring",
		right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi"})
       

--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--




	sets.midcast.SIRD = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Lethargy Chappel +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Rosette Jaseran +1",
    hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
    legs="Bunzi's Pants",
    feet="Atrophy Boots +4",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Othila Sash",
    left_ear="Thureous Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	
	
	sets.midcast.TrustDI = {    
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Tauret",
		ammo="Homiliary",
		head="Angantyr Beret",
		body="Angantyr Robe",
		hands="Angantyr Mittens",
		legs="Angantyr Tights",
		feet="Angantyr Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
    sets.midcast.FastRecast = {}

	sets.midcast['Absorb-TP'] = {
    main={ name="Shikargar", augments={'DMG:+1','Delay:+4','Add.eff.:Lowers mag.def.+16',}},
    sub="Daybreak",
    ammo="Regal Gem",
    head="Atro. Chapeau +2",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Null Loop",
    waist="Null Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back="Null Shawl",
}
	
    sets.midcast.Cure = {
    main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Sroda Tathlum",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Kaykaus Boots +1", augments={'Mag. Acc.+20','"Cure" potency +6%','"Fast Cast"+4',}},
    neck="Incanter's Torque",
    waist="Carrier's Sash",
    left_ear="Mendi. Earring",
    right_ear="Loquac. Earring",
    ring1={name="Stikini Ring +1", bag="wardrobe2"},
	ring2={name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

    sets.midcast.Cursna = {
        head="Gendewitha Caubeen +1",
		neck="Malison Medallion",
		ear1="Roundel Earring",
		ear2="Loquacious Earring",
        body="Vrikodara Jupon",
		hands="Serpentes Cuffs",
		ring1="Ephedra Ring",
		ring2="Ephedra Ring",
        back="Ghostfyre Cape",
		waist="Witful Belt",
		legs="Atrophy Tights +3",
		feet="Gendewitha Galoshes"}
        
    sets.midcast.Curaga = sets.midcast.Cure
	
    sets.midcast.CureSelf = set_combine(sets.midcast.Cure, {
		ring1="Defending Ring",
		ring2="Kunaji Ring",
		waist="Gishdubar Sash"})
		
    sets.midcast['Enhancing Magic'] = {
    main="Pukulatmuj +1",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Murky Ring",
    right_ring="Prolix Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
		
	sets.midcast['Enhancing Magic'].SelfDuration = {
    main="Pukulatmuj +1",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Murky Ring",
    right_ring="Prolix Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}

	sets.midcast['Enhancing Magic'].Skill = {
    main="Pukulatmuj +1",
    sub={ name="Forfend +1", augments={'Path: A',}},
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Befouled Crown",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs="Atrophy Tights +2",
    feet="Leth. Houseaux +3",
    neck="Incanter's Torque",
    waist="Olympus Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
	
	sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'].Skill, {})
	
	sets.midcast.PhalanxSelf = set_combine(sets.midcast.Phalanx, {
    main="Sakpata's Sword",
    sub={ name="Egeking", augments={'Accuracy+14','Mag. Acc.+6','"Fast Cast"+2',}},
    ammo="Staunch Tathlum +1",
    head={ name="Chironic Hat", augments={'AGI+7','Attack+19','Phalanx +3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    body={ name="Chironic Doublet", augments={'Weapon skill damage +3%','Pet: Attack+15 Pet: Rng.Atk.+15','Phalanx +4',}},
    hands={ name="Chironic Gloves", augments={'MND+10','STR+8','Phalanx +4','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    legs={ name="Taeon Tights", augments={'Accuracy+17','"Cure" potency +2%','Phalanx +3',}},
    feet={ name="Taeon Boots", augments={'Accuracy+9','"Fast Cast"+3','Phalanx +3',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear="Suppanomimi",
    right_ear="Mimir Earring",
	ring1={name="Stikini Ring +1", bag="wardrobe2"},
	ring2={name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
})
		
	sets.midcast['Enhancing Magic'].GainSpell = set_combine(sets.midcast['Enhancing Magic'].SelfDuration, {hands="Vitiation gloves +3"})
		
    sets.midcast.Refresh = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sapience Orb",
    head="Amalric Coif +1",
    body="Atrophy Tabard +4",
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Kishar Ring",
    right_ring="Prolix Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
		
		
	sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Sacro Bulwark",
    ammo="Regal Gem",
    head={ name="Taeon Chapeau", augments={'Accuracy+11','"Snapshot"+4','"Regen" potency+3',}},
    body={ name="Telchine Chas.", augments={'"Regen" potency+3',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
    legs="Leth. Fuseau +3",
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}

		
	sets.midcast.Aquaveil = {
		main="Pukulatmuj +1",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Chironic Hat", augments={'AGI+7','Attack+19','Phalanx +3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
		legs="Shedir Seraweels",
		feet="Leth. Houseaux +3",
		neck="Incanter's Torque",
		waist="Olympus Sash",
		left_ear="Mimir Earring",
		right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
		left_ring="Kishar Ring",
		right_ring="Stikini Ring +1",
		back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
	}
	
	sets.midcast.Stoneskin = {
	ammo="Staunch Tathlum +1",
	head="Befouled Crown",
	body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
	hands="Stone Mufflers",
	legs="Shedir Seraweels",
	feet="Leth. Houseaux +3",
	neck="Nodens Gorget",
	waist="Siegel Sash",
	left_ear="Earthcry Earring",
	right_ear="Mimir Earring",
	left_ring="Stikini Ring +1",
	right_ring="Stikini Ring +1",
	back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
	}




	--Repose for WHM sub; this spell is not enfeebling magic so use M.acc and divine skill.
	sets.midcast.Repose = {
		main="Crocea Mors",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head={ name="Chironic Hat", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Conserve MP"+2','MND+5','Mag. Acc.+15','"Mag.Atk.Bns."+2',}},
		body="Atrophy Tabard +4",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','MND+6','Mag. Acc.+14',}},
		feet={ name="Vitiation Boots +4", augments={'Enhances "Paralyze II" effect',}},
		neck="Dls. Torque +2",
		waist="Luminary Sash",
		left_ear="Snotra Earring",
		right_ear="Regal Earring",
		ring1={name="Stikini Ring +1", bag="wardrobe2"},
		ring2={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}
	
	--set does not need gear; is not referenced.
	sets.midcast['Enfeebling Magic'] = {}
	--Enfeebling sets for Mnd and Int enfeebles will really only change which cape you are using	
	sets.midcast.IntEnfeebles = {back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},}
	
    sets.midcast['Enfeebling Magic'].Accuracy = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    range="Ullr",
    head="Atro. Chapeau +2",
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Atrophy Tights +2",
    feet="Viti. Boots +4",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Obstin. Sash",
    left_ear="Regal Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	
	--Accuracy is the ONLY concern for this set, used for boolean spells such as silence. Silence either lands or it doesn't, there is no potency.
	--When using Kaja bow for m.acc, if the set you are combining with uses gem, you must specify empty ammo to prevent misequip.
	sets.midcast['Enfeebling Magic'].MaxAccuracy = sets.midcast['Enfeebling Magic'].Accuracy
	
	sets.midcast.Sleep = set_combine(sets.midcast['Enfeebling Magic'].MaxAccuracy, {right_ring="Kishar Ring"})
	
	sets.midcast['Enfeebling Magic'].Skill = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Atrophy Tabard +4",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Dbl.Atk."+4',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}

	sets.midcast['Enfeebling Magic'].Potency = {
		main={ name="Crocea Mors", augments={'Path: C',}},
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Leth. Chappel +3",
		body="Lethargy Sayon +3",
		hands="Leth. Ganth. +3",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','MND+1',}},
		feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Obstin. Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
		right_ring="Stikini Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
	
    
	sets.Saboteur = set_combine(sets.midcast['Enfeebling Magic'].Potency, {hands="Lethargy Gantherots +3"})
	
	sets.Dia = {
    main="Daybreak",
    sub="Sacro Bulwark",
    ammo="Per. Lucky Egg",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Viti. Gloves +4", augments={'Enhancing Magic duration',}},
    legs={ name="Merlinic Shalwar", augments={'MND+5','INT+1','"Treasure Hunter"+2','Accuracy+8 Attack+8','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Sherida Earring",
    right_ear="Thureous Earring",
	ring1={name="Stikini Ring +1", bag="wardrobe2"},
	ring2={name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}







sets.Gravity = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs={ name="Chironic Hose", augments={'Mag. Acc.+30','MND+1',}},
    feet="Viti. Boots +4",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Obstin. Sash",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}


	
	sets.TreasureHunter = {
		waist="Chaac Belt",
		legs={ name="Merlinic Shalwar", augments={'CHR+10','Attack+3','"Treasure Hunter"+1','Accuracy+15 Attack+15','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
		feet={ name="Merlinic Crackows", augments={'"Blood Boon"+8','Accuracy+18','"Treasure Hunter"+2',}},
		}
	
	sets.midcast['Enfeebling Magic'].ParalyzeDuration = {feet="Vitiation Boots +4",}
	
    sets.midcast['Elemental Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist="Skrymir Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
		
	sets.midcast['Elemental Magic'].Burst = {
    main="Wizard's Rod",
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Ea Hat",
    body="Ea Houppelande",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck="Sibyl Scarf",
    waist="Skrymir Cord",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Freke Ring",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}
    
sets.midcast['Elemental Magic'].Occult = {
    main="Maxentius",
    sub="Ammurapi Shield",
    ammo="Aurgelmir Orb",
    head="Welkin Crown",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+2','"Occult Acumen"+10','MND+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+7',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Occult Acumen"+11',}},
    neck="Bathy Choker +1",
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Chirich Ring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}

	sets.midcast.RA = {
		ammo="Hawkeye",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Sanctity Necklace",
		waist="Yemaya Belt",
		left_ear="Delegate's Earring",
		right_ear="Telos Earring",
		left_ring="Dark Ring",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}
	
	sets.Obi = {waist="Hachirin-no-Obi",}
	
	--Impact is elemental magic that should STRONGLY favor magic accuracy.
	--The additional stat down effect is far more important than the damage it deals.
	--As elemental magic, it is INT based.
	--When using Kaja bow for m.acc, if the set you are combining with uses gem, you must specify empty ammo to prevent misequip.
    sets.midcast.Impact =     {
		main="Maxentius",
		sub="Ammurapi Shield",
		ammo="Aurgelmir Orb",
		body="Twilight Cloak",
		hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+7',}},
		legs="Perdition Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Occult Acumen"+11',}},
		neck="Ainia Collar",
		waist="Oneiros Rope",
		left_ear="Dedition Earring",
		right_ear="Crep. Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
	}

    sets.midcast['Dark Magic'] = {
    main="Bunzi's Rod",
    sub="Daybreak",
    ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Refoccilation Stone",
    left_ear="Malignance Earring",
    right_ear="Loquac. Earring",
    left_ring="Archon Ring",
    right_ring="Stikini Ring +1",
    back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
}


    sets.midcast.Drain = {
		main={ name="Rubicundity", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+9','Dark magic skill +8','"Conserve MP"+6',}},
		sub="Ammurapi Shield",
		range="Ullr",
		head="Pixie Hairpin +1",
		body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+26','"Drain" and "Aspir" potency +11','MND+9',}},
		hands="Leth. Ganth. +3",
		legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Drain" and "Aspir" potency +10','INT+3','"Mag.Atk.Bns."+5',}},
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+13','"Drain" and "Aspir" potency +11','Mag. Acc.+11',}},
		neck="Erra Pendant",
		waist="Fucho-no-Obi",
		left_ear="Malignance Earring",
		right_ear="Regal Earring",
		left_ring="Evanescence Ring",
		right_ring="Archon Ring",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10','Damage taken-5%',}},
	}
	
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Utsusemi = {
		ammo="Staunch Tathlum +1",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Leth. Ganth. +2",
		legs="Malignance Tights",
		feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Defending Ring",
		right_ring="Shadow Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.midcast.UtsusemiDT = {
	    ammo="Staunch Tathlum +1",
		head={ name="Carmine Mask +1", augments={'Accuracy+20','Mag. Acc.+12','"Fast Cast"+4',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume Belt +1",
		left_ear="Etiolation Earring",
		right_ear="Genmei Earring",
		left_ring="Defending Ring",
		right_ring="Weather. Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},
	}


		sets.midcast.Stun = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Regal Gem",
    head="Atro. Chapeau +2",
    body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Lebeche Ring",
    right_ring="Weather. Ring",
	back="Fi Follet Cape +1",
}
		
	sets.midcast['Blue Magic'] = {}
	
	sets.midcast['Blue Magic'].Magical = {
		main="Daybreak",
		sub="Maxentius",
		ammo="Pemphredo Tathlum",
		body={ name="Cohort Cloak +1", augments={'Path: A',}},
		hands={ name="Amalric Gages +1", augments={'INT+12','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
		neck="Sanctity Necklace",
		waist="Orpheus's Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring="Shiva Ring +1",
		right_ring="Shiva Ring +1",
		back={ name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}},}
		
	sets.midcast['Blue Magic'].MagicAccuracy = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +4",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}
		
	sets.midcast['Blue Magic'].Soporific = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +4",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}
		
	sets.midcast['Blue Magic']['Sheep Song'] = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +4",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}
		
	sets.midcast['Blue Magic']['Blitzstrahl'] = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +4",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck={ name="Dls. Torque +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Regal Earring",
		right_ear="Malignance Earring",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}	
		
	sets.midcast['Blue Magic'].Cocoon = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Lethargy Gantherots +3",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Loricate Torque +1",
		waist="Flume belt +1",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
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
    feet="Leth. Houseaux +3",
    neck="Rep. Plat. Medal",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Ishvara Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['Combo'] = {    
		main="Kaja Knuckles",
		ammo="Regal Gem",
		head="Jhakri Coronal +2",
		body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		legs="Lethargy Fuseau +3",
		feet="Aya. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Backhand Blow'] = {
		main="Kaja Knuckles",
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body="Ayanmo Corazza +2",
		hands="Atrophy Gloves +4",
		legs="Lethargy Fuseau +3",
		feet={ name="Chironic Slippers", augments={'"Conserve MP"+5','Rng.Atk.+10','Weapon skill damage +9%','Accuracy+6 Attack+6',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Asuran Fists'] ={
	    main="Kaja Knuckles",
		ammo="Regal Gem",
		head="Jhakri Coronal +2",
		body="Ayanmo Corazza +2",
		hands="Malignance Gloves",
		legs="Lethargy Fuseau +3",
		feet="Aya. Gambieras +2",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Cessance Earring",
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.precast.WS['Circle Blade'] = {
		ammo="Hasty Pinion +1",
		head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Atrophy Gloves +4",
		legs="Lethargy Fuseau +3",
		feet={ name="Chironic Slippers", augments={'"Conserve MP"+5','Rng.Atk.+10','Weapon skill damage +9%','Accuracy+6 Attack+6',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Sherida Earring",
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Rufescent Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Requiescat'] = {
		ammo="Regal Gem",
		head={ name="Viti. Chapeau +4", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Atrophy Gloves +4",
		legs="Lethargy Fuseau +3",
		feet={ name="Vitiation Boots +4", augments={'Enhances "Paralyze II" effect',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Regal Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Rufescent Ring",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','"Dbl.Atk."+10',}},}
		
    sets.precast.WS['Empyreal Arrow'] = {
		main="Naegling",
		sub={ name="Thibron", augments={'TP Bonus +1000',}},
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Lethargy Houseaux +3",
		neck="Sanctity Necklace",
		waist="Yemaya Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Cacoethic Ring +1",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Sanguine Blade'] = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
		
	sets.precast.WS['Sanguine Blade'].MAB = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Archon Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
		
	sets.precast.WS['Red Lotus Blade'] = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body="Nyame Mail",
    hands="Jhakri Cuffs +2",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	sets.precast.WS['Shining Strike'] = {
		ammo="Sroda Tathlum",
		head={ name="Merlinic Hood", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: Haste+2','Weapon skill damage +5%','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Nyame Gauntlets",
		legs="Lethargy Fuseau +3",
		feet="Lethargy Houseaux +3",
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Malignance Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Weather. Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	}
	
	sets.precast.WS['Seraph Blade'] = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Leth. Chappel +3",
    body="Nyame Mail",
    hands="Leth. Ganth. +3",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear="Moonshade Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
	
	sets.precast.WS['Flash Nova'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: Haste+2','Weapon skill damage +5%','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Nyame Gauntlets",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Lethargy Houseaux +3",
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Malignance Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Weather. Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},
	}
	
	sets.precast.WS['Shining Blade'] = {
		ammo="Pemphredo Tathlum",
		head={ name="Merlinic Hood", augments={'Pet: Attack+21 Pet: Rng.Atk.+21','Pet: Haste+2','Weapon skill damage +5%','Mag. Acc.+18 "Mag.Atk.Bns."+18',}},
		body={ name="Amalric Doublet +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		hands="Nyame Gauntlets",
		legs={ name="Amalric Slops +1", augments={'MP+80','Mag. Acc.+20','"Mag.Atk.Bns."+20',}},
		feet="Lethargy Houseaux +3",
		neck="Fotia Gorget",
		waist="Orpheus's Sash",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Malignance Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Weather. Ring +1",
		back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%',}},}

    sets.precast.WS['Savage Blade'] =  {ammo="Crepuscular Pebble",
    head="Viti. Chapeau +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Atro. Gloves +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['Knights of Round'] =  {ammo="Crepuscular Pebble",
	head="Viti. Chapeau +4",
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands="Atro. Gloves +4",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck="Fotia Gorget",
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear="Sherida Earring",
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
		
	sets.precast.WS['True Strike'] = {
		main="Kaja Rod",
		sub="Tauret",
		ammo="Yetshila +1",
		head={ name="Viti. Chapeau +4", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body="Lethargy Sayon +3",
		hands="Atrophy Gloves +4",
		legs="Lethargy Fuseau +3",
		feet="Lethargy Houseaux +3",
		neck="Caro Necklace",
		waist="Sailfi Belt +1",
		left_ear="Ishvara Earring",
		right_ear="Sherida Earring",
		left_ring="Epaminondas's Ring",
		right_ring="Rufescent Ring",
		back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}},}
		
	sets.precast.WS['Black Halo'] =  {
    ammo="Crepuscular Pebble",
    head="Viti. Chapeau +4",
    body="Nyame Mail",
    hands="Atro. Gloves +4",
    legs="Nyame Flanchard",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Sailfi Belt +1",
    left_ear="Moonshade Earring",
    right_ear="Regal Earring",
    left_ring="Ephramad's Ring",
    right_ring="Sroda Ring",
    back={ name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','Weapon skill damage +10%',}},
}
	
	sets.precast.WS['Aeolian Edge']	= {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Sucellos's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','MND+10','Weapon skill damage +10%','Damage taken-5%',}},
}
		
	sets.precast.WS['Death Blossom'] = {
		head={ name="Viti. Chapeau +4", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Atrophy Gloves +4",
		legs="Lethargy Fuseau +3",
		feet={ name="Carmine Greaves +1", augments={'Accuracy+12','DEX+12','MND+20',}},
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Rufescent Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
	
	sets.precast.WS['Chant Du Cygne'] = {
		ammo="Yetshila +1",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
		right_ear="Sherida Earring",
		left_ring="Begrudging Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
		
	sets.precast.WS['Evisceration'] = {
		main="Tauret",
		sub="Gleti's Knife",
		ammo="Homiliary",
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Brutal Earring",
		right_ear="Sherida Earring",
		left_ring="Hetairoi Ring",
		right_ring="Ilabrat Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}

		
--------------------------------------------------------------------------------------------------------	
---- _____    ____    _   _   _____    _____   _______   _____    ____    _   _              _      ----
--  / ____|  / __ \  | \ | | |  __ \  |_   _| |__   __| |_   _|  / __ \  | \ | |     /\     | |       --
-- | |      | |  | | |  \| | | |  | |   | |      | |      | |   | |  | | |  \| |    /  \    | |       --
-- | |      | |  | | | . ` | | |  | |   | |      | |      | |   | |  | | | . ` |   / /\ \   | |       --
-- | |____  | |__| | | |\  | | |__| |  _| |_     | |     _| |_  | |__| | | |\  |  / ____ \  | |____   --
--  \_____|  \____/  |_| \_| |_____/  |_____|    |_|    |_____|  \____/  |_| \_| /_/    \_\ |______|  --
----																								----
--------------------------------------------------------------------------------------------------------
    
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
    
    sets.buff.ComposureOther = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Leth. Chappel +3",
    body="Lethargy Sayon +3",
    hands="Atro. Gloves +4",
    legs="Leth. Fuseau +3",
    feet="Leth. Houseaux +3",
    neck={ name="Dls. Torque +2", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Alabaster Earring",
    right_ear={ name="Leth. Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+15','Mag. Acc.+15','"Dbl.Atk."+5',}},
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Ghostfyre Cape", augments={'Enfb.mag. skill +7','Enha.mag. skill +5','Mag. Acc.+3','Enh. Mag. eff. dur. +20',}},
}
		
	sets.SubtleBlow = {}
	
	sets.SubtleBlow.HasteCap = set_combine(sets.SubtleBlow, {
		left_ear="Digni. Earring",
		right_ear="Sherida Earring",})
		
	

    sets.MoveSpeed = {legs="Carmine Cuisses +1"}
	
	sets.Kite = {legs='Carmine cuisses +1',  feet="Hippo. Socks +1",}
		
	sets.ConsMP = {body="Seidr Cotehardie"}

	sets.Dyna_RP_Farm = {neck="Duelist's Torque +2",}
	
	--Fallback for Macc ammo when we have ranged slot locked (i.e. Meleeing)
	sets.MaccAmmo = {range=empty,ammo="Regal Gem"}
	
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


	sets.Adoulin = {body="Councilor's Garb"}

    sets.idle.Normal = {ammo="Homiliary",
    head="Null Masque",
    body="Lethargy Sayon +3",
    hands="Leth. Ganth. +3",
    legs="Nyame Flanchard",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Rep. Plat. Medal",
    waist="Carrier's Sash",
    left_ear="Dominance Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Roller's Ring",
    right_ring="Defending Ring",
    back="Shadow Mantle",
}

	sets.Hippomenes = set_combine(idleSet, {feet = "Hippo. Socks +1"})

	sets.latent_refresh = {waist="Fucho-no-obi"}	
		
	sets.idle.Shield = {
    main="Excalibur",
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Enmity+1','INT+5','Chance of successful block +4','Accuracy+18 Attack+18',}},
    body="Adamantite Armor",
    hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
    legs="Nyame Flanchard",
    feet="Atro. Boots +4",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Thureous Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
    sets.idle.Town = {
		main="Crocea Mors",
		sub="Ammurapi Shield",
		ammo="Homiliary",
		head={ name="Viti. Chapeau +4", augments={'Enhances "Dia III" effect','Enhances "Slow II" effect',}},
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands={ name="Viti. Gloves +4", augments={'Enhances "Phalanx II" effect',}},
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		feet={ name="Vitiation Boots +4", augments={'Enhances "Paralyze II" effect',}},
		neck="Duelist's Torque +2",
		waist="Carrier's Sash",
		left_ear="Etiolation Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Weather. Ring +1",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
		
sets.idle.DT = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Sacro Bulwark",
    ammo="Eluder's Sachet",
    head="Null Masque",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Atro. Boots +4",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Thureous Earring",
    left_ring="Shadow Ring",
    right_ring="Roller's Ring",
    back="Shadow Mantle",
}
	
	sets.idle.SIRD = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Lethargy Chappel +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Rosette Jaseran +1",
    hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
    legs="Bunzi's Pants",
    feet="Atrophy Boots +4",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Othila Sash",
    left_ear="Thureous Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Freke Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	
	sets.idle.Aminon = {
    main="Maxentius",
    sub="Archduke's Shield",
    ammo="Aurgelmir Orb",
    head="Null Masque",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Rep. Plat. Medal",
    waist="Flume Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Roller's Ring",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	
	sets.idle.TH = {
	ammo="Per. Lucky Egg",
    head={ name="Viti. Chapeau +4", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Chironic Gloves", augments={'Pet: VIT+6','Spell interruption rate down -8%','"Treasure Hunter"+1','Mag. Acc.+17 "Mag.Atk.Bns."+17',}},
    legs={ name="Chironic Hose", augments={'MND+10','Pet: Attack+14 Pet: Rng.Atk.+14','"Treasure Hunter"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}},
    feet={ name="Vitiation Boots +4", augments={'Immunobreak Chance',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Sherida Earring",
    right_ear="Thureous Earring",
	ring1={name="Stikini Ring +1", bag="wardrobe2"},
	ring2={name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}

--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--
	
	sets.ClubTP = {main="Maxentius", sub="Machaera +3"}
	
	sets.default_melee_weapons = {main="Crocea Mors", sub="Daybreak",}
	
	sets.AlmaceTauret = {main="Almace",sub="tauret"}
	
	sets.Domain = {hands="Angantyr Mittens"}
	
	sets.Domain.WSD = {feet="Angantyr Boots"}
	
	
	
	sets.Enspell = set_combine(sets.engaged, {
		ammo="Hasty Pinion +1",
		hands="Ayanmo Manopolas +2",
		waist="Orpheus's Sash",})
		
	sets.Enspell.Obi = set_combine(sets.engaged, {
		ammo="Sroda Tathlum",
		hands="Ayanmo Manopolas +2",
		legs={ name="Carmine Cuisses +1", augments={'Accuracy+20','Attack+12','"Dual Wield"+6',}},
		waist="Hachirin-no-Obi",})
		
	sets.Enspell.HasteCap = set_combine(sets.engaged.HasteCap, {
		hands="Ayanmo Manopolas +2",
		waist="Orpheus's Sash",
		ammo="Sroda Tathlum"})
		
	sets.Enspell.HasteCap.Obi = set_combine(sets.engaged.HasteCap, {
		hands="Ayanmo Manopolas +2",
		waist="Hachirin-no-Obi",
		ammo="Sroda Tathlum"})
	
    sets.engaged = {
    main={ name="Shikargar", augments={'DMG:+1','Delay:+4','Add.eff.:Lowers mag.def.+16',}},
    sub="Daybreak",
    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Anu Torque",
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Sherida Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
		
	sets.engaged.DT = {
    main={ name="Shikargar", augments={'DMG:+1','Delay:+4','Add.eff.:Lowers mag.def.+16',}},
    sub="Daybreak",
    ammo="Coiste Bodhar",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet={ name="Carmine Greaves +1", augments={'HP+80','MP+80','Phys. dmg. taken -4',}},
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Sherida Earring",
    left_ring="Murky Ring",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
		
		
		

	sets.engaged.Shield = {
    main="Excalibur",
    sub="Sacro Bulwark",
    ammo="Staunch Tathlum +1",
    head={ name="Merlinic Hood", augments={'Enmity+1','INT+5','Chance of successful block +4','Accuracy+18 Attack+18',}},
    body="Adamantite Armor",
    hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
    legs="Nyame Flanchard",
    feet="Atro. Boots +4",
    neck="Loricate Torque +1",
    waist="Plat. Mog. Belt",
    left_ear="Odnowa Earring +1",
    right_ear="Thureous Earring",
    left_ring="Gelatinous Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	sets.engaged.ShieldTP = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Sacro Bulwark",
    ammo={ name="Coiste Bodhar", augments={'Path: A',}},
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	
	
	sets.engaged.TH = {
    main={ name="Excalibur", augments={'Path: A',}},
    sub="Sacro Bulwark",
    ammo="Per. Lucky Egg",
    head="Malignance Chapeau",
    body="Lethargy Sayon +3",
    hands="Malignance Gloves",
    legs={ name="Merlinic Shalwar", augments={'MND+5','INT+1','"Treasure Hunter"+2','Accuracy+8 Attack+8','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    feet="Malignance Boots",
    neck="Anu Torque",
    waist="Chaac Belt",
    left_ear="Suppanomimi",
    right_ear="Malignance Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},
}
	
	
	sets.engaged.Enspell = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Aya. Manopolas +2",
    legs="Malignance Tights",
    feet={ name="Taeon Boots", augments={'Haste+3','Mag. crit. hit dmg. +10%',}},
    neck="Sanctity Necklace",
    waist="Orpheus's Sash",
    left_ear="Brutal Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Murky Ring",
    right_ring="Defending Ring",
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}
	
	sets.engaged.NoDW = {
    main={ name="Crocea Mors", augments={'Path: C',}},
    sub="Sacro Bulwark",
    ammo="Aurgelmir Orb",
    head="Bunzi's Hat",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Nyame Sollerets",
    neck="Anu Torque",
    waist="Windbuffet Belt +1",
    left_ear="Sherida Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
	
	--[[sets.engaged.HasteCap = {
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
		left_ear="Sherida Earring",
		right_ear="Crepuscular Earring",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}]]
		
	--[[sets.engaged.HasteCap.DT = {    
		main="Naegling",
		sub="Ammurapi Shield",
		ammo={ name="Coiste Bodhar", augments={'Path: A',}},
		head="Malignance Chapeau",
		body="Malignance Tabard",
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Anu Torque",
		waist="Windbuffet Belt +1",
	    left_ear="Sherida Earring",
		right_ear="Dedition Earring",
		left_ring="Petrov Ring",
		right_ring="Defending Ring",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}},}
		
	sets.engaged.Savage_TP_Cape = {back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Phys. dmg. taken-10%',}},
	]]
	
	
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
	
	if spell.english == 'Impact' then
		equip(sets.precast.FC.Impact)
    end
	
	if spell.english == 'Impact' and (buffactive['Spontaneity'] or buffactive['Chainspell']) then
		sets.precast.FC.Impact = sets.precast.FC.ImpactQC
    elseif spell.english == 'Impact' then
		sets.precast.FC.Impact = sets.precast.FC.Impact2
	end
		
	if (buffactive['Spontaneity'] or buffactive['Chainspell']) and (spell.english ~= "Impact" or spell.type:lower() == 'weaponskill') then
		eventArgs.handled = true
	end

	if (buffactive['Spontaneity'] or buffactive['Chainspell']) then
        eventArgs.handled = true

	end

	return
	
end

function job_post_precast(spell, action, spellMap, eventArgs)

	if (spell.type:lower() == 'weaponskill' and (spell.english == 'Sanguine Blade' or spell.english == 'Red Lotus Blade' or spell.english == 'Shining Blade' or spell.english == 'Seraph Blade')) 
		and (spell.element == world.weather_element) and world.weather_intensity == 2 then
			equip(sets.Obi)
	end

	if (buffactive['Spontaneity'] or buffactive['Chainspell']) then
        eventArgs.handled = true

	end
	
	if (spell.english == 'Seraph Blade' or spell.english == 'Shining Blade' or spell.english == 'Red Lotus Blade') and player.tp >= 2800 then
			equip({ear1="Regal Earring",})
	end
	
	if (spell.english == 'Seraph Blade' or spell.english == 'Shining Blade' or spell.english == 'Red Lotus Blade') and player.tp >= 1250 then
			equip({neck="Duelist's Torque +2",})
	end
	
	if spell.type:lower() == 'weaponskill' and state.WSMode.Value == 'Skillchain' then
			equip(sets.Skillchain)
	end
	
end
	


function job_midcast(spell, action, spellMap, eventArgs)

-- Force Gravity and Gravity II to use sets.Gravity exclusively
if spell.english == 'Gravity' or spell.english == 'Gravity II' then
    equip(sets.Gravity)
    eventArgs.handled = true
    return
end


	
	if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
		if buffactive['Copy Image'] then
				windower.ffxi.cancel_buff(66)
		elseif buffactive['Copy Image (2)'] then
				windower.ffxi.cancel_buff(444)
		elseif buffactive['Copy Image (3)'] then
				windower.ffxi.cancel_buff(445)
		end
	end
	
	if spell.english == 'Impact' then
		equip(sets.midcast.Impact)
	end
	
	if spell.english == 'Stoneskin' and buffactive['Stoneskin'] then
		send_command('wait 1;input //cancel Stoneskin')
	end
	
	--[[if spell.name == 'Dia III' then
		if player.equipment.main == 'Crocea Mors' then
			send_command('send Captainrayfus ;wait1.5;send Captainrayfus /ma "Geo-Malaise" <bt>;wait 0.5;send Captainrayfus /ma "Frazzle" <bt>')
		end
	
		if player.equipment.main == 'Sequence' then
			send_command('send Captainrayfus ;wait1.5;send Captainrayfus /ma "Geo-Frailty" <bt>;wait 0.5;send Captainrayfus /ma "Frazzle" <bt>')
		end
		
		if player.equipment.main == 'Almace' then
			send_command('send Captainrayfus ;wait1.5;send Captainrayfus /ma "Geo-Frailty" <bt>;wait 0.5;send Captainrayfus /ma "Frazzle" <bt>')

		end
		
		if player.equipment.main == 'Kaja Sword' then
			send_command('send Captainrayfus ;wait1.5;send Captainrayfus /ma "Geo-Frailty" <bt>;wait 0.5;send Captainrayfus /ma "Frazzle" <bt>')
		end
		
		if player.equipment.main == 'Kaja Rod' then
			send_command('send Captainrayfus ;wait1.5;send Captainrayfus /ma "Geo-Frailty" <bt>;wait 0.5;send Captainrayfus /ma "Frazzle" <bt>')
		end
		
	end]]

	
	if spell.skill == 'Enfeebling Magic' and not (spell.english == "Gravity II" or spell.english == "Gravity") and state.Enfeeb.Value == 'Accuracy' then
		equip(sets.midcast['Enfeebling Magic'].Accuracy)
		
	elseif spell.skill == 'Enfeebling Magic' and not (spell.english == "Gravity II" or spell.english == "Gravity") and state.Enfeeb.Value == 'Potency' then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end


	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Gravity'])
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Gravity II'])
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.Gravity)
	end
end


function job_post_midcast(spell, action, spellMap, eventArgs)

-- Force Gravity and Gravity II to use sets.Gravity exclusively
if spell.english == 'Gravity' or spell.english == 'Gravity II' then
    equip(sets.Gravity)
    eventArgs.handled = true
    return
end

	
	
	if spell.type == "Trust" and buffactive['Elvorseal'] then
		equip(sets.midcast.TrustDI)
	end

	if spell.skill == 'Enfeebling Magic' and not (spell.english == "Gravity II" or spell.english == "Gravity") and state.Enfeeb.Value == 'Accuracy' then
		equip(sets.midcast['Enfeebling Magic'].Accuracy)
	elseif spell.skill == 'Enfeebling Magic' and not (spell.english == "Gravity II" or spell.english == "Gravity") and state.Enfeeb.Value == 'Potency' then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end
	
	if spell.english == "Dia III" or spell.english == "Dia II" or spell.english == "Dia" or spell.english == "Diaga" then
		equip(set_combine(sets.midcast['Enfeebling Magic'].Potency, sets.Dia))
	end

	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Gravity'])
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.midcast['Gravity II'])
	end
	if spell.english == "Gravity II" or spell.english == "Gravity" then
		equip(sets.Gravity)
	end

	if spell.english:startswith('En') then 
		equip(sets.midcast['Enhancing Magic'].Skill)
	end
	
	if spell.skill == 'Elemental Magic' and spell.english ~= 'Impact' and (player.mp-spell.mp_cost) < 600 then
		equip(sets.ConsMP)
	end	
	


	
	if spell.skill == 'Healing Magic' and (spell.element == world.weather_element or spell.element == world.day_element) and spell.target.type == 'PLAYER' then
		equip(set_combine(sets.midcast.Cure, sets.Obi))
	end
	
	if spell.english == "Temper" or spell.english == "Temper II" then
		equip(sets.midcast['Enhancing Magic'].Skill)
	end
	
	if spell.english == "Frazzle II" or spell.english == "Distract II" or spell.english == "Distract" then
		equip(sets.midcast['Enfeebling Magic'].Accuracy)
	end


	
	
	if spell.english == "Frazzle" and state.WeaponLockMode.value ~= 'Locked' then
		equip(sets.midcast['Enfeebling Magic'].MaxAccuracy)
	elseif spell.english == "Frazzle" and state.WeaponLockMode.value == 'Locked' then
		equip(set_combine(sets.midcast['Enfeebling Magic'].MaxAccuracy, sets.MaccAmmo))
	end
	
	if spell.english == "Repose" then
		equip(sets.midcast.Repose)
	end
	
	if spell.english == "Frazzle III" or (spell.english == "Distract III" and (state.Enfeeb.Value == 'Accuracy' or state.Enfeeb.Value == 'Potency')) then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end
	
	if spell.english:startswith('En') then
		equip(sets.midcast['Enhancing Magic'].Skill)
	end
	
	if spell.english == "Invisible" or spell.english == "Sneak" then 
		equip(sets.midcast['Enhancing Magic'])
	end
	
	if spell.skill == 'Enhancing Magic' and buffactive['Composure'] and spell.target.type == 'PLAYER' then
		equip(sets.buff.ComposureOther)
	end	
	
	if spell.action_type == "Magic" and spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
	end
	
	if (spell.english == "Phalanx" or spell.english == "Phalanx II") and spell.target.type == 'SELF' then
		equip(sets.midcast.PhalanxSelf)
	end
	
	if spell.skill == "Enhancing Magic" and 
		spell.english:startswith('Gain') then
		equip(sets.midcast['Enhancing Magic'].GainSpell)
	elseif ((spell.english:startswith('Haste') or spell.english:startswith("Flurry")
		or spell.english == 'Sneak' or spell.english == 'Invisible' or 
		spell.english == 'Deodorize') and spell.target.type == 'SELF') then
        equip(sets.midcast['Enhancing Magic'].SelfDuration)
	elseif spell.english:startswith('Regen') then
		equip(sets.midcast.Regen)
	end
	
	if spell.skill == 'Enfeebling Magic' and buffactive['Stymie'] then
		equip(sets.midcast['Enfeebling Magic'].Potency)
	end
	
	if (spell.english:startswith("Break") or spell.english == 'Bind' or spell.english == 'Dispel'
		or spell.english == 'Inundation' or spell.english == 'Silence' or spell.english == 'Stun') and state.WeaponLockMode.value ~= 'Locked' then
		equip(sets.midcast['Enfeebling Magic'].MaxAccuracy)
	elseif (spell.english:startswith("Break") or spell.english == 'Bind' or spell.english == 'Dispel'
		or spell.english == 'Inundation' or spell.english == 'Silence' or spell.english == 'Stun') and state.WeaponLockMode.value == 'Locked' then
		equip(set_combine(sets.midcast['Enfeebling Magic'].MaxAccuracy, sets.MaccAmmo))
	end
	
	if spell.english:startswith("Sleep") then
		equip(sets.midcast.Sleep)
	end
	
	if (spell.skill == 'Enfeebling Magic' and buffactive['Saboteur']) and not (spell.english:startswith("Break") 
		or spell.english:startswith("Break") or spell.english == 'Bind' or spell.english == 'Dispel'
		or spell.english == 'Inundation' or spell.english == 'Silence' or spell.english == 'Stun' or spell.english == "Frazzle II" or spell.english == "Distract II" or spell.english == "Distract") then
			equip(sets.Saboteur)
	end
		

	
	if spell.english == "Refresh" or spell.english == "Refresh II" or spell.english == "Refresh III" then
		equip(sets.midcast.Refresh)
	end
	
	if spell and (spell.name == 'Utsusemi: Ni' or spell.name == 'Utsusemi: Ichi') and player.equipment.main == 'Crocea Mors' then
		equip(sets.midcast.UtsusemiDT)
	end
	
	--[[if spell.english:startswith('En') and ((spell.element == world.weather_element and world.weather_intensity == 2) or (spell.element == world.weather_element and spell.element == world.day_element)) then
		send_command('gs c set EnWeatherMatch Matched')
	elseif spell.english:startswith('En') then
		send_command('gs c set EnWeatherMatch Default')
	end]]
	
end


function job_aftercast(spell, action, spellMap, eventArgs)

	if not spell.interrupted then
		if (spell.english == "Sleep II" or spell.english == "Sleepga II") and buffactive['Saboteur'] then -- Sleep II Countdown --
			send_command('wait 206;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 1 SEC.]')
		elseif spell.english == "Sleep II" or spell.english == "Sleepga II" then -- Sleep & Sleepga Countdown --
			send_command('wait 135;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 1 SEC.]')
		end
		
		if (spell.english == "Sleep" or spell.english == "Sleepga") and buffactive['Saboteur'] then -- Sleep II Countdown --
			send_command('wait 190;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 1 SEC.];wait 18;input /echo Sleep Effect: [Wearing off in 5 seconds (backup)]')
		elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
			send_command('wait 90;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Sleep Effect: [WEARING OFF IN 1 SEC.]')
		end
		
		if (spell.english == "Break" or spell.english == "Breakga") and buffactive['Saboteur'] then -- Break Countdown --
			send_command('wait 69;input /echo Break Effect: [WEARING OFF IN 10 SEC.];wait 5;input /echo Break Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 1 SEC.]')
		elseif spell.english == "Break" or spell.english == "Breakga" then -- Break Countdown --
			send_command('wait 58;input /echo Break Effect: [WEARING OFF IN 10 SEC.];wait 5;input /echo Break Effect: [WEARING OFF IN 5 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 4 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 3 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 2 SEC.];wait 1;input /echo Break Effect: [WEARING OFF IN 1 SEC.]')
		end
	end
	

	--[if player.sets == 'Gravity II' then send_command(input /echo  '[GRAVITY SET EQUIPPED]')
	--[end


	--if spell.action_type == 'Item' then
     --   eventArgs.handled = false
   -- end
   
	if spell and spell.name == 'Utsusemi: Ni' then
		ShadowType = 'Ni'
	elseif spell and spell.name == 'Utsusemi: Ichi' then
		ShadowType = 'Ichi'
	end
	
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
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
	
end

function job_get_spell_map(spell, default_spell_map)
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------







function control_geo_mule()

end


function customize_melee_set(meleeSet)


    --[[if (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value == 'DT' then
		meleeSet = set_combine(meleeSet, sets.engaged.HasteCap, sets.engaged.HasteCap.DT)
	elseif (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value ~= 'Shield' then
        meleeSet = set_combine(meleeSet, sets.engaged.HasteCap)
    end]]
	
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
	
	if (buffactive['Enfire'] or  buffactive['Enblizzard'] or buffactive['Enwater'] or buffactive['Enthunder'] or buffactive['Enstone'] or buffactive['Enaero']) and not (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) then
		meleeSet = set_combine(meleeSet, sets.Enspell)
	elseif (buffactive['Enfire'] or  buffactive['Enblizzard'] or buffactive['Enwater'] or buffactive['Enthunder'] or buffactive['Enstone'] or buffactive['Enaero']) then
		meleeSet = set_combine(meleeSet, sets.Enspell.HasteCap)
	end
	
	if ((buffactive['Enfire'] or  buffactive['Enblizzard'] or buffactive['Enwater'] or buffactive['Enthunder'] or buffactive['Enstone'] or buffactive['Enaero']) and not (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) and state.EnWeatherMatch.value == 'Matched') then
		meleeSet = set_combine(meleeSet, sets.Enspell.Obi)
	elseif ((buffactive['Enfire'] or  buffactive['Enblizzard'] or buffactive['Enwater'] or buffactive['Enthunder'] or buffactive['Enstone'] or buffactive['Enaero']) and state.EnWeatherMatch.value == 'Matched') then
		meleeSet = set_combine(meleeSet, sets.Enspell.HasteCap.Obi)
	end
	
	if state.SubtleBlow.value == 'On' and not (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) then
		meleeSet = set_combine(meleeSet, sets.SubtleBlow)
	elseif state.SubtleBlow.value == 'On' and (buffactive['Embrava'] or buffactive['March'] or buffactive[580] or buffactive['Mighty Guard']) then
		meleeSet = set_combine(meleeSet, sets.SubtleBlow.HasteCap)
	end
	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if buffactive['Elvorseal'] then 
		meleeSet = set_combine(meleeSet, sets.Domain)
	end
	

	if state.DamageMode.value == 'Unlocked' then
		meleeSet = set_combine(meleeSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Shikargar' then
		meleeSet = set_combine(meleeSet, sets.Shikargar)
	elseif state.DamageMode.value == 'Crocea' then
		meleeSet = set_combine(meleeSet, sets.Crocea)
	elseif state.DamageMode.value == 'Savage' then
		meleeSet = set_combine(meleeSet, sets.Savage)
	elseif state.DamageMode.value == 'Excalibur' then
		meleeSet = set_combine(meleeSet, sets.Excalibur)
	elseif state.DamageMode.value == 'Blunt' then
		meleeSet = set_combine(meleeSet, sets.Blunt)
	elseif state.DamageMode.value == 'Aeolian' then
		meleeSet = set_combine(meleeSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		meleeSet = set_combine(meleeSet, sets.Lv1Dagger)
	end

if state.Moving and state.Moving.current == 'true' then
    meleeSet = set_combine(meleeSet, sets.MoveSpeed)
end
	return meleeSet
	
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    
	if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
	elseif state.IdleMode.value == 'Town' then
		idleSet = sets.idle.Town
	elseif state.IdleMode.value == 'Shield' then
		idleSet = sets.idle.Shield
	elseif state.IdleMode.value == 'Normal' then
		idleSet = sets.idle.Normal
	elseif state.IdleMode.value == 'DT' then
		idleSet = sets.idle.DT
	elseif state.IdleMode.value == 'SIRD' then
		idleSet = sets.idle.SIRD
	elseif state.IdleMode.value == 'Aminon' then
		idleSet = sets.idle.Aminon
    end
	
	if state.Kiting.value == 'true' and state.IdleMode.value == 'Normal' then 
		idleSet = set_combine(idleSet, sets.Kite)
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
	elseif state.DamageMode.value == 'Shikargar' then
		idleSet = set_combine(idleSet, sets.Shikargar)
	elseif state.DamageMode.value == 'Crocea' then
		idleSet = set_combine(idleSet, sets.Crocea)
	elseif state.DamageMode.value == 'Savage' then
		idleSet = set_combine(idleSet, sets.Savage)
	elseif state.DamageMode.value == 'Excalibur' then
		idleSet = set_combine(idleSet, sets.Excalibur)
	elseif state.DamageMode.value == 'Blunt' then
		idleSet = set_combine(idleSet, sets.Blunt)
	elseif state.DamageMode.value == 'Aeolian' then
		idleSet = set_combine(idleSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		idleSet = set_combine(idleSet, sets.Lv1Dagger)
		return idleSet
	end
	
		if state.HippoMode.value == 'On' then 
			idleSet = sets.Hippomenes
		return idleSet
	end

if state.Moving and state.Moving.current == 'true' then
    idleSet = set_combine(idleSet, sets.MoveSpeed)
end
	
	
    return idleSet
	
end

function equip_gear_by_status(status)

end

windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
		send_command('setbgm 25')
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


---------------------------------------------------------------------------------------------------
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
	shih="Shihei",
    holy="Holy Water",
    ether="Coalition Ether",
    soda="Frontier Soda",
    oil="Silent Oil",
    oil2="Silent Oil",
    prism="Prism Powder",
    prism2="Prism Powder",
	rr="Airmid's Gorget",
    }


pcall(function()
    if shared_job_table then
        shared_job_table.render(true)
    end
end)

pcall(function()
    if not lagguard then return end

    local ui_interval = 0.25

    if type(update_text) == 'function' then
        update_text = lagguard.wrap('update_text', ui_interval, update_text)
    end

    if type(ui_render) == 'function' then
        ui_render = lagguard.wrap('ui_render', ui_interval, ui_render)
    end

    if type(refreshwindow) == 'function' then
        refreshwindow = lagguard.wrap('refreshwindow', ui_interval, refreshwindow)
    end

    if type(display_box) == 'function' then
        display_box = lagguard.wrap('display_box', ui_interval, display_box)
    end

    if type(update_display) == 'function' then
        update_display = lagguard.wrap('update_display', ui_interval, update_display)
    end

    if type(update_hud) == 'function' then
        update_hud = lagguard.wrap('update_hud', ui_interval, update_hud)
    end
end)

local function state_value(name)
    if not state or not state[name] then return '' end

    if state[name].value ~= nil then
        return state[name].value
    elseif state[name].current ~= nil then
        return state[name].current
    else
        return tostring(state[name])
    end
end

function get_state_value_for_table(name)
    if not state or not state[name] then
        return ''
    end

    if state[name].current ~= nil then
        return tostring(state[name].current)
    end

    if state[name].value ~= nil then
        return tostring(state[name].value)
    end

    return tostring(state[name])
end

function get_state_value_for_table(name)
    if not state or not state[name] then
        return ''
    end

    if state[name].current ~= nil then
        return tostring(state[name].current)
    end

    if state[name].value ~= nil then
        return tostring(state[name].value)
    end

    return tostring(state[name])
end

job_table_config = {
    title = 'RDM GearSwap',
    rows = {
        {'F10 Idle Mode', function() return get_state_value_for_table('IdleMode') end},
        {'F9 Offense', function() return get_state_value_for_table('OffenseMode') end},
        {'^F11 Casting', function() return get_state_value_for_table('CastingMode') end},
        {'F6 Damage', function() return get_state_value_for_table('DamageMode') end},
        {'F7 Weapon Lock', function() return get_state_value_for_table('WeaponLockMode') end},
        {'F11 Enfeeb', function() return get_state_value_for_table('Enfeeb') end},
        {'F8 WS Mode', function() return get_state_value_for_table('WSMode') end},
        {'^F9 Engaged Move', function() return get_state_value_for_table('EngagedMoving') end},
        {'@F9 Kiting', function() return get_state_value_for_table('Kiting') end},
        {'Moving', function() return get_state_value_for_table('Moving') end},
    }
}

if shared_job_table then
    shared_job_table.refresh_interval = 0.50
    shared_job_table.setup()
    shared_job_table.render(true)
end