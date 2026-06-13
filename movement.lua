-- movement.lua
-- Shared movement-speed include for GearSwap.
-- Put this file in: Windower/addons/GearSwap/data/movement.lua
--
-- Include in your job Lua:
-- include('movement.lua')
--
-- Required in your job Lua:
-- sets.MoveSpeed = { legs="Carmine Cuisses +1" }

moveguard = moveguard or {}

moveguard.enabled = true
moveguard.moving = false
moveguard.last_x = nil
moveguard.last_y = nil
moveguard.last_z = nil
moveguard.move_ticks = 0
moveguard.stop_ticks = 0
moveguard.debug = false

-- Lower number = swaps sooner after movement begins.
moveguard.start_threshold = moveguard.start_threshold or 2

-- Higher number = less flicker when stopping briefly.
moveguard.stop_threshold = moveguard.stop_threshold or 5

local function moveguard_chat(msg)
    if moveguard.debug then
        add_to_chat(207, '[MoveGuard] ' .. tostring(msg))
    end
end

local function moveguard_midaction()
    if type(midaction) == 'function' then
        return midaction()
    end
    return false
end

local function moveguard_set_state(value)
    if state and state.Moving then
        if type(state.Moving.set) == 'function' then
            state.Moving:set(value and 'true' or 'false')
        else
            state.Moving.value = value and 'true' or 'false'
            state.Moving.current = value and 'true' or 'false'
        end
    end
end

function moveguard.has_movespeed_set()
    return sets and sets.MoveSpeed ~= nil
end

function moveguard.force_movespeed()
    if not moveguard.has_movespeed_set() then
        moveguard_chat('No sets.MoveSpeed found.')
        return
    end

    if moveguard_midaction() then
        moveguard_chat('Skipped movement equip during midaction.')
        return
    end

    -- Use both paths:
    -- 1) direct equip, for immediate response
    -- 2) GearSwap command, because some files overwrite direct equip from custom logic
    equip(sets.MoveSpeed)
    send_command('gs equip sets.MoveSpeed')

    moveguard_chat('Equipped sets.MoveSpeed')
end

function moveguard.restore_normal()
    if moveguard_midaction() then
        moveguard_chat('Skipped restore during midaction.')
        return
    end

    -- Return to the job file's normal idle/engaged selection.
    send_command('gs c update')

    moveguard_chat('Restored normal gear')
end

function moveguard.check()
    if not moveguard.enabled then return end
    if not player then return end
    if not windower or not windower.ffxi or not windower.ffxi.get_mob_by_target then return end

    local me = windower.ffxi.get_mob_by_target('me')
    if not me then return end

    local moved = false

    if moveguard.last_x ~= nil then
        moved = (
            me.x ~= moveguard.last_x or
            me.y ~= moveguard.last_y or
            me.z ~= moveguard.last_z
        )
    end

    if moved then
        moveguard.move_ticks = moveguard.move_ticks + 1
        moveguard.stop_ticks = 0

        if not moveguard.moving and moveguard.move_ticks >= moveguard.start_threshold then
            moveguard.moving = true
            moveguard_set_state(true)
            moveguard.force_movespeed()
        end
    else
        moveguard.stop_ticks = moveguard.stop_ticks + 1
        moveguard.move_ticks = 0

        if moveguard.moving and moveguard.stop_ticks >= moveguard.stop_threshold then
            moveguard.moving = false
            moveguard_set_state(false)
            moveguard.restore_normal()
        end
    end

    moveguard.last_x = me.x
    moveguard.last_y = me.y
    moveguard.last_z = me.z
end

windower.raw_register_event('prerender', function()
    moveguard.check()
end)
