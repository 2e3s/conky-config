
function os_exec(s)
    local handle = io.popen(s)
    local result = handle:read("*a")
    handle:close()

    return result:gsub("^%s*(.-)%s*$", "%1")
end


function conky_cpu_temp()
	return os_exec('sensors coretemp-isa-0000 -j | jq \'.. | .temp1_input? | select(.) | round\'')
end

function conky_nvidia_smi(query)
    return os_exec('nvidia-smi --query-gpu=' .. query .. ' --format=csv,noheader,nounits')
end

function conky_nvidia_smi_usage()
    return conky_nvidia_smi('utilization.gpu')
end

function conky_nvidia_smi_memory()
    return conky_nvidia_smi('memory.used')
end
