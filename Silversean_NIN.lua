windower.add_to_chat(123,[[Red Mage Lua Author: Byrne #7894 (Discord))]])
windower.add_to_chat(160,[[Movement speed by default will not equip when engaged, Press F1 to handle auto-kiting while engaged.]])
--windower.add_to_chat(123,[[   <> It is reccommended you use User-Global.lua at https://github.com/Byrne119/Gearswap ]]) --Right click and save link as...
--windower.add_to_chat(123,[[   <> if you have done this, put -- before lines 18 and 19. Remove -- before sharing!]])
include('organizer-lib')


-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
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

function job_setup()
setupTextWindow(1350, 1100)

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
	state.OffenseMode:options('DT', 'Normal', 'Accuracy')
    state.WeaponLockMode = M('Unlocked', 'Locked')
    state.IdleMode:options('DT','Normal','Regen')
	state.ZoneRing = M('None','Warp', 'Holla', 'Dem', 'Mea')
	state.EngagedMoving = M('Disabled','Enabled')
	state.DoomMode = M('OFF', 'Doom')
	state.SubtleBlow = M('Off', 'On')
    state.Moving = M('false', 'true')
	state.Kiting = M('false', 'true')
	state.Utsusemi = M('DT', 'Normal')
    select_default_macro_book()

	send_command('bind f7 gs c cycle SubtleBlow')
	send_command('bind f2 gs c cycle EngagedMoving')
	send_command('bind f9 gs c cycle OffenseMode')
	send_command('bind ^f9 gs c cycle UtsusemiMode')
	send_command('bind f10 gs c cycle IdleMode')
	send_command('bind f11 gs c cycle Enfeeb')
	send_command('bind f12 gs c cycle WeaponLockMode')
	send_command('bind f5 gs c cycle ZoneRing')
	send_command('bind f8 gs c cycle Kiting')
	send_command('bind ^f8 send Captaindoofus exec DoofusSleep.txt')
	send_command('bind ^` input /spontaneity;wait 1.1;input /impact <stnpc>')
	send_command('bind !` send captaindoofus chocobomazurka')
	
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



	sets.Enmity = {ammo="Aqreqaq Bomblet",
    head="Malignance Chapeau",
    body="Emet Harness +1",
    hands="Kurys Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Moonlight Necklace",
    waist="Trance Belt",
    left_ear="Trux Earring",
    right_ear="Pluto's Pearl",
    left_ring="Provocare Ring",
    right_ring="Eihwaz Ring",
    back={ name="Andartia's Mantle", augments={'AGI+20','Eva.+20 /Mag. Eva.+20','Evasion+10','Enmity+10','Spell interruption rate down-10%',}},
}

    sets.precast.JA['Innin'] = {head="Hattori zukin +2",}
	sets.precast.JA['Yonin'] = {legs="Hattori hakama +2",}
	sets.precast.JA['Futae'] = {hands="Hattori tekko +2",}
	
    
    --Red Mage gets plenty of Fast Cast through traits and gear
	--So I would reccomend avoiding quick cast due to equipping errors.
	sets.precast.FC =   {ammo="Sapience Orb",
    head={ name="Herculean Helm", augments={'"Fast Cast"+6','MND+8','Mag. Acc.+7',}},
    body={ name="Herculean Vest", augments={'Mag. Acc.+24','"Fast Cast"+6','"Mag.Atk.Bns."+11',}},
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+3','"Fast Cast"+6','MND+9','Mag. Acc.+11',}},
    feet={ name="Herculean Boots", augments={'Attack+20','"Fast Cast"+6','"Mag.Atk.Bns."+10',}},
    neck="Voltsurge Torque",
    waist="Cornelia's Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
    back={ name="Andartia's Mantle", augments={'Eva.+20 /Mag. Eva.+20','"Fast Cast"+10',}},
}
	
	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {ammo="Sapience Orb",
    head="Malignance Chapeau",
    body="Passion Jacket",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs={ name="Herculean Trousers", augments={'"Mag.Atk.Bns."+12','"Fast Cast"+4','STR+3','Mag. Acc.+11',}},
    feet={ name="Taeon Boots", augments={'Accuracy+9','"Fast Cast"+3','Phalanx +3',}},
    neck="Voltsurge Torque",
    waist="Reiki Yotai",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring",
    right_ring="Kishar Ring",
    back="Sacro Mantle",
})
	
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
	
		
       

--==================================================--
--   __  __   _       _                        _    --
--  |  \/  | (_)     | |                      | |   --
--  | \  / |  _    __| |   ___    __ _   ___  | |_  --
--  | |\/| | | |  / _` |  / __|  / _` | / __| | __| --
--  | |  | | | | | (_| | | (__  | (_| | \__ \ | |_  --
--  |_|  |_| |_|  \__,_|  \___|  \__,_| |___/  \__| --
--                                                  --
--==================================================--
	
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
	
	sets.midcast.Phalanx = {    
		main="Heishi Shorinken",
		sub="Kraken Club",
		ammo="Crepuscular Pebble",
		head={ name="Taeon Chapeau", augments={'Spell interruption rate down -9%','Phalanx +3',}},
		body={ name="Taeon Tabard", augments={'Accuracy+19 Attack+19','Spell interruption rate down -10%','Phalanx +3',}},
		hands={ name="Herculean Gloves", augments={'MND+4','VIT+13','Phalanx +5','Mag. Acc.+9 "Mag.Atk.Bns."+9',}},
		legs={ name="Taeon Tights", augments={'Spell interruption rate down -10%','Phalanx +3',}},
		feet={ name="Herculean Boots", augments={'VIT+10','Pet: "Store TP"+2','Phalanx +4',}},
		neck={ name="Loricate Torque +1", augments={'Path: A',}},
		waist="Flume Belt +1",
		left_ear="Genmei Earring",
		right_ear="Odnowa Earring +1",
		left_ring="Defending Ring",
		right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
		back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		
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
	
	sets.midcast.Migawari = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Hattori Ningi +2",
    hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
    legs="Malignance Tights",
    feet="Hattori Kyahan +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Suppanomimi",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},}
		
	sets.midcast.Utsusemi = {ammo="Staunch Tathlum +1",
    head="Malignance Chapeau",
    body="Hattori Ningi +2",
    hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
    legs="Malignance Tights",
    feet="Hattori Kyahan +3",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Suppanomimi",
    right_ear={ name="Odnowa Earring +1", augments={'Path: A',}},
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},}
		
	sets.midcast.UtsusemiDT = {main="Heishi Shorinken",
    sub="Kraken Club",
    ammo="Sapience Orb",
    head="Nyame Helm",
    body={ name="Adhemar Jacket +1", augments={'HP+105','"Fast Cast"+10','Magic dmg. taken -4',}},
    hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
    legs="Nyame Flanchard",
    feet="Hattori Kyahan +3",
    neck="Loricate Torque +1",
    waist="Audumbla Sash",
    left_ear="Etiolation Earring",
    right_ear="Loquac. Earring",
    left_ring="Weather. Ring +1",
    right_ring="Defending Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		
		
	sets.midcast['Ninjutsu'] = {ammo="Pemphredo Tathlum",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Mochizuki Tekko +3", augments={'Enh. "Ninja Tool Expertise" effect',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck="Sibyl Scarf",
    waist="Eschan Stone",
    left_ear="Moldavite Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Dingir Ring",
    back="Solemnity Cape",
}
	
	
	sets.midcast['Blue Magic'] = {}
		
	sets.midcast['Blue Magic'].MagicAccuracy = {    
		main="Sakpata's Sword",
		sub="Ammurapi Shield",
		ammo="Regal Gem",
		head="Malignance Chapeau",
		body="Atrophy Tabard +3",
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
		body="Atrophy Tabard +3",
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
		body="Atrophy Tabard +3",
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
		body="Atrophy Tabard +3",
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


    sets.precast.WS = {   
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		
	sets.precast.WS['Blade: Rin'] = {   
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	sets.precast.WS['Blade: Retsu'] = {    
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	sets.precast.WS['Blade: Teki'] = {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}
	
	
	sets.precast.WS['Blade: To'] = {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}
	
	
	
	
	sets.precast.WS['Blade: Chi'] = {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Fotia Gorget", augments={'Path: A',}},
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}
	
	
	sets.precast.WS['Blade: Jin'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	
	sets.precast.WS['Blade: Ten'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	
	
	sets.precast.WS['Blade: Yu'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	
	sets.precast.WS['Blade: Ku'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	
	
	
	
	
	
	sets.precast.WS['Blade: Shun'] =  {ammo="Coiste Bodhar",
    head="Mpaca's Cap",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Mpaca's Hose",
    feet="Hattori Kyahan +3",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Hattori Earring +2",
    left_ring="Gere Ring",
    right_ring="Ephramad's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}
	
	
	
	sets.precast.WS['Blade: Hi'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	sets.precast.WS['Aeolian Edge']	= {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		
	
		
		
	sets.precast.WS['Evisceration'] = {
    ammo="Oshasha's Treatise",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Nyame Gauntlets",
    legs="Nyame Flanchard",
    feet="Nyame Sollerets",
    neck="Fotia Gorget",
    waist="Orpheus's Sash",
    left_ear={ name="Moonshade Earring", augments={'Mag. Acc.+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
	
	
	
	sets.precast.WS['Savage Blade'] =  {ammo="Oshasha's Treatise",
    head={ name="Nyame Helm", augments={'Path: B',}},
    body={ name="Nyame Mail", augments={'Path: B',}},
    hands={ name="Nyame Gauntlets", augments={'Path: B',}},
    legs={ name="Nyame Flanchard", augments={'Path: B',}},
    feet={ name="Nyame Sollerets", augments={'Path: B',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist={ name="Sailfi Belt +1", augments={'Path: A',}},
    left_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +250',}},
    right_ear="Ishvara Earring",
    left_ring="Epaminondas's Ring",
    right_ring="Cornelia's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
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
		left_ring="Purity Ring",
		right_ring="Blenmot's Ring +1",
		back={ name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dual Wield"+10','Phys. dmg. taken-10%',}},}
		
	sets.SubtleBlow = {    
		neck="Bathy Choker +1",
		left_ring="Chirich Ring +1",
		right_ring="Chirich Ring +1",}
	
	sets.SubtleBlow.HasteCap = set_combine(sets.SubtleBlow, {
		left_ear="Digni. Earring",
		right_ear="Sherida Earring",})
		
	sets.Adoulin = {body="Councilor's Garb",}

    sets.MoveSpeed = {feet="Danzo Sune-ate"}
	
	sets.Obi = {waist="Hachirin-no-Obi",}
		
	sets.Orpheus = {waist="Orpheus's Sash",}
	

	
	
	
--=================================--
--      ___       _   _            --
--     |_ _|   __| | | |   ___     --
--      | |   / _` | | |  / _ \    --
--      | |  | (_| | | | |  __/    --
--     |___|  \__,_| |_|  \___|    --
--=================================--


    sets.idle.Normal = {main="Heishi Shorinken",
    sub="Kraken Club",
    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		
	sets.idle.DT = {main="Heishi Shorinken",
    sub="Kraken Club",
    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Loricate Torque +1", augments={'Path: A',}},
    waist="Audumbla Sash",
    left_ear="Suppanomimi",
    right_ear="Odnowa Earring +1",
    left_ring="Defending Ring",
    right_ring={ name="Dark Ring", augments={'Phys. dmg. taken -6%','Magic dmg. taken -4%',}},
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}	
	
    sets.idle.Regen = {main="Heishi Shorinken",
    sub="Kraken Club",
    ammo="Crepuscular Pebble",
    head="Malignance Chapeau",
    body="Malignance Tabard",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck="Bathy Choker +1",
    waist="Audumbla Sash",
    left_ear="Genmei Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-8%',}},}
		


--====================================================--
--     _____   ____      ____           _             --
--    |_   _| |  _ \    / ___|    ___  | |_   ___     --
--      | |   | |_) |   \___ \   / _ \ | __| / __|    --
--      | |   |  __/     ___) | |  __/ | |_  \__ \    --
--      |_|   |_|       |____/   \___|  \__| |___/    --
--====================================================--

	
	sets.default_melee_weapons = {main="Heishi Shorinken", sub="Kraken Club",}
	
    sets.engaged =   {ammo="Happo Shuriken",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear="Suppanomimi",
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}




	--sets.engaged.0Haste(39 DW) = {ammo="Happo Shuriken",
    --head="Hattori Zukin +2",
    --body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --hands="Hattori Tekko +2",
    --legs="Hattori Hakama +1",
    --feet="Hattori Kyahan +3",
    --neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    --waist="Reiki Yotai",
    --left_ear="Eabani Earring",
    --right_ear="Suppanomimi",
    --left_ring="Gere Ring",
    --right_ring="Epona's Ring",
    --back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
--}
	
	
	--sets.engaged.15Haste (32 DW)) = {ammo="Happo Shuriken",
    --head="Hattori Zukin +2",
    --body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --hands="Ken. Tekko +1",
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet="Hattori Kyahan +3",
    --neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    --waist="Reiki Yotai",
    --left_ear="Eabani Earring",
    --right_ear="Suppanomimi",
    --left_ring="Gere Ring",
    --right_ring="Epona's Ring",
    --back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
--}
	
	--sets.engaged.30Haste (21 DW) = {ammo="Happo Shuriken",
    --head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --body={ name="Adhemar Jacket +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    --neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    --waist="Reiki Yotai",
    --left_ear="Eabani Earring",
    --right_ear="Suppanomimi",
    --left_ring="Gere Ring",
    --right_ring="Epona's Ring",
    --back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
--}



	--sets.engaged.35Haste (12 DW) = {ammo="Happo Shuriken",
    --head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --body="Ken. Samue +1",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    --neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    --waist="Reiki Yotai",
    --left_ear="Eabani Earring",
    --right_ear="Suppanomimi",
    --left_ring="Gere Ring",
    --right_ring="Epona's Ring",
    --back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
--}
	
	
	
	--sets.engaged.CappedHaste (1DW) = {ammo="Happo Shuriken",
    --head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --body="Ken. Samue +1",
    --hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    --legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    --feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    --neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    --waist="Windbuffet Belt +1",
    --left_ear="Telos Earring",
    --right_ear="Dedition Earring",
    --left_ring="Gere Ring",
    --right_ring="Epona's Ring",
    --back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
--}
	
	
	
	
	
	
	
	
	
	sets.engaged.DT = {ammo="Happo Shuriken",
    head="Mpaca's Cap",
    body="Mpaca's Doublet",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Nyame Sollerets",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Alabaster Earring",
    right_ear="Dedition Earring",
    left_ring="Epona's Ring",
    right_ring="Gere Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}

	sets.engaged.HasteCap = {ammo="Happo Shuriken",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Windbuffet Belt +1",
    left_ear="Telos Earring",
    right_ear={ name="Hattori Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Store TP"+4',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}
		
	sets.engaged.HasteCap.DT =  {ammo="Happo Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +2",
    hands="Malignance Gloves",
    legs="Malignance Tights",
    feet="Malignance Boots",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Plat. Mog. Belt",
    left_ear="Telos Earring",
    right_ear={ name="Hattori Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+11','Mag. Acc.+11','"Store TP"+3',}},
    left_ring="Defending Ring",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}

	
	sets.engaged.Accuracy = {
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Gleti's Knife", augments={'Path: A',}},
    ammo="Happo Shuriken",
    head="Malignance Chapeau",
    body="Hattori Ningi +2",
    hands="Malignance Gloves",
    legs="Hattori Hakama +2",
    feet="Hattori Kyahan +3",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear={ name="Hattori Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Store TP"+4',}},
    left_ring="Chirich Ring +1",
    right_ring="Chirich Ring +1",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
}




sets.SubtleBlow = {
    main={ name="Heishi Shorinken", augments={'Path: A',}},
    sub={ name="Gleti's Knife", augments={'Path: A',}},
    ammo="Happo Shuriken",
    head={ name="Adhemar Bonnet +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    body="Ken. Samue +1",
    hands={ name="Adhemar Wrist. +1", augments={'DEX+12','AGI+12','Accuracy+20',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet="Ken. Sune-Ate +1",
    neck={ name="Ninja Nodowa +2", augments={'Path: A',}},
    waist="Reiki Yotai",
    left_ear="Eabani Earring",
    right_ear={ name="Hattori Earring +1", augments={'System: 1 ID: 1676 Val: 0','Accuracy+13','Mag. Acc.+13','"Store TP"+4',}},
    left_ring="Gere Ring",
    right_ring="Epona's Ring",
    back={ name="Andartia's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Parrying rate+5%',}},
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
	
	if spell.action_type == 'Ranged Attack' then
		equip(sets.precast.RA)
	end

	return
	
end

function job_post_precast(spell, action, spellMap, eventArgs)

	if (spell.type:lower() == 'weaponskill' and (spell.english == 'Blade: Chi' or spell.english == 'Blade: Teki' or spell.english == 'Blade: To' or spell.english == 'Blade: Yu')) 
		and (spell.element == world.weather_element) and world.weather_intensity == 2 then
			equip(sets.Obi)
	end
	
	if (spell.english == 'Blade: Chi' or spell.english == 'Blade: Teki' or spell.english == 'Blade: To' or spell.english == 'Blade: Yu') and player.tp >= 2800 then
			equip({ear1="Regal Earring",})
	end
	
	if spell.english == 'Dispelga' then
		equip(sets.precast.FC.Dispelga)
    end
	
	if (spell.english == 'Blade: Chi' or spell.english == 'Blade: Teki' or spell.english == 'Blade: To' or spell.english == 'Blade: Yu') and player.tp >= 1250 then
			equip({neck="Sanctity Necklace",})
	end
	
	if spell.action_type == 'Ranged Attack' then
		equip(sets.precast.RA)
	end
	
end
	


function job_midcast(spell, action, spellMap, eventArgs)

	
	if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' then
		send_command('wait 0.3; input //cancel Copy Image*')
	end
	
	if spell.english == 'Impact' then
		equip(sets.midcast.Impact)
	end
	
	if spell.english == 'Dispelga' then
		equip(sets.midcast.Dispelga)
    end
	
	if spell.english == 'Stoneskin' and buffactive['Stoneskin'] then
		send_command('wait 1; input //cancel Stoneskin')
	end
	
	if spell.action_type == 'Ranged Attack' then
		equip(sets.midcast.RA)
	end
	if spell.english == 'Migawari: Ichi' then
		equip(sets.midcast.Migawari)
	end
end


function job_post_midcast(spell, action, spellMap, eventArgs)
	
	
	if spell.action_type == 'Ranged Attack' then
		equip(sets.midcast.RA)
	end
	
	if state.Utsusemi.value == 'DT' then
		equip(sets.midcast.UtsusemiDT)
	end
	
end


function job_aftercast(spell, action, spellMap, eventArgs)
   
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
		elseif newValue == 'Locked' then
            disable('main','sub','range')
        end
    end
	
	
end

function job_get_spell_map(spell, default_spell_map)
end
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
	

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

function equip_gear_by_status(status)

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
    if mov.counter> 15 then
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
		textinbox = textinbox .. textColor .. "Utsusemi Mode (CTRL+F9) : " .. tostring(state.Utsusemi.current) .. textColorNewLine
        textinbox = textinbox .. textColor .. "Idle Mode (F10) : " .. tostring(state.IdleMode.current) .. textColorNewLine
		
		
		if state.WeaponLockMode.value == 'Locked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		elseif state.WeaponLockMode.value == 'Unlocked' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Lock Mode (F12) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.WeaponLockMode.current) .. textColorNewLine
		end
       
		if state.SubtleBlow.value == 'On' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Subtle Blow (F7) : " .. "\\cr" .. "\\cs(255, 75, 75)" .. tostring(state.SubtleBlow.current) .. textColorNewLine
		elseif state.SubtleBlow.value == 'Off' then
			textinbox = textinbox .. "\\cs(255, 255, 255)" .. "Subtle Blow (F7) : " .. "\\cr" .. "\\cs(255, 255, 255)" .. tostring(state.SubtleBlow.current) .. textColorNewLine
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
	shih="Shihei"}
