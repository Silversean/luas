-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

--[[
	Custom commands:
	
	ExtraSongsMode may take one of three values: None, Dummy, FullLength
	
	You can set these via the standard 'set' and 'cycle' self-commands.  EG:
	gs c cycle ExtraSongsMode
	gs c set ExtraSongsMode Dummy
	
	The Dummy state will equip the bonus song instrument and ensure non-duration gear is equipped.
	The FullLength state will simply equip the bonus song instrument on top of standard gear.
	
	
	Simple macro to cast a dummy Daurdabla song:
	/console gs c set ExtraSongsMode Dummy
	/ma "Shining Fantasia" <me>
	
	To use a Terpander rather than Daurdabla, set the info.ExtraSongInstrument variable to
	'Terpander', and info.ExtraSongs to 1.
--]]

-- Initialization function for this job file.
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')

end

function job_setup()
	setupTextWindow(1700, 1150)
    state.Moving = M('false', 'true')
	include('Mote-TreasureHunter')
	
	


	


	state.Buff['Fast Cast'] = buffactive['fast cast'] or false
	state.Buff['Pianissimo'] = buffactive['pianissimo'] or false
	state.Buff['Nightingale'] = buffactive['nightingale'] or false
	state.Buff['Troubadour'] = buffactive['troubadour'] or false
	state.Buff['Clarion Call'] = buffactive['clarion call'] or false

	info.BardSongs = {193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223}

	info.autoPlay = {
		songs = T{},
		pianissimo = false,
		target = '<me>',
		showReplayMessage = nil,
		targets = T{}
	}

	info.songCount = 0
	info.lastSongTargetName = 'noone'
	info.lastSongPlayTime = 0

	-- For tracking current recast timers via the Timers plugin.
	custom_timers = {}
end

-----------



function user_setup()
	state.OffenseMode:options('Normal', 'DT', 'Shield', 'ShieldTP', 'SIRD')
	state.DamageMode = M('Unlocked','Songs','Savage', 'Mordant', 'Blunt', 'Aeolian','Lv.1 Dagger')
    state.WeaponLockMode = M('Unlocked', 'Locked')
    state.IdleMode:options('Normal','Shield','Town','DT', 'SIRD')
	state.CastingMode:options('Normal', 'TH', 'SIRD', 'Enmity')
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
	state.ExtraSongsMode = M{['description']='Extra Songs', 'None', 'Dummy', 'FullLength'}
	
	


	send_command('bind ^f7 gs c cycle SubtleBlow')
	send_command('bind f1 gs c cycle EngagedMoving')
	send_command('bind f6 gs c cycle DamageMode; gs enable sub; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind ^f6 gs c cycleback DamageMode; gs enable main sub; gs c update; wait 0.1; gs c set WeaponLockMode Unlocked; wait 0.1; gs c set WeaponLockMode Locked')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle CastingMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind f7 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind !f8 gs c cycle WSMode')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind ^` input /spontaneity;wait 1.1;input /impact <stnpc>')
	send_command('bind ^insert gs c cycle ExtraSongsMode')

	
    select_default_macro_book()

	
	brd_daggers = S{'Izhiikoh', 'Vanir Knife', 'Atoyac', 'Aphotic Kukri', 'Sabebus'}


-- Adjust this if using the Terpander (new +song instrument)
info.ExtraSongInstrument = 'Daurdabla'

-- How many extra songs we can keep from Daurdabla/Terpander
info.ExtraSongs = 2
	
-- Set this to false if you don't want to use custom timers.
state.UseCustomTimers = M(true, 'Use Custom Timers')
	
-- Additional local binds

end










-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------



-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('unbind ^insert')
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
		send_command('unbind ^insert')
		send_command('unbind ^e')
		
		send_command('unbind -')
		send_command('unbind =')
		enable('neck')
		enable('main')
		enable('sub')
		enable('range')
end





