-- SharedJobTable.lua
-- Shared throttled Windower text table for GearSwap job files.

shared_job_table = shared_job_table or {}

shared_job_table.name = shared_job_table.name or 'shared_job_table'
shared_job_table.refresh_interval = shared_job_table.refresh_interval or 0.25
shared_job_table.last_refresh = shared_job_table.last_refresh or 0
shared_job_table.ready = false

local function safe_call(fn)
    if type(fn) == 'function' then
        local ok, result = pcall(fn)
        if ok then return result end
    end
    return ''
end

local function line(label, value)
    return '\\cs(255,255,255)' .. tostring(label) .. ': \\cr' ..
           '\\cs(255,161,61)' .. tostring(value or '') .. '\\cr'
end

function shared_job_table.setup()
    if shared_job_table.ready then return end

    local name = shared_job_table.name

    windower.text.create(name)
    windower.text.set_font(name, 'Trebuchet MS')
    windower.text.set_font_size(name, 10)
    windower.text.set_location(name, 1950, 1200)
    windower.text.set_bg_visibility(name, true)
    windower.text.set_bg_color(name, 170, 30, 30, 40)
    windower.text.set_color(name, 255, 255, 255, 255)
    windower.text.set_visibility(name, true)

    shared_job_table.ready = true
end

function shared_job_table.render(force)
    if not job_table_config then return end

    local now = os.clock()
    if not force and now - shared_job_table.last_refresh < shared_job_table.refresh_interval then
        return
    end
    shared_job_table.last_refresh = now

    shared_job_table.setup()

    local text = {}

    table.insert(text, '\\cs(255,161,61)' .. tostring(job_table_config.title or 'GearSwap') .. '\\cr')
    table.insert(text, '--------------------------')

    if type(job_table_config.rows) == 'table' then
        for _, row in ipairs(job_table_config.rows) do
            local label = row[1] or ''
            local getter = row[2]
            local value = ''

            if type(getter) == 'function' then
                value = safe_call(getter)
            else
                value = getter
            end

            table.insert(text, line(label, value))
        end
    end

    windower.text.set_text(shared_job_table.name, table.concat(text, '\n'))
end

windower.register_event('prerender', function()
    if job_table_config then
        shared_job_table.render(false)
    end
end)

windower.register_event('logout', function()
    if shared_job_table and shared_job_table.name then
        pcall(function()
            windower.text.delete(shared_job_table.name)
        end)
    end
end)