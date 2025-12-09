-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    include('organizer-lib')
end
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.CastingMode:options('Normal', 'Weather' , 'Burst')
    state.OffenseMode:options('Normal', 'DT', 'Shield', 'ShieldTP', 'Enspell', 'NoDW')
	state.DamageMode = M('Unlocked','Shikargar','Crocea', 'Savage', 'Excalibur', 'Blunt', 'Aeolian','Lv.1 Dagger')
    state.WeaponLockMode = M('Unlocked', 'Locked')
    state.IdleMode:options('Normal','Shield','Town','DT', 'SIRD')
	state.CastingMode:options('Normal', 'Burst', 'SIRD', 'Occult')
	state.Enfeeb = M('Potency', 'Accuracy', 'Skill')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.WSMode = M('Normal','Skillchain')
	state.EngagedMoving = M('Disabled','Enabled')
	state.DoomMode = M('OFF', 'Doom')
	state.SubtleBlow = M('On', 'Off')
	state.Following = M('Follow','Stay')
    state.Moving = M('false', 'true')
	state.Kiting = M('false', 'true')
    state.EnWeatherMatch = M('Default','Matched')
 
    gear.default.weaponskill_waist = "Windbuffet Belt +1"
	
	send_command('bind f10 gs c cycle CastingMode')
 
    select_default_macro_book()
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()


    sets.MoveSpeed = {feet="Geomancy Sandals +2"}
 
    --------------------------------------
    -- Precast sets
    --------------------------------------
 
    -- Precast sets to enhance JAs-
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic +3"}
    sets.precast.JA['Full Circle'] = {head="Azimuth Hood +3"}
    sets.precast.JA['Curative Recantation'] = {hands="Bagua Mitaines"}
    sets.precast.JA['Mending Halation'] = {legs="Bagua Pants +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals +1"}
     
    -- Fast cast sets for spells
 
    sets.precast.FC = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Amalric Coif +1",
        body="Volte Doublet",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Agwu's Pigaches",
        neck="Baetyl Pendant",
        waist="Witful Belt",
        left_ear="Malignance Earring",
        right_ear="Loquac. Earring",
        left_ring="Weather. Ring",
        right_ring="Kishar Ring",
        back="Solemnity Cape",
    }
 
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Impact Cloak"})
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak"})
 
     
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Metamorph Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}}
 
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {}
 
    sets.precast.WS['Starlight'] = {}
 
    sets.precast.WS['Moonlight'] = {}
	
	sets.precast.WS['Exudation'] = {
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}}
	
	sets.precast.WS['Black Halo'] = 
	{
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Fotia Belt",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}}
	
	sets.precast.WS['Judgment'] = 
	{
	ammo="Crepuscular Pebble",
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Rep. Plat. Medal",
    waist="Prosilio Belt +1",
    left_ear="Regal Earring",
    right_ear="Moonshade Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Ephramad's Ring",
    back={ name="Nantosuelta's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Pet: Damage taken -5%',}},
	}
 
 
    --------------------------------------
    -- Midcast sets
    --------------------------------------
 
    -- Base fast recast for spells
    sets.midcast.FastRecast = {}
 
    sets.midcast.Geomancy = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Geo. Mitaines +2",
        legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +3",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +15','Pet: Damage taken -4%',}},
    }
     
    sets.midcast.Geomancy.Indi = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Geo. Mitaines +2",
        legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +3",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +15','Pet: Damage taken -4%',}},
    }
     
    sets.midcast.Cure = {
        main="Daybreak",
        sub="Ammurapi Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
        body="Vrikodara Jupon",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Agwu's Slops", augments={'Path: A',}},
        feet="Agwu's Pigaches",
        neck="Incanter's Torque",
        waist="Witful Belt",
        left_ear="Mendi. Earring",
        right_ear="Loquac. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Solemnity Cape",
    }

    sets.midcast['Enhancing Magic'] = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Ammurapi Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Befouled Crown",
        body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +10',}},
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
        neck="Incanter's Torque",
        waist="Witful Belt",
        left_ear="Malignance Earring",
        right_ear="Loquac. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Lebeche Ring",
        back="Solemnity Cape",
    }
	
	sets.midcast.Haste = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','VIT+4','Mag. Acc.+18','"Mag.Atk.Bns."+7','DMG:+18',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},}
	
	sets.midcast.Refresh = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','VIT+4','Mag. Acc.+18','"Mag.Atk.Bns."+7','DMG:+18',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Befouled Crown",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands={ name="Telchine Gloves", augments={'Enh. Mag. eff. dur. +10',}},
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
    neck="Incanter's Torque",
    waist="Gishdubar Sash",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},}
	
	 sets.midcast.Stoneskin = {
	main={ name="Gada", augments={'Enh. Mag. eff. dur. +5','VIT+4','Mag. Acc.+18','"Mag.Atk.Bns."+7','DMG:+18',}},
    sub="Ammurapi Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Umuthi Hat",
    body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +9',}},
    hands="Carapacho Cuffs",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +9',}},
    feet={ name="Telchine Pigaches", augments={'Enh. Mag. eff. dur. +9',}},
    neck="Incanter's Torque",
    waist="Witful Belt",
    left_ear="Earthcry Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},}
	
	sets.midcast['Dispelga'] = {
	main="Daybreak",
    sub="Ammurapi Shield",
    head="Geomancy Galero +3",
    body="Geomancy Tunic +3",
    hands="Regal Cuffs",
    legs="Geomancy Pants +3",
    feet="Geomancy Sandals +3",
    neck="Bagua Charm +2",
    waist="Rumination Sash",
    left_ear="Malignance Earring",
    right_ear={ name="Azimuth Earring +1", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+11','Damage taken-3%',}},
    left_ring="Stikini Ring +1",
    right_ring="Kishar Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
	}

	sets.midcast.Impact = { 
	body="Crepuscular Cloak",
    hands="Geo. Mitaines +2",
    legs="Geomancy Pants +3",
    feet="Geo. Sandals +3",
    neck={ name="Bagua Charm +2", augments={'Path: A',}},
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
	}
	
	sets.midcast['Thundara III'] = {
	head={ name="Merlinic Hood", augments={'"Mag.Atk.Bns."+17','"Occult Acumen"+11','CHR+7','Mag. Acc.+9',}},
    body={ name="Merlinic Jubbah", augments={'Mag. Acc.+11','"Occult Acumen"+11','"Mag.Atk.Bns."+6',}},
    hands={ name="Merlinic Dastanas", augments={'Mag. Acc.+22','"Occult Acumen"+11','"Mag.Atk.Bns."+13',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+27','"Occult Acumen"+11','MND+9','Mag. Acc.+5',}},
    neck="Bathy Choker +1",
    waist="Oneiros Rope",
    left_ear="Crep. Earring",
    right_ear="Dedition Earring",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Pet: Damage taken -5%',}},
	}

     
    sets.midcast.Curaga = sets.midcast.Cure
 
    sets.midcast.Protectra = {ring1="Sheltered Ring"}
 
    sets.midcast.Shellra = {ring1="Sheltered Ring"}
     
        -- Elemental Magic sets
     
    sets.midcast['Elemental Magic'] = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Ammurapi Shield",
        ammo="Ghastly Tathlum +1",
        head="Azimuth Hood +3",
        body="Azimuth Coat +3",
        hands="Azimuth Gloves +3",
        legs="Azimuth Tights +3",
        feet="Azimuth Gaiters +3",
        neck="Sibyl Scarf",
        waist="Hachirin-no-Obi",
        left_ear="Malignance Earring",
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Freke Ring",
        right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        back="Seshaw Cape",
    }


 
    sets.midcast['Elemental Magic'].Weather = {
    main="Bunzi's Rod",
    sub="Ammurapi Shield",
    ammo="Ghastly Tathlum +1",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Sibyl Scarf",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Metamorph Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Spell interruption rate down-10%',}},
}

sets.midcast['Elemental Magic'].Burst = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Sroda Tathlum",
    head="Azimuth Hood +3",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs="Azimuth Tights +3",
    feet="Azimuth Gaiters +3",
    neck="Mizu. Kubikazari",
    waist="Hachirin-no-Obi",
    left_ear="Regal Earring",
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back="Seshaw Cape",
}
 

     
    sets.midcast['Dark Magic'] = {
    --main="Marin Staff +1",
    --sub="Enki Strap",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Zendik Robe",
    hands="Agwu's Gages",
    legs="Geomancy Pants +3",
    feet="Azimuth Gaiters +3",
    neck="Erra Pendant",
    waist="Cornelia's Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="Lebeche Ring",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Fast Cast"+10',}},
}
     
 
 
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
 
    -- Resting sets
    sets.resting = {head="Nefer Khat",neck="Wiglen Gorget",
        body="Heka's Kalasiris",hands="Serpentes Cuffs",ring1="Sheltered Ring",ring2="Paguroidea Ring",
        waist="Austerity Belt",legs="Nares Trews",feet="Chelona Boots +1",back={ name="Lifestream Cape", augments={'Geomancy Skill +9','Indi. eff. dur. +11','Pet: Damage taken -3%',}},}
 
 
    -- Idle sets
 
    sets.idle = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Azimuth Coat +3",
    hands="Azimuth Gloves +3",
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Azimuth Gaiters +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape",
}

    
    sets.idle.PDT = {
    main={ name="Idris", augments={'Path: A',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet="Mallquis Clogs +1",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Null Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Shadow Mantle",
}
 
    -- .Pet sets are for when Luopan is present.
    sets.idle.Pet = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Adamantite Armor",
        hands="Geo. Mitaines +2",
        legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
        feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Isa Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }
 
    sets.idle.PDT.Pet = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Adamantite Armor",
        hands="Geo. Mitaines +2",
        legs={ name="Telchine Braconi", augments={'Pet: "Regen"+3','Pet: Damage taken -4%',}},
        feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Isa Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
    }
 
    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Adamantite Armor",
        hands="Geo. Mitaines +2",
        legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +3",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +15','Pet: Damage taken -4%',}},
    }

    sets.idle.Pet.Indi = {
        main={ name="Idris", augments={'Path: A',}},
        sub="Genmei Shield",
        range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
        head="Azimuth Hood +3",
        body="Adamantite Armor",
        hands="Geo. Mitaines +2",
        legs={ name="Bagua Pants +1", augments={'Enhances "Mending Halation" effect',}},
        feet="Azimuth Gaiters +3",
        neck={ name="Bagua Charm +2", augments={'Path: A',}},
        waist="Null Belt",
        left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
        right_ear={ name="Azimuth Earring +2", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+16','Damage taken-6%','INT+7 MND+7',}},
        left_ring="Stikini Ring +1",
        right_ring="Defending Ring",
        back={ name="Lifestream Cape", augments={'Geomancy Skill +6','Indi. eff. dur. +15','Pet: Damage taken -4%',}},
    }

    sets.idle.Town = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
    body="Shamash Robe",
    hands="Geo. Mitaines +2",
    legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet={ name="Bagua Sandals +1", augments={'Enhances "Radial Arcana" effect',}},
    neck="Bagua Charm +2",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},
}
   
 
    sets.idle.Weak = {
	head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Etiolation Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}},}
 
    -- Defense sets
 
    sets.defense.PDT = {
    main="Idris",
    sub="Genmei Shield",
    range={ name="Dunna", augments={'MP+20','Mag. Acc.+10','"Fast Cast"+3',}},
    head="Azimuth Hood +3",
     body="Adamantite Armor",
    hands="Geomancy Mitaines +2",
    legs="Assiduity Pants +1",
    feet="Mallquis Clogs +1",
    neck="Loricate Torque +1",
    waist="Isa Belt",
    left_ear="Handler's Earring +1",
    right_ear="Handler's Earring",
    left_ring="Defending Ring",
    right_ring="Shneddick Ring",
    back={ name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','HP+20','Pet: "Regen"+10','Pet: Damage taken -5%',}},
}
 
    sets.defense.MDT = {}
    sets.Kiting = {feet="Geo. Sandals"}
 
    sets.latent_refresh = {waist="Fucho-no-obi"}
 
 
    --------------------------------------
    -- Engaged sets
    --------------------------------------
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
 
    -- Normal melee group
    sets.engaged = {
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Nyame Mail",
    hands="Gazu Bracelets +1",
	--hands="Geomancy Mitaines +3",
    legs="Nyame Flanchard",
	--legs={ name="Telchine Braconi", augments={'Mag. Evasion+23','Pet: "Regen"+3','Pet: Damage taken -4%',}},
    feet="Nyame Sollerets",
    neck="Bagua Charm +2",
    waist="Cornelia's Belt",
    left_ear="Telos Earring",
    right_ear="Crep. Earring",
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
	back={ name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10','Pet: Damage taken -5%',}},
	}
 
    --------------------------------------
    -- Custom buff sets
    --------------------------------------
	sets.midcast['Enfeebling Magic'] = {
	main="Idris",
    sub="Ammurapi Shield",
    head="Geomancy Galero +3",
    body="Geomancy Tunic +3",
    hands="Geo. Mitaines +2",
    legs="Geomancy Pants +3",
    feet="Geomancy Sandals +3",
    neck="Bagua Charm +2",
    waist="Rumination Sash",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Nantosuelta's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:clear()
    end
end
 
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:clear()
        handle_equipping_gear(player.status)
    end
end
 
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
 
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
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
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
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
--- ..:: Pet Status change ::.. --->
function pet_change(pet,gain_or_loss)
    status_change(player.status)
    if not gain_or_loss then
        enable('feet')
        send_command('input /t Trinironnie ..:: Luopan died ::..')
    end 
end
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1,18)
	send_command('wait 2; input /lockstyleset 2')
end







---------------------------------------------------------------------------------------------------------------------------
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
    

}


