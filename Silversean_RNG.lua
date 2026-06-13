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
	state.Buff.Barrage = buffactive.Barrage or false
	state.Buff.Camouflage = buffactive.Camouflage or false
	state.Buff['Unlimited Shot'] = buffactive['Unlimited Shot'] or false
	state.Buff['Velocity Shot'] = buffactive['Velocity Shot'] or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	state.RangedMode:options('Normal', 'Acc')
	state.WeaponskillMode:options('Normal', 'Acc')
	
	gear.default.weaponskill_neck = "Fotia Gorget"
	gear.default.weaponskill_waist = "Fotia Belt"
	
	DefaultAmmo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet"}
	U_Shot_Ammo = {['Yoichinoyumi'] = "Achiyalabopa arrow", ['Annihilator'] = "Achiyalabopa bullet"}

	select_default_macro_book()

	send_command('bind f9 gs c cycle RangedMode')
	send_command('bind ^f9 gs c cycle OffenseMode')
end


-- Called when this job file is unloaded (eg: job change)
function user_unload()
	send_command('unbind f9')
	send_command('unbind ^f9')
end


-- Set up all gear sets.
function init_gear_sets()
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA['Bounty Shot'] = {hands="Sylvan Glovelettes +2"}
	sets.precast.JA['Camouflage'] = {body="Orion Jerkin +1"}
	sets.precast.JA['Scavenge'] = {feet="Orion Socks +1"}
	sets.precast.JA['Shadowbind'] = {hands="Orion Bracers +1"}
	sets.precast.JA['Sharpshot'] = {legs="Orion Braccae +1"}
	sets.precast.JA['Velocity Shot'] = {back="Belenus's Cape", body="Amini Caban"}

	-- Fast cast sets for spells

	sets.precast.FC = {
		head="Haruspex Hat",ear2="Loquacious Earring",
		hands="Thaumas Gloves",ring1="Prolix Ring"}

	sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})


	-- Ranged sets (snapshot)
	
	sets.precast.RA = {
    main="Kustawi +1",
    sub={ name="Atoyac", augments={'Occ. atk. twice+8','Rng.Atk.+20',}},
    head="Orion Beret",
    body={ name="Arcadian Jerkin", augments={'Enhances "Snapshot" effect',}},
    hands="Carmine Fin. Ga. +1",
    legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
    feet="Meg. Jam. +1",
    neck="Sanctity Necklace",
    waist="Ponente Sash",
    left_ear="Steelflash Earring",
    right_ear="Telos Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back="Bleating Mantle",
}
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands={ name="Herculean Gloves", augments={'Rng.Acc.+1','Crit. hit damage +4%','Attack+4',}},
    legs="Nahtirah Trousers",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

	sets.precast.WS['Jishnu\'s Radiance'] = {
    main="Kustawi +1",
    sub={ name="Atoyac", augments={'Occ. atk. twice+8','Rng.Atk.+20',}},
    head={ name="Adhemar Bonnet", augments={'DEX+10','AGI+10','Accuracy+15',}},
    body="Abnoba Kaftan",
    hands={ name="Herculean Gloves", augments={'Rng.Acc.+1','Crit. hit damage +4%','Attack+4',}},
    legs="Nahtirah Trousers",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Begrudging Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

	sets.precast.WS['Trueflight'] = {
    main="Kustawi +1",
    sub={ name="Atoyac", augments={'Occ. atk. twice+8','Rng.Atk.+20',}},
    head={ name="Herculean Helm", augments={'"Mag.Atk.Bns."+25','"Fast Cast"+3',}},
    body="Meg. Cuirie +1",
    hands={ name="Leyline Gloves", augments={'Accuracy+14','Mag. Acc.+13','"Mag.Atk.Bns."+13','"Fast Cast"+2',}},
    legs="Nahtirah Trousers",
    feet="Orion Socks",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Hermetic Earring",
    right_ear={ name="Moonshade Earring", augments={'Accuracy+4','TP Bonus +25',}},
    left_ring="Acumen Ring",
    right_ring="Fenrir Ring",
    back="Belenus's Cape",
}

	sets.precast.WS['Sidewinder'] = {
    head={ name="Herculean Helm", augments={'Accuracy+5 Attack+5','Weapon skill damage +4%','STR+9','Attack+13',}},
    body={ name="Herculean Vest", augments={'Attack+15','Weapon skill damage +5%',}},
    hands={ name="Herculean Gloves", augments={'Weapon skill damage +5%','Accuracy+1','Attack+5',}},
    legs={ name="Herculean Trousers", augments={'Accuracy+9 Attack+9','Weapon skill damage +5%','Accuracy+4',}},
    feet={ name="Herculean Boots", augments={'Attack+4','Weapon skill damage +5%','VIT+2','Accuracy+4',}},
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Brutal Earring",
    right_ear="Ishvara Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back="Belenus's Cape",
}


	sets.precast.WS.Acc = set_combine(sets.precast.WS, {body="Kyujutsugi",waist="Fotia Belt",
		back="Vespid Mantle",ring1="Longshot Ring",ring2="Paqichikaji Ring",neck="Fotia Gorget",
		legs="Feast Hose",hands="Buremte Gloves"})

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.


	--------------------------------------
	-- Midcast sets
	--------------------------------------

	-- Fast recast for spells
	
	sets.midcast.FastRecast = {
		head="Orion Beret +1",ear1="Loquacious Earring",
		ring1="Prolix Ring",
		waist="Pya'ekue Belt +1",legs="Orion Braccae +1",feet="Orion Socks +1"}

	sets.midcast.Utsusemi = {}

	-- Ranged sets

	sets.midcast.RA = {
    head={ name="Arcadian Beret", augments={'Enhances "Recycle" effect',}},
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +1",
    legs={ name="Adhemar Kecks", augments={'AGI+10','"Rapid Shot"+10','Enmity-5',}},
    feet="Meg. Jam. +1",
    neck="Sanctity Necklace",
    waist="Ponente Sash",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back="Belenus's Cape",
}
	sets.midcast.RA.Acc = {
    head="Meghanada Visor +1",
    body="Meg. Cuirie +1",
    hands="Meg. Gloves +1",
    legs="Meg. Chausses +1",
    feet="Meg. Jam. +1",
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Paqichikaji Ring",
    right_ring="Longshot Ring",
    back="Belenus's Cape",
}

	sets.midcast.RA.Annihilator = set_combine(sets.midcast.RA)

	sets.midcast.RA.Annihilator.Acc = set_combine(sets.midcast.RA.Acc)

	sets.midcast.RA.Yoichinoyumi = set_combine(sets.midcast.RA, {ear2="Clearview Earring",ring2="Rajas Ring",
		back="Sylvan Chlamys"})

	sets.midcast.RA.Yoichinoyumi.Acc = set_combine(sets.midcast.RA.Acc, {ear2="Clearview Earring"})
	
	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {head="Ocelomeh Headpiece +1",neck="Wiglen Gorget",
		ring1="Sheltered Ring",ring2="Paguroidea Ring"}

	-- Idle sets
	sets.idle = {
		head="Arcadian Beret",neck="Marked Gorget",ear1="Volley Earring",ear2="Vision Earring",
		body="Kyujutsugi",hands="Arcadian Bracers",ring1="Paqichikaji Ring",ring2="Longshot Ring",
		back="Lutian Cape",waist="Patentia Sash",legs="Nahtirah Trousers",feet="Orion Socks"}
	
	-- Defense sets
	sets.defense.PDT = {
		head="Whirlpool Mask",neck="Twilight Torque",
		body="Orion Jerkin +1",hands="Orion Bracers +1",ring1="Defending Ring",ring2=gear.DarkRing.physical,
		back="Mollusca Mantle",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.defense.MDT = {
		head="Orion Beret +1",neck="Twilight Torque",
		body="Orion Jerkin +1",hands="Orion Bracers +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="Mollusca Cape",waist="Flume Belt",legs="Nahtirah Trousers",feet="Orion Socks +1"}

	sets.Kiting = {feet="Fajin Boots"}


	--------------------------------------
	-- Engaged sets
	--------------------------------------

	sets.engaged = {
    head={ name="Dampening Tam", augments={'DEX+9','Accuracy+13','Mag. Acc.+14','Quadruple Attack +2',}},
    body={ name="Adhemar Jacket", augments={'DEX+10','AGI+10','Accuracy+15',}},
    hands={ name="Adhemar Wristbands", augments={'DEX+10','AGI+10','Accuracy+15',}},
    legs={ name="Samnuha Tights", augments={'STR+10','DEX+10','"Dbl.Atk."+3','"Triple Atk."+3',}},
    feet={ name="Herculean Boots", augments={'Accuracy+27','"Triple Atk."+4',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}

	sets.engaged.Acc = {
		head="Whirlpool Mask",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
		body="Manibozho Jerkin",hands="Manibozho Gloves",ring1="K'ayres Ring",ring2="Rajas Ring",
		back="Lutian Mantle",waist="Aquiline Belt",legs="Orion Braccae",feet="Orion Socks"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------

	sets.buff.Barrage = set_combine(sets.midcast.RA.Acc, {hands="Orion Bracers"})
	sets.buff.Camouflage = {body="Orion Jerkin"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' then
		state.CombatWeapon:set(player.equipment.range)
	end

	if spell.action_type == 'Ranged Attack' or
	  (spell.type == 'WeaponSkill' and (spell.skill == 'Marksmanship' or spell.skill == 'Archery')) then
		check_ammo(spell, action, spellMap, eventArgs)
	end
	
	if state.DefenseMode.value ~= 'None' and spell.type == 'WeaponSkill' then
		-- Don't gearswap for weaponskills when Defense is active.
		eventArgs.handled = false
	end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == 'Ranged Attack' and state.Buff.Barrage then
		equip(sets.buff.Barrage)
		eventArgs.handled = true
	end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
	if buff == "Camouflage" then
		if gain then
			equip(sets.buff.Camouflage)
			disable('body')
		else
			enable('body')
		end
	end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)

end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Check for proper ammo when shooting or weaponskilling
function check_ammo(spell, action, spellMap, eventArgs)
	-- Filter ammo checks depending on Unlimited Shot
	if state.Buff['Unlimited Shot'] then
		if player.equipment.ammo ~= U_Shot_Ammo[player.equipment.range] then
			if player.inventory[U_Shot_Ammo[player.equipment.range]] or player.wardrobe[U_Shot_Ammo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active. Using custom ammo.")
				equip({ammo=U_Shot_Ammo[player.equipment.range]})
			elseif player.inventory[DefaultAmmo[player.equipment.range]] or player.wardrobe[DefaultAmmo[player.equipment.range]] then
				add_to_chat(122,"Unlimited Shot active but no custom ammo available. Using default ammo.")
				equip({ammo=DefaultAmmo[player.equipment.range]})
			else
				add_to_chat(122,"Unlimited Shot active but unable to find any custom or default ammo.")
			end
		end
	else
		if player.equipment.ammo == U_Shot_Ammo[player.equipment.range] and player.equipment.ammo ~= DefaultAmmo[player.equipment.range] then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Unlimited Shot not active. Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Removing Unlimited Shot ammo.")
					equip({ammo=empty})
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Removing Unlimited Shot ammo.")
				equip({ammo=empty})
			end
		elseif player.equipment.ammo == 'empty' then
			if DefaultAmmo[player.equipment.range] then
				if player.inventory[DefaultAmmo[player.equipment.range]] then
					add_to_chat(122,"Using Default Ammo")
					equip({ammo=DefaultAmmo[player.equipment.range]})
				else
					add_to_chat(122,"Default ammo unavailable.  Leaving empty.")
				end
			else
				add_to_chat(122,"Unable to determine default ammo for current weapon.  Leaving empty.")
			end
		elseif player.inventory[player.equipment.ammo].count < 15 then
			add_to_chat(122,"Ammo '"..player.inventory[player.equipment.ammo].shortname.."' running low ("..player.inventory[player.equipment.ammo].count..")")
		end
	end
end



-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 7)
end
