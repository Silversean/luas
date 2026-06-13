--[[

*****************************************************************

 $$$$$$\            $$\                 $$\                     
$$  __$$\           $$ |                $$ |                    
$$ /  \__| $$$$$$$\ $$$$$$$\   $$$$$$\  $$ | $$$$$$\   $$$$$$\  
\$$$$$$\  $$  _____|$$  __$$\ $$  __$$\ $$ | \____$$\ $$  __$$\ 
 \____$$\ $$ /      $$ |  $$ |$$ /  $$ |$$ | $$$$$$$ |$$ |  \__|
$$\   $$ |$$ |      $$ |  $$ |$$ |  $$ |$$ |$$  __$$ |$$ |      
\$$$$$$  |\$$$$$$$\ $$ |  $$ |\$$$$$$  |$$ |\$$$$$$$ |$$ |      
 \______/  \_______|\__|  \__| \______/ \__| \_______|\__|      
                                                              
*****************************************************************                                                      
                                                                
]] 

------------------------
--          __   __   --
--  |    | |__) /__`  --
--  |___ | |__) .__/  --
--                    --
------------------------

function get_sets()
    
	mote_include_version = 2
    include('Mote-Include.lua')
    include('organizer-lib')
 
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


function job_setup()
	include('Mote-TreasureHunter')
	setupTextWindow(1700, 1150)

 	state.OffenseMode:options('Normal', 'Store TP', 'DTmeva')
    state.WeaponLockMode = M('Unlocked', 'Locked')
    state.IdleMode:options('Normal','Refresh','DTmeva')
	state.CastingMode:options('Normal', 'Burst', 'Occult', 'Harmacist')
    state.HelixMode = M('Normal', 'MB')
	state.Enfeeb = M('Potency', 'Accuracy', 'Skill')
	state.Regen = M('Potency', 'Duration', 'Mix')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.EngagedMoving = M('Disabled','Enabled')
	state.DoomMode = M('OFF', 'Doom')
	state.SubtleBlow = M('Off', 'On')
    state.Moving = M('false', 'true')
	state.Kiting = M('false', 'true')
	
    

    -- Additional local binds
	send_command('bind f7 gs c cycle SubtleBlow')
	send_command('bind f2 gs c cycle EngagedMoving')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle CastingMode')
    send_command('bind ^f10 gs c cycle HelixMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind ^f11 gs c cycle Regen')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^= gs c cycle treasuremode')
	send_command('bind ^` input /spontaneity;wait 1.1;input /impact <stnpc>')
 
 
    organizer_items = {}
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
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
		send_command('unbind f5')
		send_command('unbind f1')
		send_command('unbind f2')
		
		send_command('unbind -')
		send_command('unbind =')
		enable('neck')
		enable('main')
		enable('sub')
		enable('range')
end
 
 

function init_gear_sets()

