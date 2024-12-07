dofile(os.getenv("HOME") .. '/.config/conky/' .. "base.lua")

conky.config = merge(base_config, {
	gap_x = 590,
	show_graph_scale = true,
	show_graph_range = true,
});

conky.text = [[
${color}${cpugraph}
${color1}CPU: ${color}${execi 1000 cat /proc/cpuinfo | grep 'model name' | sed -e 's/model name.*: //'| uniq | cut -c -17}		${color1}${goto 340}FanA: ${alignr}${color}${exec "sensors -u nct6798-isa-0290 | grep -o 'fan1_input: [0-9]\{1,4\}' | cut -c 13-"}RPM 
${color1}Temp: ${color}${lua cpu_temp}C 			${color1}${goto 340}FanB: ${alignr}${color}${exec "sensors -u nct6798-isa-0290 | grep -o 'fan7_input: [0-9]\{1,4\}' | cut -c 13-"}RPM 
${color1}1:  ${color}${freq 1}Mhz ${goto 120}${cpubar cpu1 12,110}  	${goto 240}${color1}13: ${color}${freq 13}Mhz ${goto 360}${cpubar cpu13 12,110}
${color1}2:  ${color}${freq 2}Mhz ${goto 120}${cpubar cpu2 12,110}  	${goto 240}${color1}14: ${color}${freq 14}Mhz ${goto 360}${cpubar cpu14 12,110}
${color1}3:  ${color}${freq 3}Mhz ${goto 120}${cpubar cpu3 12,110}  	${goto 240}${color1}15: ${color}${freq 15}Mhz ${goto 360}${cpubar cpu15 12,110}
${color1}4:  ${color}${freq 4}Mhz ${goto 120}${cpubar cpu4 12,110}  	${goto 240}${color1}16: ${color}${freq 16}Mhz ${goto 360}${cpubar cpu16 12,110}
${color1}5:  ${color}${freq 5}Mhz ${goto 120}${cpubar cpu5 12,110}  	${goto 240}${color1}17: ${color}${freq 17}Mhz ${goto 360}${cpubar cpu17 12,110}
${color1}6:  ${color}${freq 6}Mhz ${goto 120}${cpubar cpu6 12,110}  	${goto 240}${color1}18: ${color}${freq 18}Mhz ${goto 360}${cpubar cpu18 12,110}
${color1}7:  ${color}${freq 7}Mhz ${goto 120}${cpubar cpu7 12,110}  	${goto 240}${color1}19: ${color}${freq 19}Mhz ${goto 360}${cpubar cpu19 12,110}
${color1}8:  ${color}${freq 8}Mhz ${goto 120}${cpubar cpu8 12,110}  	${goto 240}${color1}20: ${color}${freq 20}Mhz ${goto 360}${cpubar cpu20 12,110}
${color1}9:  ${color}${freq 9}Mhz ${goto 120}${cpubar cpu9 12,110}  	${goto 240}${color1}21: ${color}${freq 21}Mhz ${goto 360}${cpubar cpu21 12,110}
${color1}10: ${color}${freq 10}Mhz ${goto 120}${cpubar cpu10 12,110}  	${goto 240}${color1}22: ${color}${freq 22}Mhz ${goto 360}${cpubar cpu22 12,110}
${color1}11: ${color}${freq 11}Mhz ${goto 120}${cpubar cpu11 12,110}  	${goto 240}${color1}23: ${color}${freq 23}Mhz ${goto 360}${cpubar cpu23 12,110}
${color1}12: ${color}${freq 12}Mhz ${goto 120}${cpubar cpu12 12,110}  	${goto 240}${color1}24: ${color}${freq 24}Mhz ${goto 360}${cpubar cpu24 12,110}
$hr
${color1}GPU: ${color}${lua nvidia_smi name}		${color1}${goto 360}Fan: ${alignr}${color}${lua nvidia_smi fan.speed}RPM
${color1}Temp: ${color}${lua nvidia_smi temperature.gpu}C 				${color1}${goto 340}Power: ${alignr}${color}${lua nvidia_smi power.draw.instant}W 
${color1}GPU Usage: ${color}${lua nvidia_smi utilization.gpu}%		${alignr}${color1}VRAM Usage: ${color}${lua nvidia_smi memory.used}/${lua nvidia_smi memory.total}MB
${color}${lua_graph nvidia_smi_usage 60,235 07CC0D FF0000} ${alignr}${color}${lua_graph nvidia_smi_memory 60,235 07CC0D FF0000 24000}
]];