-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	sets.Unlocked = {}
	
	sets.Crocea = {    
		main="Crocea Mors",
		sub="Daybreak",}
	
	sets.Songs = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},}
		
	
	sets.Savage = {    
		main="Naegling",
		sub={ name="Fusetto +2", augments={'TP Bonus +1000',}},}
	
	sets.Mordant = {
	main={ name="Carnwenhan", augments={'Path: A',}},
	sub={ name="Gleti's Knife", augments={'Path: A',}},
	}

	sets.Blunt = {    
		main="Maxentius",
		sub="Daybreak",}

	sets.Aeolian = {    
		main="Tauret",
		sub="Daybreak",}
		
	sets.Lv1Dagger = {    
		main="Ceremonial Dagger",
		sub="Ceremonial Dagger",}
	






	-- Fast cast sets for spells
	sets.precast.FC = {
    main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Fili Cothurnes +3",
    neck="Voltsurge Torque",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring="Kishar Ring",
    right_ring="Eihwaz Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	sets.precast.FC.Stoneskin = set_combine(sets.precast.FC, {})

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

	sets.precast.FC.BardSong = set_combine(sets.precast.FC, {
		head = "Fili Calot +3",
		feet = "Bihu Slippers +1"
	})

	sets.precast.FC.BardSong['Honor March'] = set_combine(sets.precast.FC, {
		range= "Marsyas",
		head = "Fili Calot +3",
		feet = "Bihu Slippers +1"}
		)
		
	sets.precast.FC.BardSong['Aria of Passion'] = set_combine(sets.precast.FC, {
		range= "Loughnashade",
		head = "Fili Calot +3",
		feet = "Bihu Slippers +1"}
		)
	
	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bard's Justaucorps +2"}
	sets.precast.JA['Soul Voice'] = {legs="Bard's Cannions +2"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
	
	   
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
	head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Cornelia's Ring",
    right_ring="Sroda Ring",
    back="Ogapepo Cape",
}

sets.precast.WS['Shadowstitch'] = {
    main="Carnwenhan",
    sub={ name="Fusetto +1", augments={'Weapon Skill:DMG:+10%',}},
    range="Loughnashade",
    head="Fili Calot +3",
    body="Ashera Harness",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ogapepo Cape",
}

sets.precast.WS['Gust Slash'] = {
    main="Carnwenhan",
    sub={ name="Fusetto +1", augments={'Weapon Skill:DMG:+10%',}},
    range="Loughnashade",
    head="Fili Calot +3",
    body="Ashera Harness",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ogapepo Cape",
}



sets.precast.WS['Wasp Sting'] = {
    main="Carnwenhan",
    sub={ name="Fusetto +1", augments={'Weapon Skill:DMG:+10%',}},
    range="Loughnashade",
    head="Fili Calot +3",
    body="Ashera Harness",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Fili Cothurnes +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Ogapepo Cape",
}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Evisceration'] = {
		main="Tauret",
		sub={ name="Gleti's Knife", augments={'Path: A',}},
		range={ name="Linos", augments={'Accuracy+12 Attack+12','Weapon skill damage +3%','STR+7',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Nyame Mail", augments={'Path: B',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Lustra. Leggings +1", augments={'Attack+20','STR+8','"Dbl.Atk."+3',}},
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist="Fotia Belt",
		left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
		right_ear="Ishvara Earring",
		left_ring="Ephramad's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Damage taken-5%',}},
	}

	
	sets.precast.WS['Exenterator'] = set_combine(sets.precast.WS)

	sets.precast.WS['Mordant Rime'] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range={ name="Linos", augments={'Accuracy+12 Attack+12','Weapon skill damage +3%','STR+7',}},
		head={ name="Nyame Helm", augments={'Path: B',}},
		body={ name="Bunzi's Robe", augments={'Path: A',}},
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs={ name="Nyame Flanchard", augments={'Path: B',}},
		feet={ name="Nyame Sollerets", augments={'Path: B',}},
		neck={ name="Bard's Charm +2", augments={'Path: A',}},
		waist={ name="Sailfi Belt +1", augments={'Path: A',}},
		left_ear="Regal Earring",
		right_ear="Ishvara Earring",
		left_ring="Ephramad's Ring",
		right_ring="Epaminondas's Ring",
		back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Damage taken-5%',}},
	}
	
	sets.precast.WS['Savage Blade'] = {range={ name="Linos", augments={'Accuracy+12 Attack+12','Weapon skill damage +3%','STR+7',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Ephramad's Ring",
    right_ring="Epaminondas's Ring",
    back={ name="Intarabus's Cape", augments={'STR+20','Accuracy+20 Attack+20','Accuracy+10','Weapon skill damage +10%','Damage taken-5%',}},
}


	sets.precast.WS['Aeolian Edge'] = {
    main="Tauret",
    sub="Gleti's Knife",
    range="Gjallarhorn",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Baetyl Pendant",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Friomisi Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Shiva Ring +1",
    back="Ogapepo Cape",
}
	
	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {}

	sets.AllSongs = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Gjallarhorn",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
}
		
	-- Gear to enhance certain classes of songs.  No instruments added here since Gjallarhorn is being used.
	sets.midcast.Ballad = set_combine(sets.AllSongs, {
		legs="Fili Rhingrave +3"
	})

	sets.midcast.Madrigal = set_combine(sets.AllSongs, {
		feet="Fili Cothurnes +3",
		back="Intarbus's Cape",
	})

	sets.midcast.March = set_combine(sets.AllSongs, {
		hands = "Fili Manchettes +3"
	})

	sets.midcast.Minuet = set_combine(sets.AllSongs, {
		range = "Apollo's Flute",
		body = "Fili Hongreline +3"
	})

	sets.midcast.Minne = set_combine(sets.AllSongs, {
		legs = "Mousai Seraweels +1",
	})

	sets.midcast['Herb Pastoral'] = set_combine(sets.AllSongs, {
		main = "Baqil Staff",
		sub = "Achaq Grip",
		range = info.ExtraSongInstrument,
		neck = "Twilight Torque",
		body = "Orvail Robe",
		hangs = "Otomi Gloves",
		feet = "Fili Cothurnes +3"
	})

	sets.midcast.Paeon = set_combine(sets.AllSongs, {})
	sets.midcast.Carol = set_combine(sets.AllSongs, {hands="Mousai Gages +1",})
	sets.midcast["Sentinel's Scherzo"] = set_combine(sets.AllSongs, {
		feet="Fili Cothurnes +3"
	})

	sets.midcast.Prelude = set_combine(sets.AllSongs, {
		feet="Fili Cothurnes +3",
		back="Intarbus's Cape",
	})

	sets.midcast.Etude = set_combine(sets.AllSongs, {head="Mousai Turban +1",})
	
	sets.midcast["Hunter's Prelude"] = set_combine(sets.AllSongs, {
		range = "Cantabank's Horn"
	})

	sets.midcast.Mazurka = set_combine(sets.AllSongs, {
		range = "Vihuela"
	})
	
	sets.midcast.Mambo = set_combine(sets.AllSongs, {feet="Mousai Crackows +1",})
	
	
	sets.midcast.Threnody = set_combine(sets.midcast.SongDebuff, {body="Mousai Manteel +1",})

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = sets.AllSongs

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff =  {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +1",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Fili Rhingrave +3",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Luminary Sash",
    left_ear="Regal Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}

	-- For song defbuffs (accuracy primary, duration secondary)
	sets.midcast.ResistantSongDebuff = sets.midcast.SongDebuff




	--DUMMY SONG SPELLSET --
	
	sets.midcast['Shining Fantasia'] = {
    main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
    sub="Genmei Shield",
    range="Daurdabla",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Fili Cothurnes +3",
    neck="Voltsurge Torque",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring="Kishar Ring",
    right_ring="Eihwaz Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	
	sets.midcast['Goblin Gavotte'] = {
    main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
    sub="Genmei Shield",
    range="Daurdabla",
    head="Fili Calot +3",
    body="Inyanga Jubbah +2",
    hands={ name="Gende. Gages +1", augments={'Phys. dmg. taken -3%','Magic dmg. taken -4%','Song spellcasting time -5%',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet="Fili Cothurnes +3",
    neck="Voltsurge Torque",
    waist="Flume Belt",
    left_ear="Loquac. Earring",
    right_ear={ name="Fili Earring", augments={'System: 1 ID: 1676 Val: 0','Accuracy+8','Mag. Acc.+8',}},
    left_ring="Kishar Ring",
    right_ring="Eihwaz Ring",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}



	sets.midcast["Horde Lullaby"] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Blurred Harp +1",
		head="Brioso Roundlet +1",
		body="Fili Hongreline +3",
		hands="Brioso Cuffs +1",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Eschan Stone",
		left_ear="Crep. Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}




	sets.midcast["Horde Lullaby"].TH  = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Blurred Harp +1",
		head="Brioso Roundlet +1",
		body="Fili Hongreline +3",
		hands="Brioso Cuffs +1",
		legs={ name="Chironic Hose", augments={'Crit.hit rate+4','"Mag.Atk.Bns."+11','"Treasure Hunter"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		feet={ name="Chironic Slippers", augments={'INT+9','Attack+19','"Treasure Hunter"+1','Accuracy+3 Attack+3','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Mnbw. Whistle +1",
		waist="Chaac Belt",
		left_ear="Lempo Earring",
		right_ear="Regal Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}


	
	
	sets.midcast["Horde Lullaby II"] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Blurred Harp +1",
		head="Brioso Roundlet +1",
		body="Fili Hongreline +3",
		hands="Inyan. Dastanas +2",
		legs="Inyanga Shalwar +2",
		feet={ name="Bihu Slippers +1", augments={'Enhances "Nightingale" effect',}},
		neck="Incanter's Torque",
		waist="Eschan Stone",
		left_ear="Lempo Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}



	sets.midcast["Horde Lullaby II"].TH = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Ammurapi Shield",
		range="Daurdabla",
		head="Brioso Roundlet +1",
		body="Fili Hongreline +3",
		hands="Inyan. Dastanas +2",
		legs={ name="Chironic Hose", augments={'Crit.hit rate+4','"Mag.Atk.Bns."+11','"Treasure Hunter"+1','Mag. Acc.+4 "Mag.Atk.Bns."+4',}},
		feet={ name="Chironic Slippers", augments={'INT+9','Attack+19','"Treasure Hunter"+1','Accuracy+3 Attack+3','Mag. Acc.+12 "Mag.Atk.Bns."+12',}},
		neck="Incanter's Torque",
		waist="Chaac Belt",
		left_ear="Lempo Earring",
		right_ear="Crep. Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}


	sets.midcast["Foe Lullaby"] = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +1",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	sets.midcast["Foe Lullaby II"] = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Ammurapi Shield",
    range="Gjallarhorn",
    head="Brioso Roundlet +1",
    body="Fili Hongreline +3",
    hands="Brioso Cuffs +1",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Eschan Stone",
    left_ear="Crep. Earring",
    right_ear="Regal Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
}
	

	-- Song-specific recast reduction
	sets.midcast.SongRecast = sets.AllSongs

	--sets.midcast.Daurdabla = set_combine(sets.midcast.FastRecast, sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Cast spell with normal gear, except using Daurdabla instead
	sets.midcast.Daurdabla = set_combine(sets.AllSongs, { range = info.ExtraSongInstrument })

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
	sets.midcast.DaurdablaDummy = {ranged="Daurdabla",}


	sets.midcast["Honor March"] = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
    range="Marsyas",
    head="Fili Calot +3",
    body="Fili Hongreline +3",
    hands="Fili Manchettes +3",
    legs="Inyanga Shalwar +2",
    feet="Brioso Slippers +3",
    neck="Mnbw. Whistle +1",
    waist="Plat. Mog. Belt",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
}

	sets.midcast["Aria of Passion"] = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub={ name="Kali", augments={'Mag. Acc.+15','String instrument skill +10','Wind instrument skill +10',}},
		range="Loughnashade",
		head="Fili Calot +3",
		body="Fili Hongreline +3",
		hands="Fili Manchettes +3",
		legs="Inyanga Shalwar +2",
		feet="Brioso Slippers +3",
		neck="Mnbw. Whistle +1",
		waist="Plat. Mog. Belt",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Magnetic Earring",
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
	}



	-- Other general spells and classes.
	sets.midcast.Cure = {
		main="Daybreak",
		sub="Ammurapi Shield",
		ammo="Pemphredo Tathlum",
		head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
		body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
		hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
		legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
		feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear="Magnetic Earring",
		left_ring="Weather. Ring",
		right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
		back={ name="Aurist's Cape +1", augments={'Path: A',}},
	}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.midcast.Stoneskin = {}
		
	sets.midcast.Cursna = {}

	sets.midcast.Enmity = {
		main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
		sub="Genmei Shield",
		range="Gjallarhorn",
		head="Halitus Helm",
		body="Emet Harness +1",
		hands="Fili Manchettes +3",
		legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",
		neck={ name="Unmoving Collar +1", augments={'Path: A',}},
		waist="Trance Belt",
		left_ear="Pluto's Pearl",
		right_ear="Trux Earring",
		left_ring="Provocare Ring",
		right_ring="Eihwaz Ring",
		back={ name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Damage taken-5%',}},
	}

	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	sets.PartyCombat = {
		feet="Serpentes Sabots",
	}
	
	
	
	--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--




	
	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kite = {feet="Fili Cothurnes +3"}
	
	sets.Adoulin = {body="Councilor's Garb",}
	sets.MoveSpeed = {feet="Fili Cothurnes +3",}

	sets.TreasureHunter = {}


	sets.latent_refresh = {waist="Fucho-no-obi"}
	
	
	sets.idle.Normal = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Gjallarhorn",
		head="Fili Calot +3",
		body="Fili Hongreline +3",
		hands="Fili Manchettes +3",
		legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Stikini Ring +1",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
	}
	sets.latent_refresh = {waist="Fucho-no-obi"}	
		
	sets.idle.Shield = {}

	sets.idle.Town = {}

	sets.idle.DT = {
		main={ name="Carnwenhan", augments={'Path: A',}},
		sub="Genmei Shield",
		range="Gjallarhorn",
		head="Fili Calot +3",
		body="Fili Hongreline +3",
		hands={ name="Nyame Gauntlets", augments={'Path: B',}},
		legs="Fili Rhingrave +3",
		feet="Fili Cothurnes +3",
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Carrier's Sash",
		left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
		right_ear={ name="Fili Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','Damage taken-3%',}},
		left_ring="Defending Ring",
		right_ring="Stikini Ring +1",
		back="Null Shawl",
	}

	sets.idle.SIRD = {}

	sets.idle.TH = {}





		
	-- Defense sets

	sets.defense.PDT = {
	main={ name="Carnwenhan", augments={'Path: A',}},
    sub="Genmei Shield",
    range="Gjallarhorn",
    head="Bunzi's Hat",
    body="Ashera Harness",
    hands={ name="Bunzi's Gloves", augments={'Path: A',}},
    legs="Bunzi's Pants",
    feet={ name="Bunzi's Sabots", augments={'Path: A',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
    right_ring="Eihwaz Ring",
    back="Ogapepo Cape",
}

	sets.defense.MDT = {}

	sets.Kite = {feet="Fili Cothurnes +3"}
	
	sets.Adoulin = {body="Councilor's Garb",}
	sets.MoveSpeed = {feet="Fili Cothurnes +3",}

	sets.TreasureHunter = {}


	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Basic set for if no TP weapon is defined.
	sets.engaged =  {
    range={ name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head={ name="Nyame Helm", augments={'Path: B',}},
    body="Ashera Harness",
    hands="Volte Mittens",
    legs={ name="Telchine Braconi", augments={'Accuracy+17','"Store TP"+6','STR+7 DEX+7',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Telos Earring",
    left_ring="Moonlight Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}

sets.engaged.DT = {
    main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
    sub="Genmei Shield",
    range={ name="Linos", augments={'Accuracy+13 Attack+13','"Dbl.Atk."+3','Quadruple Attack +3',}},
    head="Nyame Helm",
    body="Ashera Harness",
    hands="Nyame Gauntlets",
    legs={ name="Telchine Braconi", augments={'Accuracy+17','"Store TP"+6','STR+7 DEX+7',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Bard's Charm +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Telos Earring",
    left_ring="Defending Ring",
    right_ring="Moonlight Ring",
    back={ name="Intarabus's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Damage taken-5%',}},
}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	-- if spell.type == 'BardSong' then
	-- 	-- Auto-Pianissimo
	-- 	if ((spell.target.type == 'PLAYER' and not spell.target.charmed) or (spell.target.type == 'NPC' and spell.target.in_party)) and
	-- 		not state.Buff['Pianissimo'] then
			
	-- 		local spell_recasts = windower.ffxi.get_spell_recasts()
	-- 		if spell_recasts[spell.recast_id] < 2 then
	-- 			send_command('@input /ja "Pianissimo" <me>; wait 1.5; input /ma "'..spell.name..'" '..spell.target.name)
	-- 			eventArgs.cancel = true
	-- 			return
	-- 		end
	-- 	end
	-- end
end

function job_post_precast(spell, action, spellMap, eventArgs)
	if spell.type == 'BardSong' and state.Buff['Pianissimo'] then
		coroutine.schedule(function ()
			equip(sets.midcast.SongEffect)
		end, 0.1)
	end
end

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Magic' then
		if spell.type == 'BardSong' then
			-- layer general gear on first, then let default handler add song-specific gear.
			local generalClass = get_song_class(spell)

			if generalClass and sets.midcast[generalClass] then
				equip(sets.midcast[generalClass])
			end
		end
	end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	local timeNow

	if spell.type == 'BardSong' then
		if state.ExtraSongsMode.value == 'FullLength' then
			equip(sets.midcast.Daurdabla)
		end

		state.ExtraSongsMode:reset()

		if spell.target.type == "SELF" or spell.target.type == "PLAYER" then
			timeNow = os.time()

			if timeNow - info.lastSongPlayTime < 7 then
				if info.lastSongTargetName == spell.target.name then
					local clarionSong = (state.Buff['Clarion Call'] and 1) or 0

					if info.songCount > 1 + clarionSong and info.songCount < 2 + info.ExtraSongs + clarionSong then
						add_to_chat(122, '=== Playing Extra Song (' .. tostring(info.songCount + 1) .. ') ' .. string.char(0x1E, 256 - 254) .. spell.name .. string.char(0x1F, 122) .. ' on ' .. string.char(0x1F, 210) .. spell.target.name .. string.char(0x1F, 122) .. " ===")

						equip({
							range = info.ExtraSongInstrument
						})
					end
				end
			else
				info.songCount = 0
			end

			info.lastSongTargetName = spell.target.name
		end

		-- send_command('wait 1.4; input /jobemote BRD')
	end		
end

-- Set eventArgs.handled to true if we don't want automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
	if spell.type == 'BardSong' then
		if not spell.interrupted then
			if spell.target.type == "SELF" or spell.target.type == "PLAYER" then
				local clarionSong = (state.Buff['Clarion Call'] and 1) or 0

				state.Buff['Pianissimo'] = false

				info.songCount = info.songCount + 1

				if info.songCount > 2 + info.ExtraSongs + clarionSong then
					info.songCount = 1
				end

				-- add_to_chat(122, "Songs on " .. info.lastSongTargetName .. " = " .. tostring(info.songCount))

				info.lastSongPlayTime = os.time()
			end

			perform_auto_play(2.7)
		elseif not table.empty(info.autoPlay.songs) then
			info.autoPlay.songs = T{}
			info.autoPlay.showReplayMessage = nil

			local myTarget = spell.target.name == player.name and '<me>' or spell.target.name

			if info.autoPlay.targets[myTarget] then
				coroutine.close(info.autoPlay.targets[myTarget])

				info.autoPlay.targets[myTarget] = nil
			end
		end
	end
end

--function job_post_aftercast(spell, action, spellMap, eventArgs)
	--update_combat_set()
--end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

    if stateField == 'WeaponLockMode' then
        if newValue == 'Unlocked' then
            enable('main','sub','range','ammo')
        elseif newValue == 'Locked' and (player.equipment.range == 'Ullr' or player.equipment.range == 'Kaja Bow') then
            disable('main','sub','ammo')
		elseif newValue == 'Locked' then
            disable('main','sub')
        end
    end
	
	if stateField == 'Offense Mode' then
		if newValue == 'Normal' then
			disable('main','sub','ammo')
		else
			enable('main','sub','ammo')
		end
	end
end

function job_buff_change(buff, gain)
	if (not midaction() and not state.Moving.Value == 'true') and (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end

	--[[if state.Moving.value == 'false' then
		if not buffactive[580] then
		send_command('send Captainrayfus /ma "Indi-Haste" <me>')
		end
	end]]
end


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
				state.Moving.value = 'true'
			end
			if player.status ~= 'Engaged' then
				dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
				if dist > 1 and not moving then
					state.Moving.value = 'true'
					send_command('gs c update')
					if world.area:contains("Adoulin") then
						send_command('gs equip sets.Adoulin')
						--send_command('send Captainrayfus /follow Byrne')
					elseif state.Following.value == 'Follow' then
						--send_command('send Captainrayfus /follow Byrne')
						send_command('gs equip sets.MoveSpeed')
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
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
end


-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	if player.mpp < 51 then
		idleSet = set_combine(idleSet, sets.latent_refresh)
	end
	
	    if state.Moving.value == 'true' then
        idleSet = set_combine(idleSet, sets.MoveSpeed)
    end
	
	return idleSet
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
	display_current_caster_state()
	eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Determine the custom class to use for the given song.
function get_song_class(spell)
	-- Can't use spell.targets:contains() because this is being pulled from resources
	if set.contains(spell.targets, 'Enemy') then
		if state.CastingMode.value == 'Resistant' then
			return 'ResistantSongDebuff'
		else
			return 'SongDebuff'
		end
	elseif state.ExtraSongsMode.value == 'Dummy' then
		return 'DaurdablaDummy'
	else
		return 'SongEffect'
	end
end

-- Function to calculate the duration of a song based on the equipment used to cast it.
-- Called from adjust_timers(), which is only called on aftercast().
function calculate_duration(spellName, spellMap)
	local mult = 1
	if player.equipment.range == 'Daurdabla' then mult = mult + 0.3 end -- change to 0.25 with 90 Daur
	if player.equipment.range == "Gjallarhorn" then mult = mult + 0.4 end -- change to 0.3 with 95 Gjall
	
	if player.equipment.main == "Carnwenhan" then mult = mult + 0.1 end -- 0.1 for 75, 0.4 for 95, 0.5 for 99/119
	if player.equipment.main == "Legato Dagger" then mult = mult + 0.05 end
	if player.equipment.sub == "Legato Dagger" then mult = mult + 0.05 end
	if player.equipment.neck == "Aoidos' Matinee" then mult = mult + 0.1 end
	if player.equipment.body == "Fili Hongreline +3" then mult = mult + 0.1 end
	if player.equipment.legs == "Mdk. Shalwar +1" then mult = mult + 0.1 end
	if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.1 end
	if player.equipment.feet == "Brioso Slippers +3" then mult = mult + 0.11 end
	
	if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +3" then mult = mult + 0.1 end
	if spellMap == 'Paeon' and player.equipment.head == "Brioso Roundlet +3" then mult = mult + 0.1 end
	if spellMap == 'Madrigal' and player.equipment.head == "Aoidos' Calot +2" then mult = mult + 0.1 end
	if spellMap == 'Minuet' and player.equipment.body == "Fili Hongreline +3" then mult = mult + 0.1 end
	if spellMap == 'March' and player.equipment.hands == "Fili Manchettes +3" then mult = mult + 0.1 end
	if spellMap == 'Ballad' and player.equipment.legs == "Fili Rhingrave +3" then mult = mult + 0.1 end
	if spellName == "Sentinel's Scherzo" and player.equipment.feet == "Fili Cothurnes +3" then mult = mult + 0.1 end
	
	if buffactive.Troubadour then
		mult = mult*2
	end
	if spellName == "Sentinel's Scherzo" then
		if buffactive['Soul Voice'] then
			mult = mult*2
		elseif buffactive['Marcato'] then
			mult = mult*1.5
		end
	end
	
	local totalDuration = math.floor(mult*120)

	return totalDuration
end

function perform_auto_play(wait)
	if not table.empty(info.autoPlay.songs) then
		local nextSong = info.autoPlay.songs[1]

		table.remove(info.autoPlay.songs, 1)

		if info.autoPlay.pianissimo and not state.Buff['Pianissimo'] then
			coroutine.schedule(function ()
				local waitTime = 2.7

				while windower.ffxi.get_spell_recasts()[112] > 0 do
					coroutine.sleep(0.1)

					waitTime = waitTime - 0.1
				end

				if wait == 0 then
					waitTime = 0
				end

				send_command('wait ' .. tostring(waitTime) .. '; input /ja "Pianissimo" <me>; wait 1.3; input /ma "' .. nextSong .. '" ' .. info.autoPlay.target)
			end, 0)
		else
			send_command('wait ' .. tostring(wait) .. '; input /ma "' .. nextSong .. '" ' .. info.autoPlay.target)
		end
	elseif info.autoPlay.showReplayMessage then
		info.autoPlay.showReplayMessage()

		info.autoPlay.showReplayMessage = nil
	end
end

function binder(fn, myTarget, macroName)
	return function ()
		return fn(myTarget, macroName)
	end
end

function replay_message(myTarget, macroName)
	info.autoPlay.targets[myTarget] = coroutine.schedule(binder(replay_message_coroutine, myTarget, macroName), state.Buff['Troubadour'] and 310 or 155)
end

function replay_message_coroutine(myTarget, macroName)
	local targetName = myTarget == '<me>' and player.name or myTarget

	add_to_chat(122, '=== Replay Song Macro ' .. string.char(0x1E, 256 - 254) .. macroName .. string.char(0x1F, 122) .. ' on ' .. string.char(0x1F, 210) .. targetName .. string.char(0x1F, 122) .. ' ===')

	info.autoPlay.targets[myTarget] = nil
end

function job_self_command(commandArgs, eventArgs)
	if commandArgs[1] == 'ap' then
		local mySong

		local myTarget = windower.ffxi.get_mob_by_target('t')
		local me = windower.ffxi.get_mob_by_target('me')

		if not myTarget or not state.Buff['Pianissimo'] then
			myTarget = '<me>'
		else
			myTarget = ((me.name == myTarget.name or not myTarget.in_party) and '<me>') or myTarget.name
		end

		info.lastSongPlayTime = 0

		info.autoPlay.songs = T{}
		info.autoPlay.target = myTarget
		info.autoPlay.pianissimo = state.Buff['Pianissimo']

		for i,song in pairs(commandArgs) do
			if i > 2 then
				mySong = song:gsub('_', ' ')
				mySong = mySong:gsub('Minuet', 'Valor Minuet')
				mySong = mySong:gsub('Ballad', "Mage's Ballad")
				mySong = mySong:gsub("Hunter", "Hunter's Prelude")
				mySong = mySong:gsub("Archer", "Archer's Prelude")
				mySong = mySong:gsub("Blade", "Blade Madrigal")
				mySong = mySong:gsub("Sword", "Sword Madrigal")
				mySong = mySong:gsub("Minne", "Knight's Minne")
				mySong = mySong:gsub("Paeon", "Army's Paeon")
				mySong = mySong:gsub("Advancing", "Advancing March")
				mySong = mySong:gsub("Victory", "Victory March")
				mySong = mySong:gsub("Water", "Water Carol")
				mySong = mySong:gsub("Lightning", "Lightning Carol")
				mySong = mySong:gsub("Earth", "Earth Carol")
				mySong = mySong:gsub("Wind", "Wind Carol")
				mySong = mySong:gsub("Fowl", "Fowl Aubade")
				mySong = mySong:gsub("Scherzo", "Sentinel's Scherzo")
				mySong = mySong:gsub("HP", "Herb Pastoral")

				table.insert(info.autoPlay.songs, mySong)
			end
		end

		if info.autoPlay.targets[myTarget] then
			coroutine.close(info.autoPlay.targets[myTarget])
		end

		info.autoPlay.showReplayMessage = binder(replay_message, myTarget, commandArgs[2])

		perform_auto_play(0)
	elseif commandArgs[1] == 'resetreplay' then
		for _,target in pairs(info.autoPlay.targets) do
			coroutine.close(info.autoPlay.targets[_])

			add_to_chat(122, '=== Reset Replay > ' .. _ .. ' ===')
		end

		info.autoPlay.targets = T{}

		add_to_chat(122, '=== Reset All Replay Messages ===')
	end
end

function reset_replay_songs()
	for _,target in pairs(info.autoPlay.targets) do
		-- coroutine.close(info.autoPlay.targets[_])
	end

	info.autoPlay.targets = T{}
end

function party_is_in_combat()
	local in_combat = false
	local party = windower.ffxi.get_party()

	for _, member in pairs(party) do
		if type(member) == 'table' and member.mob and member.mob.status == 1 then
			in_combat = true

			break
		end
	end

	return in_combat
end

function update_combat_set()
	if party_is_in_combat() and player.mpp > 50 then
		equip(sets.PartyCombat)
	end
end

windower.register_event('zone change', reset_replay_songs)

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



-----------------------------------------------------[[TABLE FUNCTIONS POG]]-------------------------------------------------------------------------------


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
		textinbox = textinbox .. textColor .. "Extra Song Mode (CNTRL INS) : " .. tostring(state.ExtraSongsMode.current) .. textColorNewLine
	
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in
		
		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
		textinbox = textinbox .. "\\cs(255, 255, 70)" .. "Damage Mode (F6) : " .. "\\cs(100, 255, 100)" .. tostring(state.DamageMode.current) .. "\\cr \n"
		textinbox = textinbox .. textColor .. "Casting Mode (CTRL+F9) : " .. tostring(state.CastingMode.current) .. textColorNewLine
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		
		--[[if state.Enfeeb.value == 'Potency' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. tostring(state.Enfeeb.current) .. textColorNewLine
		elseif state.Enfeeb.value == 'Accuracy' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. tostring(state.Enfeeb.current) .. textColorNewLine
		elseif state.Enfeeb.value == 'Skill' then
			textinbox = textinbox .. textColor .. "Enfeebling Mode (F11) : " .. "\\cs(255, 75, 75)" .. tostring(state.Enfeeb.current) .. textColorNewLine
		end]]
		
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F7) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
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
			textinbox = textinbox .. textColor .. "WSMode(Alt+F8) : " .. tostring(state.WSMode.current) .. textColorNewLine
			
			--textinbox = textinbox .. "\\cs(255, 255, 70)" .. "TreasureHunter Mode : " .. "\\cs(100, 255, 100)" .. tostring(state.TreasureMode.value) .. "\\cr \n"

			


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


function customize_melee_set(meleeSet)

if state.DamageMode.value == 'Unlocked' then
	meleeSet = set_combine(meleeSet, sets.Unlocked)
elseif state.DamageMode.value == 'Songs' then
	meleeSet = set_combine(meleeSet, sets.Songs)
elseif state.DamageMode.value == 'Mordant' then
	idleSet = set_combine(meleeSet, sets.Mordant)
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


function customize_idle_set(idleSet)
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

	if state.DamageMode.value == 'Unlocked' then
		idleSet = set_combine(idleSet, sets.Unlocked)
	elseif state.DamageMode.value == 'Songs' then
		idleSet = set_combine(idleSet, sets.Songs)
	elseif state.DamageMode.value == 'Mordant' then
		idleSet = set_combine(idleSet, sets.Mordant)
	elseif state.DamageMode.value == 'Savage' then
		idleSet = set_combine(idleSet, sets.Savage)
	elseif state.DamageMode.value == 'Blunt' then
		idleSet = set_combine(idleSet, sets.Blunt)
	elseif state.DamageMode.value == 'Aeolian' then
		idleSet = set_combine(idleSet, sets.Aeolian)
	elseif state.DamageMode.value == 'Lv.1 Dagger' then
		idleSet = set_combine(idleSet, sets.Lv1Dagger)
	end
	

	if state.Moving.value == 'true' then
		idleSet = set_combine(idleSet, sets.MoveSpeed)
	end
	
return idleSet

	
end

	