--=============================================--
--                                             --
--   ..|'''.|  '||''''|      |     '||''|.     --
--  .|'     '   ||  .       |||     ||   ||    --
--  ||    ....  ||''|      |  ||    ||''|'     --
--  '|.    ||   ||        .''''|.   ||   |.    --
--   ''|...'|  .||.....| .|.  .||. .||.  '|'   --
--                                             --
--=============================================--



     
--==================================================--
--  ____                                       _    --
-- |  _ \   _ __    ___    ___    __ _   ___  | |_  --
-- | |_) | | '__|  / _ \  / __|  / _` | / __| | __| --
-- |  __/  | |    |  __/ | (__  | (_| | \__ \ | |_  --
-- |_|     |_|     \___|  \___|  \__,_| |___/  \__| --
--==================================================--
 
    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy pants"}
	
    sets.precast.JA.Convert = {}
 
    sets.precast.FC = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Clerisy Strap +1",
    ammo="Incantor Stone",
    head="Amalric Coif +1",
    body="Pinga Tunic",
    hands="Acad. Bracers +2",
    legs="Pinga Pants",
    feet="Acad. Loafers +2",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back="Fi Follet Cape +1",
}
		
	sets.precast.FC.Grimoire = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Clerisy Strap +1",
    ammo="Incantor Stone",
    head="Amalric Coif +1",
    body="Pinga Tunic",
    hands="Acad. Bracers +2",
    legs="Pinga Pants",
    feet="Acad. Loafers +2",
    neck="Voltsurge Torque",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Alabaster Earring",
    left_ring="Defending Ring",
    right_ring="Kishar Ring",
    back="Fi Follet Cape +1",
}
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak",})
	
	sets.precast.FC.Impact.Grimoire = set_combine(sets.precast.FC.Grimoire, {head=empty,body="Twilight Cloak",})
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    
	sets.precast.FC['Enfeebling Magic'] = set_combine(sets.precast.FC, {})
    
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    
	sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {})

--===============================================================================--		
-- __        __                                               _      _   _   _   --
-- \ \      / /   ___    __ _   _ __     ___    _ __    ___  | | __ (_) | | | |  --
--  \ \ /\ / /   / _ \  / _` | | '_ \   / _ \  | '_ \  / __| | |/ / | | | | | |  --
--   \ V  V /   |  __/ | (_| | | |_) | | (_) | | | | | \__ \ |   <  | | | | | |  --
--    \_/\_/     \___|  \__,_| | .__/   \___/  |_| |_| |___/ |_|\_\ |_| |_| |_|  --
--                             |_|                                               --
--===============================================================================--

    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Myrkr'] = {
    main={ name="Marin Staff +1", augments={'Path: A',}},
    sub="Khonsu",
    ammo="Ghastly Tathlum +1",
    head="Pixie Hairpin +1",
    body={ name="Amalric Doublet +1", augments={'MP+80','"Mag.Atk.Bns."+25','"Fast Cast"+4',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Amalric Slops +1", augments={'MP+80','"Mag.Atk.Bns."+25','Enmity-6',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Eddy Necklace",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Mendi. Earring",
    left_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    right_ring="Mephitas's Ring",
    back="Tantalic Cape",
}

	sets.precast.WS['Black Halo'] = { ammo="Staunch Tathlum +1",
    head="Agwu's Cap",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Dominance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}


	sets.precast.WS['Shattersoul'] = { ammo="Staunch Tathlum +1",
    head="Agwu's Cap",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Dominance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Moonbeam Cape",
}





	sets.precast.WS['Aeolian Edge'] = {
    main={ name="Malevolence", augments={'INT+7','"Mag.Atk.Bns."+5','"Fast Cast"+3',}},
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
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
		
	--HEALING/CURES
 
    sets.midcast['Healing Magic'] = {
    main="Chatoyant Staff",
    sub="Enki Strap",
    ammo="Pemphredo Tathlum",
    head={ name="Vanya Hood", augments={'MND+10','Spell interruption rate down +15%','"Conserve MP"+6',}},
    body={ name="Kaykaus Bliaut +1", augments={'MP+80','"Cure" potency +6%','"Conserve MP"+7',}},
    hands={ name="Kaykaus Cuffs +1", augments={'MP+80','"Conserve MP"+7','"Fast Cast"+4',}},
    legs={ name="Kaykaus Tights +1", augments={'MP+80','Spell interruption rate down +12%','"Cure" spellcasting time -7%',}},
    feet={ name="Kaykaus Boots +1", augments={'MP+80','"Cure" spellcasting time -7%','Enmity-6',}},
    neck="Voltsurge Torque",
    waist={ name="Shinjutsu-no-Obi +1", augments={'Path: A',}},
    left_ear="Mendi. Earring",
    right_ear="Calamitous Earring",
    left_ring="Naji's Loop",
    right_ring={ name="Mephitas's Ring +1", augments={'Path: A',}},
    back="Solemnity Cape",
}



sets.Dia = {
    main="Daybreak",
    sub="Sacro Bulwark",
    ammo="Per. Lucky Egg",
    head={ name="Viti. Chapeau +3", augments={'Enfeebling Magic duration','Magic Accuracy',}},
    body="Lethargy Sayon +3",
    hands={ name="Viti. Gloves +3", augments={'Enhancing Magic duration',}},
    legs={ name="Merlinic Shalwar", augments={'MND+5','INT+1','"Treasure Hunter"+2','Accuracy+8 Attack+8','Mag. Acc.+11 "Mag.Atk.Bns."+11',}},
    feet={ name="Vitiation Boots +3", augments={'Immunobreak Chance',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Chaac Belt",
    left_ear="Sherida Earring",
    right_ear="Thureous Earring",
	ring1={name="Stikini Ring +1", bag="wardrobe2"},
	ring2={name="Stikini Ring +1", bag="wardrobe3"},
    back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Store TP"+10','Chance of successful block +5',}},
}


sets.midcast['Healing Magic'].Harmacist = {
    main="Daybreak",
    sub={ name="Bunzi's Rod", augments={'Path: A',}},
    ammo="Sroda Tathlum",
    head="Arbatel Bonnet +3",
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+6',}},
    left_ring="Weather. Ring",
    right_ring="Mujin Band",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	--ENHANCING	
		
    sets.midcast['Enhancing Magic'] = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Clerisy Strap +1",
    ammo="Ghastly Tathlum +1",
    head="Befouled Crown",
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet="Regal Pumps +1",
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Andoaa Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",
}
		
	sets.midcast['Enhancing Magic'].Perpetuance = {hands="Arbatel Bracers +3",}
	
	sets.midcast['Enhancing Magic'].Klimaform = {feet="Arbatel Loafers +3",}
	
	--REGEN V
	

	
	sets.midcast['Enhancing Magic']['Regen V'] = {}
	
	
	sets.midcast['Enhancing Magic']['Regen V'].Potency ={
        main={ name="Musa", augments={'Path: C',}},
        sub="Clerisy Strap +1",
        ammo="Ghastly Tathlum +1",
        head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
        body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +10',}},
        hands="Arbatel Bracers +3",
        legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
        feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
        neck="Incanter's Torque",
        waist="Embla Sash",
        left_ear="Hecate's Earring",
        right_ear="Loquac. Earring",
        left_ring="Stikini Ring +1",
        right_ring="Stikini Ring +1",
        back="Fi Follet Cape +1",
    }



sets.midcast['Enhancing Magic']['Regen V'].Duration = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Clerisy Strap +1",
    ammo="Ghastly Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +10',}},
    hands="Arbatel Bracers +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Hecate's Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Fi Follet Cape +1",
}
 
 
 
 sets.midcast['Enhancing Magic']['Regen V'].Mix = {
    main={ name="Musa", augments={'Path: C',}},
    sub="Clerisy Strap +1",
    ammo="Pemphredo Tathlum",
    head="Arbatel Bonnet +3",
    body={ name="Telchine Chas.", augments={'Mag. Acc.+19','Enh. Mag. eff. dur. +10',}},
    hands="Arbatel Bracers +3",
    legs={ name="Telchine Braconi", augments={'Enh. Mag. eff. dur. +10',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Embla Sash",
    left_ear="Mimir Earring",
    right_ear="Calamitous Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Bookworm's Cape", augments={'INT+3','Helix eff. dur. +12','"Regen" potency+10',}},
}

    sets.midcast.Refresh = {
		main={ name="Musa", augments={'Path: C',}},
		ammo="Ombre Tathlum +1",
		head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		feet="Inspirited Boots",
		neck="Incanter's Torque",
		waist="Austerity Belt +1",
		left_ear="Gwati Earring",
		right_ear="Mendi. Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back="Solemnity Cape",}
	
    sets.midcast.Haste = {
		main={ name="Musa", augments={'Path: C',}},
		ammo="Ombre Tathlum +1",
		head={ name="Telchine Cap", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +9',}},
		body={ name="Telchine Chas.", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		hands={ name="Telchine Gloves", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		legs={ name="Telchine Braconi", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +8',}},
		feet={ name="Telchine Pigaches", augments={'"Conserve MP"+5','Enh. Mag. eff. dur. +10',}},
		neck="Incanter's Torque",
		waist="Austerity Belt +1",
		left_ear="Gwati Earring",
		right_ear="Mendi. Earring",
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back="Solemnity Cape",}
	
	--PHALANX
	
    sets.midcast.Phalanx = {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Ghastly Tathlum +1",
    head={ name="Chironic Hat", augments={'AGI+7','Attack+19','Phalanx +3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    body={ name="Chironic Doublet", augments={'Weapon skill damage +3%','Pet: Attack+15 Pet: Rng.Atk.+15','Phalanx +4',}},
    hands={ name="Chironic Gloves", augments={'MND+10','STR+8','Phalanx +4','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+18','Accuracy+27','Phalanx +2','Accuracy+9 Attack+9',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
		
	sets.midcast.PhalanxSelf = {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Ghastly Tathlum +1",
    head={ name="Chironic Hat", augments={'AGI+7','Attack+19','Phalanx +3','Mag. Acc.+10 "Mag.Atk.Bns."+10',}},
    body={ name="Chironic Doublet", augments={'Weapon skill damage +3%','Pet: Attack+15 Pet: Rng.Atk.+15','Phalanx +4',}},
    hands={ name="Chironic Gloves", augments={'MND+10','STR+8','Phalanx +4','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
    legs={ name="Merlinic Shalwar", augments={'Mag. Acc.+18','Accuracy+27','Phalanx +2','Accuracy+9 Attack+9',}},
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
	
    sets.midcast.Aquaveil = {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Ghastly Tathlum +1",
    head="Amalric Coif +1",
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +3",
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Incanter's Torque",
    waist="Emphatikos Rope",
    left_ear="Malignance Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
	
    sets.midcast.Stoneskin = {
    main={ name="Musa", augments={'Path: C',}},
    ammo="Ghastly Tathlum +1",
    head={ name="Telchine Cap", augments={'Enh. Mag. eff. dur. +10',}},
    body={ name="Peda. Gown +1", augments={'Enhances "Enlightenment" effect',}},
    hands="Arbatel Bracers +3",
    legs="Shedir Seraweels",
    feet={ name="Telchine Pigaches", augments={'Mag. Evasion+18','"Fast Cast"+3','Enh. Mag. eff. dur. +10',}},
    neck="Nodens Gorget",
    waist="Siegel Sash",
    left_ear="Earthcry Earring",
    right_ear="Mendi. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Solemnity Cape",
}
	
	
	--ENFEEBLING
	
    sets.midcast['Enfeebling Magic'] = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Pemphredo Tathlum",
    head="Acad. Mortar. +2",
    body="Academic's Gown",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Acad. Loafers +2",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist={ name="Obstin. Sash", augments={'Path: A',}},
    left_ear="Regal Earring",
    right_ear="Malignance Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back={ name="Aurist's Cape +1", augments={'Path: A',}},
}


    sets.midcast['Enfeebling Magic'].Mid = set_combine(sets.midcast['Enfeebling Magic'],{ear1="Mendicant's earring"})
    
	sets.midcast['Enfeebling Magic'].Resistant = set_combine(sets.midcast['Enfeebling Magic'].Mid, {ear1="Healing Earring"}) 
    
	sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
	
	sets.midcast['Dark Magic'] = {}
	
	sets.midcast.Drain = {
    main={ name="Rubicundity", augments={'Mag. Acc.+5','Dark magic skill +1','"Conserve MP"+2',}},
    sub={ name="Rubicundity", augments={'Mag. Acc.+8','"Mag.Atk.Bns."+9','Dark magic skill +8','"Conserve MP"+6',}},
    ammo="Sroda Tathlum",
    head="Pixie Hairpin +1",
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs={ name="Peda. Pants +2", augments={'Enhances "Tabula Rasa" effect',}},
    feet="Agwu's Pigaches",
    neck="Erra Pendant",
    waist="Fucho-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Evanescence Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}

	sets.midcast.Aspir = sets.midcast.Drain
 
	--Occult Acumen
	
	sets.midcast.OccultAcumen = {ammo="Hasty Pinion +1",
    head="Welkin Crown",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+2','"Occult Acumen"+10','MND+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+7',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Occult Acumen"+11',}},
    neck="Combatant's Torque",
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
 
 
 
 
 
 
 
 
 
	--STUNS
 
	sets.midcast.StunRecast = {    
		main="Tupsimati",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+9',}},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+9','"Mag.Atk.Bns."+10',}},}
    
	sets.midcast.StunAcc = {    
		main="Tupsimati",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Agwu's Cap",
		body="Arbatel Gown +3",
		hands="Agwu's Robe",
		legs="Agwu's Slops",
		feet="Arbatel Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+9',}},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+9','"Mag.Atk.Bns."+10',}},}
    
	sets.midcast.StunHybrid = {    
		main="Tupsimati",
		sub="Enki Strap",
		ammo="Pemphredo Tathlum",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Arbatel Bracers +3",
		legs="Arbatel Pants +3",
		feet="Arbatel Loafers +3",
		neck={ name="Argute Stole +2", augments={'Path: A',}},
		waist="Luminary Sash",
		left_ear="Malignance Earring",
		right_ear={ name="Arbatel Earring", augments={'System: 1 ID: 1676 Val: 0','Mag. Acc.+9',}},
		left_ring={name="Stikini Ring +1", bag="wardrobe1"},
		right_ring={name="Stikini Ring +1", bag="wardrobe3"},
		back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+9','"Mag.Atk.Bns."+10',}},}

	--ELEMENTAL
     
    sets.midcast['Elemental Magic'] = {
        main={ name="Bunzi's Rod", augments={'Path: A',}},
        sub="Culminus",
        ammo="Sroda Tathlum",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Arbatel Gown +3",
        hands="Arbatel Bracers +3",
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Hachirin-no-Obi",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
    }

	--BURST-A SET
	
	sets.midcast['Elemental Magic'].Burst = {
        main="Wizard's Rod",
        sub="Culminus",
        ammo="Pemphredo Tathlum",
        head="Agwu's Cap",
        body="Arbatel Gown +3",
        hands="Agwu's Gages",
        legs="Agwu's Slops",
        feet="Arbatel Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Hachirin-no-Obi",
        left_ear="Malignance Earring",
        right_ear="Regal Earring",
        left_ring="Metamorph Ring +1",
        right_ring="Freke Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
    }

	
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak",})
 
 	sets.midcast['Elemental Magic'].OccultAcumen = {ammo="Hasty Pinion +1",
    head="Welkin Crown",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+2','"Occult Acumen"+10','MND+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+7',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Occult Acumen"+11',}},
    neck="Combatant's Torque",
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Chirich Ring +1",
    back="Null Shawl",
}
 
 
 	sets.midcast['Elemental Magic'].Helix = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Crematio Earring",
    right_ear="Regal Earring",
    left_ring="Mujin Band",
    right_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
   
    sets.midcast['Elemental Magic'].Helix.MB = {
    main="Wizard's Rod",
    sub="Ammurapi Shield",
    ammo={ name="Ghastly Tathlum +1", augments={'Path: A',}},
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Mujin Band",
    back={ name="Bookworm's Cape", augments={'INT+2','MND+3','Helix eff. dur. +20',}},
}


	sets.midcast['Elemental Magic'].Luminohelix = {
    main="Daybreak",
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Crematio Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Weather. Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}



    
    sets.midcast['Elemental Magic'].Luminohelix.MB = {
        main="Daybreak",
        sub="Culminus",
        ammo="Ghastly Tathlum +1",
        head={ name="Agwu's Cap", augments={'Path: A',}},
        body="Agwu's Robe",
        hands={ name="Agwu's Gages", augments={'Path: A',}},
        legs="Arbatel Pants +3",
        feet="Arbatel Loafers +3",
        neck={ name="Argute Stole +2", augments={'Path: A',}},
        waist="Skrymir Cord",
        left_ear="Crematio Earring",
        right_ear="Regal Earring",
        left_ring="Freke Ring",
        right_ring="Weatherspoon Ring",
        back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
    }



		
	sets.midcast['Elemental Magic'].Noctohelix = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head="Pixie Hairpin +1",
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Crematio Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}
	
    sets.midcast['Elemental Magic'].Noctohelix.MB = {
    main="Wizard's Rod",
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head="Pixie Hairpin +1",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Skrymir Cord",
    left_ear="Crematio Earring",
    right_ear="Regal Earring",
    left_ring="Freke Ring",
    right_ring="Archon Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}


	sets.midcast.Kaustra = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head={ name="Agwu's Cap", augments={'Path: A',}},
    body="Arbatel Gown +3",
    hands="Arbatel Bracers +3",
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
}


    sets.midcast.Kaustra.MB = {
    main="Wizard's Rod",
    sub="Culminus",
    ammo="Ghastly Tathlum +1",
    head="Arbatel Bonnet +3",
    body={ name="Agwu's Robe", augments={'Path: A',}},
    hands={ name="Agwu's Gages", augments={'Path: A',}},
    legs={ name="Agwu's Slops", augments={'Path: A',}},
    feet="Arbatel Loafers +3",
    neck={ name="Argute Stole +2", augments={'Path: A',}},
    waist="Hachirin-no-Obi",
    left_ear="Malignance Earring",
    right_ear="Regal Earring",
    left_ring={ name="Metamor. Ring +1", augments={'Path: A',}},
    right_ring="Evanescence Ring",
    back={ name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Mag.Atk.Bns."+10',}},
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

    sets.Obi = {waist="Hachirin-no-Obi",}
	
	sets.Orpheus = {waist="Orpheus's Sash",}
    
	sets.Adoulin = {"Counselor's Garb",}

    sets.MoveSpeed = {feet="Herald's Gaiters",}
    
    sets.TreasureHunter = {
    hands="Volte Bracers",
    waist="Chaac Belt",
}

sets.midcast['Elemental Magic'].Occult = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Ammurapi Shield",
    ammo="Hasty Pinion +1",
    head="Welkin Crown",
    body={ name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+2','"Occult Acumen"+10','MND+4',}},
    hands={ name="Merlinic Dastanas", augments={'"Mag.Atk.Bns."+6','"Occult Acumen"+11','CHR+7',}},
    legs="Perdition Slops",
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+20','"Occult Acumen"+11',}},
    neck="Combatant's Torque",
    waist="Oneiros Rope",
    left_ear="Dedition Earring",
    right_ear="Crep. Earring",
    left_ring="Crepuscular Ring",
    right_ring="Chirich Ring +1",
    back="Solemnity Cape",
}



	sets.latent_refresh = {waist="Fucho-no-Obi",}
 
	sets.buff['Sublimation'] = {
    main="Siriti",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Acad. Mortar. +2",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet="Nyame Sollerets",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Embla Sash",
    left_ear="Lempo Earring",
    right_ear="Loquac. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape",
}
	
	sets.midcast.Ebullience = {head="Arbatel Bonnet +3",}

--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--
 

    sets.idle = {
    main="Daybreak",
    sub="Ammurapi Shield",
    ammo="Staunch Tathlum +1",
    head="Befouled Crown",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck="Elite Royal Collar",
    waist="Embla Sash",
    left_ear="Malignance Earring",
    right_ear="Barkaro. Earring",
    left_ring="Stikini Ring +1",
    right_ring="Defending Ring",
    back="Seshaw Cape",
}
 
    sets.idle.Refresh = {
    main="Daybreak",
    sub="Genmei Shield",
    ammo="Homiliary",
    head="Befouled Crown",
    body="Arbatel Gown +3",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Assid. Pants +1",
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Fucho-no-Obi",
    left_ear="Magnetic Earring",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape",
}

		
	sets.idle.DTmeva = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Arbatel Bonnet +3",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	

 
	
--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

	sets.engaged ={
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Arbatel Bonnet +3",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
}
	
	
	sets.engaged.StoreTP = {
		main="Tupsimati",
		sub="Mensch strap +1",
		ammo="Staunch Tathlum +1",
		head="Arbatel Bonnet +3",
		body="Arbatel Gown +3",
		hands="Nyame Gauntlets",
		legs="Arbatel Pants +3",
		feet={ name="Merlinic Crackows", augments={'CHR+1','Pet: AGI+4','"Refresh"+2','Accuracy+6 Attack+6',}},
		neck="Elite Royal Collar",
		waist="Embla Sash",
		left_ear="Dawn Earring",
		right_ear="Infused Earring",
		left_ring="Paguroidea Ring",
		right_ring="Defending Ring",
		back="Kumbira Cape",}
	
	sets.engaged.DTmeva = {
    main={ name="Bunzi's Rod", augments={'Path: A',}},
    sub="Genmei Shield",
    ammo="Staunch Tathlum +1",
    head="Arbatel Bonnet +3",
    body="Adamantite Armor",
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs="Arbatel Pants +3",
    feet="Arbatel Loafers +3",
    neck={ name="Warder's Charm +1", augments={'Path: A',}},
    waist="Carrier's Sash",
    left_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    right_ear="Eabani Earring",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Null Shawl",
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

	if spell.english == "Impact" then
		equip(sets.precast.FC.Impact)
	end

end

    
function job_post_precast(spell, action, spellMap, eventArgs)

	if spell.english == "Impact" then
        equip({head=empty,body="Twilight Cloak"})
    elseif spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Hachirin-no-obi"
    end
	
    if (spell.type == 'WhiteMagic' and (buffactive['Light Arts'] or buffactive['Addendum: White']) and not (buffactive['Celerity'] or buffactive['Accession'])) then
		equip(sets.precast.FC.Grimoire)
    elseif (spell.skill == 'Enfeebling Magic' or spell.skill == 'Dark Magic') and (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and not (buffactive['Alacrity'] or buffactive['Manifestation']) then
        equip(sets.precast.FC.Grimoire)
	elseif (spell.skill == 'Elemental Magic' and spell.english ~= "Impact") and (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and not buffactive['Alacrity'] then
		equip(sets.precast.FC.Grimoire)
	elseif (spell.skill == 'Elemental Magic' and spell.english == "Impact") and (buffactive['Dark Arts'] or buffactive['Addendum: Black']) and not
	buffactive['Alacrity'] then
		equip(sets.precast.FC.Impact.Grimoire)
	end
	
end
 
 
 
function job_midcast(spell, action, spellMap, eventArgs)


	if (spell.english == 'Pyrohelix' or spell.english == 'Pyrohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
		
	if (spell.english == 'Cryohelix' or spell.english == 'Cryohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Ionohelix' or spell.english == 'Ionohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Hydrohelix' or spell.english == 'Hydrohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Geohelix' or spell.english == 'Geohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Anemohelix' or spell.english == 'Anemohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end

	if (spell.english == 'Luminohelix' or spell.english == 'Luminohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Luminohelix)
	end
	
	if (spell.english == 'Noctohelix' or spell.english == 'Noctohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Noctohelix)
	end
	
	if spell.english == 'Kaustra' and state.HelixMode.value == 'Normal' then
		equip(sets.midcast.Kaustra)
	end

	if (spell.english == 'Pyrohelix' or spell.english == 'Pyrohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
		
	if (spell.english == 'Cryohelix' or spell.english == 'Cryohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Ionohelix' or spell.english == 'Ionohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Hydrohelix' or spell.english == 'Hydrohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Geohelix' or spell.english == 'Geohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Anemohelix' or spell.english == 'Anemohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Luminohelix' or spell.english == 'Luminohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Luminohelix.MB)
	end
	
	if (spell.english == 'Noctohelix' or spell.english == 'Noctohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Noctohelix.MB)
	end
	
	if spell.english == 'Kaustra' and state.HelixMode.value == 'MB' then
		equip(sets.midcast.Kaustra.MB)
	end


end



 function job_post_midcast(spell, action, spellMap, eventArgs)
 
	if (spell.english == 'Pyrohelix' or spell.english == 'Pyrohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
		
	if (spell.english == 'Cryohelix' or spell.english == 'Cryohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Ionohelix' or spell.english == 'Ionohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Hydrohelix' or spell.english == 'Hydrohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Geohelix' or spell.english == 'Geohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end
	
	if (spell.english == 'Anemohelix' or spell.english == 'Anemohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Helix)
	end

	if (spell.english == 'Luminohelix' or spell.english == 'Luminohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Luminohelix)
	end
	
	if (spell.english == 'Noctohelix' or spell.english == 'Noctohelix II') and state.HelixMode.value == 'Normal' then
		equip(sets.midcast['Elemental Magic'].Noctohelix)
	end
	
	if spell.english == 'Kaustra' and state.HelixMode.value == 'Normal' then
		equip(sets.midcast.Kaustra)
	end

	if (spell.english == 'Pyrohelix' or spell.english == 'Pyrohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
		
	if (spell.english == 'Cryohelix' or spell.english == 'Cryohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Ionohelix' or spell.english == 'Ionohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Hydrohelix' or spell.english == 'Hydrohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Geohelix' or spell.english == 'Geohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Anemohelix' or spell.english == 'Anemohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Helix.MB)
	end
	
	if (spell.english == 'Luminohelix' or spell.english == 'Luminohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Luminohelix.MB)
	end
	
	if (spell.english == 'Noctohelix' or spell.english == 'Noctohelix II') and state.HelixMode.value == 'MB' then
		equip(sets.midcast['Elemental Magic'].Noctohelix.MB)
	end
	
	if spell.english == 'Kaustra' and state.HelixMode.value == 'MB' then
		equip(sets.midcast.Kaustra.MB)
	end
	
	if spell.skill == 'Enhancing Magic' and buffactive['Perpetuance'] then
		equip(set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic'].Perpetuance))
	end
	
	if spell.english:startswith('Regen') and state.Regen.value == 'Potency' then
			equip(set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic']['Regen V'].Potency))
		elseif spell.english:startswith('Regen') and state.Regen.value == 'Duration' then
			equip(set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic']['Regen V'].Duration))
		elseif spell.english:startswith('Regen') and state.Regen.value == 'Mix' then
			equip(set_combine(sets.midcast['Enhancing Magic'], sets.midcast['Enhancing Magic']['Regen V'].Mix))
	end
	
	if spell.skill == 'Elemental Magic' and (spell.element == world.weather_element) and world.weather_intensity == 2 then
			equip(sets.Obi)
	elseif spell.skill == 'Elemental Magic' and (spell.element == world.weather_element) and spell.target.distance > 7 then
			equip(sets.Obi)
	elseif spell.skill == 'Elemental Magic' and spell.target.distance < 7 then
			equip(sets.Orpheus)
	end 
	
	if (spell.english == "Phalanx" and spell.target.type == 'SELF') and not buffactive['Accession'] then
		equip(sets.midcast.PhalanxSelf)
	end
	
	if spell.skill == 'Elemental Magic' and buffactive['Ebullience'] then
		equip(sets.midcast.Ebullience)
	end
	

end
 
function job_aftercast(spell, action, spellMap, eventArgs)

    if not spell.interrupted then     
		elseif spell.english == "Sleep II" or spell.english == "Sleepga II" then -- Sleep II Countdown --
            send_command('wait 60;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif spell.english == "Sleep" or spell.english == "Sleepga" then -- Sleep & Sleepga Countdown --
            send_command('wait 30;input /echo Sleep Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Sleep Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Sleep Effect: [WEARING OFF IN 5 SEC.]')
        elseif buffactive["Light Arts"] and spell.english == "Regen" then -- Regen Countdown --
            send_command('wait 90;input /echo Regen Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Regen Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Regen Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Regen"and not buffactive ["Light Arts"] then -- Regen Countdown --
            send_command('wait 30;input /echo Regen Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Regen Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Regen Effect: [WEARING OFF IN 5 SEC.]')
		elseif buffactive["Dark Arts"] and spell.english == 'Helix' then -- Helix Countdown --
            send_command('wait 90;input /echo Helix Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Helix Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Helix Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == 'Helix' and not buffactive["Dark Arts"]then -- helix Countdown --
            send_command('wait 30;input /echo Helix Effect: [WEARING OFF IN 30 SEC.];wait 15;input /echo Helix Effect: [WEARING OFF IN 15 SEC.];wait 10;input /echo Helix Effect: [WEARING OFF IN 5 SEC.]')
		elseif spell.english == "Break" then -- Break Countdown --
            send_command('wait 20;input /echo Break Effect: [WEARING OFF IN 10 SEC.]')
        elseif spell.english == "Paralyze" then -- Paralyze Countdown --
             send_command('wait 110;input /echo Paralyze Effect: [WEARING OFF IN 10 SEC.]')
        elseif spell.english == "Slow" then -- Slow Countdown --
            send_command('wait 110;input /echo Slow Effect: [WEARING OFF IN 10 SEC.]') 
		elseif spell.english == "Dia" then -- dia Countdown --
            send_command('wait 50;input /echo Dia Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english == "Dia II" then -- Slow Countdown --
            send_command('wait 110;input /echo Dia II Effect: [WEARING OFF IN 10 SEC.]')  
        elseif spell.english == "Bio" then -- Bio Countdown --
            send_command('wait 50;input /echo Bio Effect: [WEARING OFF IN 10 SEC.]') 
		elseif spell.english == "Bio II" then -- Bio Countdown --
            send_command('wait 110;input /echo Bio II Effect: [WEARING OFF IN 10 SEC.]') 
		end
    end
 

 
function customize_melee_set(meleeSet)

    if (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) and state.OffenseMode.Value == 'DT' then
		meleeSet = set_combine(meleeSet, sets.engaged.HasteCap, sets.engaged.HasteCap.DT)
	elseif (buffactive['Embrava'] or buffactive.march == 1 or buffactive[580] or buffactive['Mighty Guard']) then
        meleeSet = set_combine(meleeSet, sets.engaged.HasteCap)
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
	
	if buffactive['Doom'] then
        meleeSet = set_combine(meleeSet, sets.Doom)
    end
	
	if buffactive['Elvorseal'] then 
		meleeSet = set_combine(meleeSet, sets.Domain)
	end
	
	return meleeSet
	
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
	

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
	
	
	if state.ZoneRing.value == 'Warp' then
		idleSet = set_combine(idleSet, {right_ring="Warp Ring",main="Warp Cudgel"})
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
	
	
    return idleSet
	
end
 
 
function nuke(spell, action, spellMap, eventArgs)
    if player.target.type == 'MONSTER' then
        if state.AOE.value then
            send_command('input /ma "'..degrade_array[element_table:append('ga')][#degrade_array[element_table:append('ga')]]..'" '..tostring(player.target.name))
        else
            send_command('input /ma "'..degrade_array[element_table][#degrade_array[element_table]]..'" '..tostring(player.target.name))
        end
    else 
        add_to_chat(5,'A Monster is not targetted.')
    end
end
 
function job_self_command(commandArgs, eventArgs)
    if commandArgs[1] == 'element' then
        if commandArgs[2] then
            if element_table:contains(commandArgs[2]) then
                element_table = commandArgs[2]
                add_to_chat(5, 'Current Nuke element ['..element_table..']')
            else
                add_to_chat(5,'Incorrect Element value')
                return
            end
        else
            add_to_chat(5,'No element specified')
        end
    elseif commandArgs[1] == 'nuke' then
        nuke()
    end
end



 
 
function refine_various_spells(spell, action, spellMap, eventArgs)
    local aspirs = S{'Aspir','Aspir II','Aspir III'}
    local sleeps = S{'Sleep','Sleep II'}
    local sleepgas = S{'Sleepga','Sleepga II'}
 
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
 
    local spell_index
 
    if spell_recasts[spell.recast_id] > 0 then
        if spell.skill == 'Elemental Magic' then
            local ele = tostring(spell.element):append('ga')
            --local ele2 = string.sub(ele,1,-2)
            if table.find(degrade_array[ele],spell.name) then
                spell_index = table.find(degrade_array[ele],spell.name)
                if spell_index > 1 then
                    newSpell = degrade_array[ele][spell_index - 1]
                    add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
                    send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                    eventArgs.cancel = true
                end
            else 
                spell_index = table.find(degrade_array[spell.element],spell.name)
                if spell_index > 1 then
                    newSpell = degrade_array[spell.element][spell_index - 1]
                    add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
                    send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                    eventArgs.cancel = true
                end
            end
        elseif aspirs:contains(spell.name) then
            spell_index = table.find(degrade_array['Aspirs'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Aspirs'][spell_index - 1]
                add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        elseif sleepgas:contains(spell.name) then
            spell_index = table.find(degrade_array['Sleepgas'],spell.name)
            if spell_index > 1 then
                newSpell = degrade_array['Sleepgas'][spell_index - 1]
                add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..newSpell..' instead.')
                send_command('@input /ma '..newSpell..' '..tostring(spell.target.raw))
                eventArgs.cancel = true
            end
        end
    end
end

mov = {counter=0}
if player and player.index and windower.ffxi.get_mob_by_index(player.index) then
    mov.x = windower.ffxi.get_mob_by_index(player.index).x
    mov.y = windower.ffxi.get_mob_by_index(player.index).y
    mov.z = windower.ffxi.get_mob_by_index(player.index).z
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
    if mov.counter>15 then
        local pl = windower.ffxi.get_mob_by_index(player.index)
        if pl and pl.x and mov.x then
            dist = math.sqrt( (pl.x-mov.x)^2 + (pl.y-mov.y)^2 + (pl.z-mov.z)^2 )
            if dist > 1 and not moving then
                state.Moving.value = true
                send_command('gs c update')
                send_command('gs equip sets.MoveSpeed')
                if world.area:contains("Adoulin") then
                    send_command('gs equip sets.Adoulin')
                end

                moving = true

            elseif dist < 1 and moving then
                state.Moving.value = false
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

windower.register_event('zone change', function()

	if state.ZoneRing.Value ~= 'None' then
		send_command('gs c set ZoneRing None')
		send_command('setbgm 25')
	end
	
	
end)

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)

    if stateField == 'Offense Mode' then
        if newValue == 'Locked' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
	
end 
-- general cleanup updater
function job_buff_change(buff, gain)
	if (not midaction() and not state.Moving.Value == 'true') and (buff and gain) or (buff and not gain) then
		send_command('gs c update')
	end
	
	if buff == 'Regen' and gain then
		send_command('wait 0.1; gs c update')
	end
	
	if buff == 'Sublimation: Activated' and gain then
		send_command('wait 0.1; gs c update')
	end

	--[[if state.Moving.value == 'false' then
		if not buffactive[580] then
		send_command('send Captainrayfus /ma "Indi-Haste" <me>')
		end
	end]]
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------
--[[function job_update(cmdParams, eventArgs)
    job_display_current_state(eventArgs)
    eventArgs.handled = true
end]]
 



function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' and newValue == 'Tupsimati' then
		send_command(' input /equip main "Tupsimati";') 
		disable('main','sub','range')
   	elseif newValue == 'Akademos' then
		send_command(' input /equip main "Akademos";')
		disable('main','sub','range')
    elseif newValue == 'None' then
        enable('main','sub','range')
        end
    end


-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------
 
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 19)
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
	
		textinbox = textinbox .. drawTitle("  Local Keybinds  ") .. textColorNewLine
		textinbox = textinbox .. textColor .. "(F8) Equip & Lock Weapons" .. textColorNewLine
	
        textinbox = textinbox .. drawTitle("  Current Settings  ") --Draws the title and puts '=', example ====     Mode     ==== around the title passed in
		textinbox = textinbox .. textColor .. "TP Mode (F9) : " .. tostring(state.OffenseMode.current) .. textColorNewLine
		
		textinbox = textinbox .. textColor .. "Casting Mode (CTRL+F9) : " .. tostring(state.CastingMode.current) .. textColorNewLine

        textinbox = textinbox .. textColor .. "Helix Mode (CTRL+F10) : " .. tostring(state.HelixMode.current) .. textColorNewLine
		
		if (buffactive['Dark Arts'] or buffactive['Addendum: Black']) then
		textinbox = textinbox .. "GRIMOIRE: " .. "\\cs(255, 75, 255)" .. "Dark Arts" .. textColorNewLine
		elseif (buffactive['Light Arts'] or buffactive['Addendum: White']) then
		textinbox = textinbox .. "GRIMOIRE: " .. "\\cs(255, 255, 75)" .. "Light Arts" .. textColorNewLine
		end
		
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Enfeeb Mode (F11) : " .. tostring(state.Enfeeb.current) .. textColorNewLine
		textinbox = textinbox .. textColor .. "Regen Mode (CTRL+F11) : " .. tostring(state.Regen.current) .. textColorNewLine
		
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