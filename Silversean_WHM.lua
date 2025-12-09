-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
  
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
setupTextWindow(1700, 1150)
    state.Buff['Afflatus Solace'] = buffactive['Afflatus Solace'] or false
    state.Buff['Afflatus Misery'] = buffactive['Afflatus Misery'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.


function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('SIRD', 'Normal', 'DT', 'OdysseyV25')
    state.IdleMode:options('Normal', 'DT', 'Refresh')
	state.WeaponLockMode = M('Unlocked', 'Locked')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.Moving = M('false', 'true')

    select_default_macro_book()
end

	send_command('bind ^f7 gs c cycle SubtleBlow')
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f6 gs c cycle DamageMode; gs enable sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f6 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f7 gs c cycle CastingMode')
	send_command('bind f8 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind f7 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind !f8 gs c cycle WSMode')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind ^` input /spontaneity;wait 1.1;input /impact <stnpc>')
	
function user_unload()
	send_command('unbind insert')
	send_command('unbind ^e')
end

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
    sets.MoveSpeed = {feet="Herald's Gaiters",}

	--Extend Phantom Roll area of effect.  (16 yalms vs 8 yalms without)
	sets.Luzaf = {ring1="Luzaf's Ring"}
	
	sets.Obi = {waist="Hachirin-no-Obi",}
	
	sets.Orpheus = {waist="Orpheus's Sash"}
	











-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {
    main={ name="Grioavolr", augments={'"Fast Cast"+7',}},
    sub="Clerisy Strap +1",
    ammo="Incantor Stone",
    head="Ebers Cap +3",
    body="Volte Doublet",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs="Pinga Pants",
    feet="Regal Pumps +1",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Loquac. Earring",
    right_ear="Malignance Earring",
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
    back="Perimede Cape",
}
       
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
		
		
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastRecast, {neck="Noden's Gorget",waist="siegel sash"})
		
    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {back="pahtli cape"})
	
    sets.precast.FC.StatusRemoval = sets.precast.FC['Healing Magic']

    sets.precast.FC.Cure = sets.precast.FC['Healing Magic']
    sets.precast.FC.Curaga = sets.precast.FC.Cure
    sets.precast.FC.CureSolace = sets.precast.FC.Cure

    -- CureMelee spell map should default back to Healing Magic.
   
    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {}
	sets.precast.JA.Devotion = {}
	
    -- Waltz set (chr and vit)
    --sets.precast.Waltz = {
     --   head="Nahtirah Hat",ear1="Roundel Earring",
      --  body="Vanir Cotehardie",hands="Yaoyotl Gloves",
     --   back="Refraction Cape",legs="Gendewitha Spats +1",feet="Gendewitha Galoshes +1"}
   
  
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    gear.default.weaponskill_neck = "Asperity Necklace"
    gear.default.weaponskill_waist = "Grunfeld Rope"
    sets.precast.WS = {}
    
    sets.precast.WS['Flash Nova'] = {} 
  
    -- Midcast Sets
 
    sets.midcast.FastRecast = {main="C. palug hammer", sub="Chanter's shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Pinga tunic",
		hands={ name="Helios Gloves", augments={'"Fast Cast"+5',}},
		legs="Pinga pants",
		feet="Regal Pumps +1",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape"}
    
    -- Cure sets
    --gear.default.obi_waist = "Olympus Sash"
    --gear.default.obi_back = "Mending Cape"
	
	sets.midcast.SIRD = {
		main="Bunzi's Rod",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
		body="Ros. Jaseran +1",
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
		feet="Ebers Duckbills +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Null Belt",
		left_ear="Halasz Earring",
		right_ear="Ebers earring +2", 
		left_ring="Freke Ring",
		right_ring="Evanescence Ring",
		back="Solemnity Cape",
}
	

	sets.midcast.OdysseyV25 = {
		main="C. Palug Hammer",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Ebers Cap +3",
		body="Ros. Jaseran +1",
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist="Emphatikos Rope",
		left_ear="Magnetic Earring",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Defending Ring",
		right_ring="Freke Ring",
		back="Alaunus's Cape",
	}


    sets.midcast.CureSolace = {
		main="Chatoyant Staff",
		sub="Umbra Strap",
		ammo="Hydrocera",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		legs="Ebers Pant. +3",
		feet={ name="Kaykaus Boots", augments={'Mag. Acc.+15','"Cure" potency +5%','"Fast Cast"+3',}},
		neck="Incanter's Torque",
		waist="Hachirin-no-Obi",
		left_ear="Nourish. Earring +1",
		right_ear="Glorious Earring",
		left_ring="Lebeche Ring",
		right_ring="Stikini Ring +1",
		back="Twilight Cape"}
	

    sets.midcast.Cure = {
		main="Chatoyant Staff",
		sub="Umbra Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		body="Ebers Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
		legs="Ebers Pant. +3",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
		left_ear="Nourish. Earring +1",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Naji's Loop",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Alaunus's Cape",
}

    sets.midcast.Curaga = {
		main="Chatoyant Staff",
		sub="Umbra Strap",
		ammo="Pemphredo Tathlum",
		head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
		body="Ebers Bliaut +3",
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
		legs="Ebers Pant. +3",
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
		left_ear="Nourish. Earring +1",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Naji's Loop",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back="Alaunus's Cape",
}

	sets.midcast.CureSolace.SIRD = set_combine(sets.midcast.CureSolace, {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +3",
    body="Ros. Jaseran +1",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
    left_ring="Defending Ring",
    right_ring="Freke Ring",
    back="Alaunus's Cape",
})
	sets.midcast.Cure.SIRD = set_combine(sets.midcast.Cure, {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Ebers Cap +3",
    body="Ros. Jaseran +1",
    hands="Ebers Mitts +3",
    legs="Ebers Pant. +3",
    feet="Ebers Duckbills +3",
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
    left_ring="Defending Ring",
    right_ring="Freke Ring",
    back="Alaunus's Cape",
})
	sets.midcast.Curaga.SIRD = set_combine(sets.midcast.Curaga, {})
	
	
	sets.midcast.CureSolace.DT = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body="Ebers Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}
	sets.midcast.Cure.DT = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body="Ebers Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}
	sets.midcast.Curaga.DT = set_combine(sets.midcast.Curaga, {})

    sets.midcast.CureMelee = sets.midcast.Cure
	
	sets.midcast.CureMelee.SIRD = set_combine(sets.midcast.Cure, {})

	sets.midcast.CureMelee.DT = {
    ammo="Staunch Tathlum +1",
    head={ name="Kaykaus Mitra +1", augments={'MP+80','MND+12','Mag. Acc.+20',}},
    body="Ebers Bliaut +3",
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs="Ebers Pant. +3",
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck={ name="Clr. Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Nourish. Earring +1",
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}


	sets.midcast.Cure.OdysseyV25 = {
		main="C. Palug Hammer",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Ebers Cap +3",
		body="Ros. Jaseran +1",
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist="Emphatikos Rope",
		left_ear="Magnetic Earring",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Defending Ring",
		right_ring="Freke Ring",
		back="Alaunus's Cape",
	}

	sets.midcast.Curaga.OdysseyV25 =  {
		main="C. Palug Hammer",
		sub="Genmei Shield",
		ammo="Staunch Tathlum +1",
		head="Ebers Cap +3",
		body="Ros. Jaseran +1",
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist="Emphatikos Rope",
		left_ear="Magnetic Earring",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Defending Ring",
		right_ring="Freke Ring",
		back="Alaunus's Cape",
	}
	
    sets.midcast.Cursna = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaut +3",
		hands={ name="Fanatic Gloves", augments={'MP+5','Healing magic skill +2','"Fast Cast"+1',}},
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Debilis Medallion",
		waist="Hachirin-no-Obi",
		left_ear="Loquac. Earring",
		right_ear="Beatific Earring",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back="Perimede Cape",
}

	sets.midcast.Cursna.SIRD = set_combine(sets.midcast.Cursna, {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Impatiens",
		head={ name="Vanya Hood", augments={'MP+50','"Fast Cast"+10','Haste+2%',}},
		body="Ebers Bliaut +3",
		hands={ name="Fanatic Gloves", augments={'MP+5','Healing magic skill +2','"Fast Cast"+1',}},
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Debilis Medallion",
		waist="Hachirin-no-Obi",
		left_ear="Loquac. Earring",
		right_ear="Beatific Earring",
		left_ring="Haoma's Ring",
		right_ring="Menelaus's Ring",
		back="Perimede Cape",})
	
	sets.midcast.Cursna.DT = set_combine(sets.midcast.Cursna, {})
	
	

    sets.midcast.StatusRemoval = {
		main="Yagrush",
		sub="Sors Shield",
		ammo="Impatiens",
		head="Ebers Cap +3",
		body="Shango Robe",
		hands={ name="Helios Gloves", augments={'"Fast Cast"+5',}},
		legs="Ebers Pant. +3",
		feet="Regal Pumps +1",
		neck={ name="Clr. Torque +1", augments={'Path: A',}},
		waist="Witful Belt",
		left_ear="Loquac. Earring",
		right_ear="Malignance Earring",
		left_ring="Prolix Ring",
		right_ring="Kishar Ring",
		back="Perimede Cape",
}

	sets.midcast.StatusRemoval.SIRD = set_combine(sets.midcast.SIRD, {		main="Yagrush",
		sub="Sors Shield",})



	sets.midcast.DT = {
    ammo="Staunch Tathlum +1",
    head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
    body="Ros. Jaseran +1",
    hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Ebers Duckbills +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear="Halasz Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Freke Ring",
    right_ring="Defending Ring",
    back="Solemnity Cape",
}
    -- 110 total Enhancing Magic Skill; caps even without Light Arts

    sets.midcast['Enhancing Magic'] = {
		main={ name="Grioavolr", augments={'Enfb.mag. skill +13','INT+1','Mag. Acc.+22','Magic Damage +2',}},
		sub="Umbra Strap",
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape",
}

	sets.midcast['Enhancing Magic'].SIRD = set_combine(sets.midcast.SIRD, {})

    sets.midcast.Stoneskin = {
		ammo="Hydrocera",
		head="Aya. Zucchetto +1",
		body="Ayanmo Corazza",
		hands="Aya. Manopolas +2",
		legs="Gyve Trousers",
		feet="Aya. Gambieras +1",
		neck="Twilight Torque",
		waist="Luminary Sash",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape"}
		
	sets.midcast.Stoneskin.SIRD = set_combine(sets.midcast.SIRD, {})
		
    sets.midcast.Auspice = {feet="Ebers Duckbills +3"}
	
	sets.midcast.Auspice.SIRD = set_combine(sets.midcast.SIRD, {})

    sets.midcast.BarElement = {
		main="Beneficus",
		sub="Sors Shield",
		ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs={ name="Piety Pantaln. +3", augments={'Enhances "Afflatus Misery" effect',}},
		feet="Ebers Duckbills +3",
		neck="Nodens Gorget",
		waist="Siegel Sash",
		left_ear="Mimir Earring",
		right_ear="Earthcry Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}

	sets.midcast.Sublimation = {waist="Embla Sash"}

    sets.midcast.Regen = {
    main="Bolelabunga",
    sub="Ammurapi Shield",
    ammo="Hydrocera",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
    body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'"Cure" potency +4%','"Regen" potency+3',}},
    legs="Pinga Pants",
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Perimede Cape",
}
		
	sets.midcast.Regen.SIRD = set_combine(sets.midcast.SIRD, {})

    sets.midcast.Protectra = {	ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands="Telchine Gloves",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape"}
		
	sets.midcast.Protectra.SIRD = set_combine(sets.midcast.SIRD, {})
	
    sets.midcast.Shellra = {ammo="Hydrocera",
		head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +9',}},
		hands="Telchine Gloves",
		legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
		feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +9',}},
		neck="Incanter's Torque",
		waist="Witful Belt",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Perimede Cape"}
		
	sets.midcast.Shellra.SIRD = set_combine(sets.midcast.SIRD, {})
	
    sets.midcast['Divine Magic'] = {main="Yagrush",
		sub="Sors Shield",
		ammo="Hydrocera",
		head="Aya. Zucchetto +1",
		body="Shango Robe",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Enmity-2','Mag. Acc.+14',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
		feet="Aya. Gambieras +1",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Ogapepo Cape",
}

	sets.midcast['Divine Magic'].SIRD = set_combine(sets.midcast.SIRD, {})

    sets.midcast['Dark Magic'] = {main="Yagrush",
		sub="Sors Shield",
		ammo="Hydrocera",
		head="Aya. Zucchetto +1",
		body="Shango Robe",
		hands={ name="Chironic Gloves", augments={'Mag. Acc.+18 "Mag.Atk.Bns."+18','Enmity-2','Mag. Acc.+14',}},
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
		feet="Aya. Gambieras +1",
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Ogapepo Cape",
}
	
	sets.midcast['Dark Magic'].SIRD = set_combine(sets.midcast.SIRD, {})

    -- Custom spell classes
    sets.midcast.MndEnfeebles ={
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Clerisy Strap +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Crep. Earring",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}

	sets.midcast.MndEnfeebles.SIRD = set_combine(sets.midcast.SIRD, {})

    sets.midcast.IntEnfeebles = {
		main={ name="Marin Staff +1", augments={'Path: A',}},
		sub="Clerisy Strap +1",
		ammo="Pemphredo Tathlum",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs="Ebers Pant. +3",
		feet="Ebers Duckbills +3",
		neck="Null Loop",
		waist="Null Belt",
		left_ear="Crep. Earring",
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
   
	sets.midcast.IntEnfeebles.SIRD = set_combine(sets.midcast.SIRD, {})
   
    -- Sets to return to when not performing an action.
   
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
		sub="Umbra Strap",
		ammo="Hydrocera",
		head="Befouled Crown",
		body="Ebers Bliaut +3",
		hands="Serpentes Cuffs",
		legs={ name="Chironic Hose", augments={'Mag. Acc.+30','CHR+8',}},
		feet="Serpentes Sabots",
		neck="Twilight Torque",
		waist="Gishdubar Sash",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
    sets.idle = {
    ammo="Homiliary",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ebers Bliaut +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}


	sets.idle.Refresh = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    body="Ebers Bliaut +3",
    hands="Ebers Mitts +3",
    legs="Assid. Pants +1",
    feet="Ebers Duckbills +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}



	sets.idle.DT = {
    main="Malignance Pole",
    sub="Clerisy Strap +1",
    ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Adamantite Armor",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Warder's Charm +1",
    waist="Carrier's Sash",
    left_ear="Odnowa Earring +1",
    right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	
	sets.idle.SIRD = {
		ammo="Staunch Tathlum +1",
		head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
		body="Ros. Jaseran +1",
		hands={ name="Chironic Gloves", augments={'"Resist Silence"+10','"Mag.Atk.Bns."+7','Chance of successful block +7',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
		feet="Ebers Duckbills +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Null Belt",
		left_ear="Halasz Earring",
		right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		left_ring="Freke Ring",
		right_ring="Defending Ring",
		back="Solemnity Cape",
}
	
    sets.idle.Town = {main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Staunch tathlum +1",
		head="Ebers Cap +3",
		body="Ebers Bliaut +3",
		hands="Ebers Mitts +3",
		legs="Ebers pantaloons +3",
		feet="Ebers Duckbills +3",
		neck="Loricate Torque +1",
		waist="Null Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Ebers Earring +2", augments={'System: 1 ID: 1676 Val: 0','Accuracy+17','Mag. Acc.+17','Damage taken-6%','STR+9 MND+9',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
		
    sets.idle.Weak = {main="Malignance Pole",
		sub="Umbra Strap",
		ammo="Hydrocera",
		head="Befouled Crown",
		body="Ebers Bliaut +3",
		hands="Aya. Manopolas +2",
		legs="Gyve Trousers",
		feet="Aya. Gambieras +1",
		neck="Twilight Torque",
		waist="Fucho-no-Obi",
		left_ear="Beatific Earring",
		right_ear="Malignance Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Solemnity Cape",
}
    
	


    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Basic set for if no TP weapon is defined.
   sets.engaged = {}


    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +3",back="Mending Cape"}
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spell.english == "Paralyna" and buffactive.Paralyzed then
        -- no gear swaps if we're paralyzed, to avoid blinking while trying to remove it.
        eventArgs.handled = true
    end
    
    if spell.skill == 'Healing Magic' then
        gear.default.obi_back = "Mending Cape"
    else
        gear.default.obi_back = "Toro Cape"
    end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
    -- Apply Divine Caress boosting items as highest priority over other gear, if applicable.
    if spellMap == 'StatusRemoval' and buffactive['Divine Caress'] then
        equip(sets.buff['Divine Caress'])
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if (default_spell_map == 'Cure' or default_spell_map == 'Curaga') and player.status == 'Engaged' then
            return "CureMelee"
        elseif default_spell_map == 'Cure' and state.Buff['Afflatus Solace'] then
            return "CureSolace"
        elseif spell.skill == "Enfeebling Magic" then
            if spell.type == "WhiteMagic" then
                return "MndEnfeebles"
            else
                return "IntEnfeebles"
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end


-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not areas.Cities:contains(world.area) then
        local needsArts = 
            player.sub_job:lower() == 'sch' and
            not buffactive['Light Arts'] and
            not buffactive['Addendum: White'] and
            not buffactive['Dark Arts'] and
            not buffactive['Addendum: Black']
            
        if not buffactive['Afflatus Solace'] and not buffactive['Afflatus Misery'] then
            if needsArts then
                send_command('@input /ja "Afflatus Solace" <me>;wait 1.2;input /ja "Light Arts" <me>')
            else
                send_command('@input /ja "Afflatus Solace" <me>')
            end
        end
    end
end


-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    set_macro_page(3, 3)
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


	  if stateField == 'DamageMode' then
        if newValue == 'Unlocked' then
            send_command('wait 0.4;gs c set WeaponLockMode Unlocked')
        end
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
		textinbox = textinbox .. textColor .. "Casting Mode (CTRL+F7) : " .. tostring(state.CastingMode.current) .. textColorNewLine
        textinbox = textinbox .. textColor .. "Idle Mode (F8) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		
	
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
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
			textinbox = textinbox .. textColor .. "Kiting Mode : " .. tostring(state.Kiting.current) .. textColorNewLine
			


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
	


mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
end


if state.Moving.value == 'true' then
		idleSet = set_combine(idleSet, sets.MoveSpeed)
	end
	

moving = false
windower.raw_register_event('prerender',function()
    mov.counter = mov.counter + 1;
    if mov.counter>25 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
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
				send_command('gs c update')
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

