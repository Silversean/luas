-- LuaLagGuard.lua
-- Safe Windower/GearSwap helper for throttling expensive functions.
-- This version DOES NOT use collectgarbage(), because some Windower Lua environments do not expose it.

lagguard = lagguard or {}

lagguard.last_call = lagguard.last_call or {}
lagguard.debug = lagguard.debug or false

-- Return current Lua clock time.
function lagguard.now()
    return os.clock()
end

-- Returns true only if enough time has passed for this key.
function lagguard.allow(key, interval)
    local now = lagguard.now()
    local last = lagguard.last_call[key] or 0

    if now - last >= interval then
        lagguard.last_call[key] = now
        return true
    end

    return false
end

-- Runs a function only if the throttle allows it.
function lagguard.run(key, interval, fn, ...)
    if type(fn) ~= 'function' then
        return nil
    end

    if lagguard.allow(key, interval) then
        return fn(...)
    end

    return nil
end

-- Wraps an existing function so it can only run once per interval.
function lagguard.wrap(key, interval, fn)
    if type(fn) ~= 'function' then
        return fn
    end

    return function(...)
        return lagguard.run(key, interval, fn, ...)
    end
end

-- Optional manual debug message.
function lagguard.message(msg)
    if lagguard.debug and add_to_chat then
        add_to_chat(207, '[LagGuard] ' .. tostring(msg))
    end
end

-- Optional helper to throttle common UI functions after they are defined.
function lagguard.wrap_common_ui(ui_interval)
    ui_interval = ui_interval or 0.25

    if type(refreshWindow) == 'function' then
        refreshWindow = lagguard.wrap('refreshWindow', ui_interval, refreshWindow)
    end

    if type(refreshwindow) == 'function' then
        refreshwindow = lagguard.wrap('refreshwindow', ui_interval, refreshwindow)
    end

    if type(update_text) == 'function' then
        update_text = lagguard.wrap('update_text', ui_interval, update_text)
    end

    if type(ui_render) == 'function' then
        ui_render = lagguard.wrap('ui_render', ui_interval, ui_render)
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
end

lagguard.message('Loaded safe throttle-only version.')
