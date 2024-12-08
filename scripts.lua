function os_exec(s)
    local handle = io.popen(s)
    local result = handle:read("*a")
    handle:close()

    return result:gsub("^%s*(.-)%s*$", "%1")
end

function conky_cpu_temp()
	return os_exec('sensors coretemp-isa-0000 -j | jq \'.. | .temp1_input? | select(.) | round\'')
end

function conky_smart_temps()
    -- multiple drives are returned, e.g. /org/freedesktop/UDisks2/drives/Samsung_SSD_990_PRO_2TB_XYZ:
    local drive_paths_output = os_exec('udisksctl dump | grep /org/freedesktop/UDisks2/drives | grep -v "Drive:"')

    local drives = {}
    for path in drive_paths_output:gmatch("[^\n]+") do
        local path = path:gsub("^%s*(.-)%s*$", "%1"):gsub(":", "")
        local is_sata = os_exec('dbus-send --system --print-reply --dest=org.freedesktop.UDisks2 ' .. path .. ' org.freedesktop.DBus.Introspectable.Introspect | grep "org.freedesktop.UDisks2.Drive.Ata"')

        local interface = 'org.freedesktop.UDisks2.Drive.Ata'
        if is_sata == "" then
            interface = 'org.freedesktop.UDisks2.NVMe.Controller'
        end

        local temp = os_exec('dbus-send --system --print-reply --dest=org.freedesktop.UDisks2 ' .. path .. ' org.freedesktop.DBus.Properties.Get string:"' .. interface .. '" string:"SmartTemperature" | tail -n 1 | awk \'{print int($NF - 273.15)}\'')
        local model = os_exec('dbus-send --system --print-reply --dest=org.freedesktop.UDisks2 ' .. path .. ' org.freedesktop.DBus.Properties.Get string:"org.freedesktop.UDisks2.Drive" string:"Model" | tail -n 1 | awk -F\'"\' \'{print $2}\'')

        table.insert(drives, '${color1}' .. model .. ' ${goto 210}${color}' .. temp .. '°C')
    end
    
    return table.concat(drives, '\n')
end
