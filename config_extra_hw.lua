dofile(os.getenv("HOME") .. '/.conky/' .. "base.lua")

conky.config = merge(base_config, {
	gap_x = gap_x(3),
    template9 = [[${execi \1 nvidia-smi --query-gpu=\2 --format=csv,noheader,nounits}]],
	template8 = [[${execigraph \1 "nvidia-smi --query-gpu=\2 --format=csv,noheader,nounits" 60,235 07CC0D FF0000}]],
	template7 = [[${execigraph \1 "echo "scale=2; $(nvidia-smi --query-gpu=\2 --format=csv,noheader,nounits) / \3 * 100" | bc" 60,235 07CC0D FF0000 -t}]],
	template6 = [[${execigraph \1 "nvidia-smi --query-gpu=\2,power.limit --format=csv,noheader,nounits | awk -F, '{ if ($2 > 0) print $1 * 100 / ($2 * 1.2) }'" 60,235 07CC0D FF0000 -t}]],
});

conky.text = [[
${color}Networking: ${gw_iface} at ${gw_ip}
${if_existing /sys/class/net/wlp0s20f3/operstate up}WiFi
Down: ${color1}${downspeed wlp0s20f3}/s ${alignr}${color}Up: ${color1}${upspeed wlp0s20f3}/s
${downspeedgraph wlp0s20f3 25,100 dddddd ffffff} ${alignr}${color1}${upspeedgraph wlp0s20f3 25,100 dddddd ffffff}
Total: ${color1}${totaldown wlp0s20f3} ${alignr}${color}Total: ${color1}${totalup wlp0s20f3}${endif}
${hr}${apcupsd 127.0.0.1 3551}
${color1}UPS: ${color}${apcupsd_model}: ${blink $apcupsd_status} ${alignc}${color}(${apcupsd_upsmode}) ${alignr}${color A9A9A9}${apcupsd_cable}
${color}Charge: ${color1}${apcupsd_charge}% ${alignr}${color}Left: ${color1}${apcupsd_timeleft}min
Last turned off: ${apcupsd_lastxfer}
Load: ${apcupsd_load}% ${apcupsd_loadbar}
${apcupsd_loadgraph 30,480 555555 00ff00 -t}
$hr
${color1}GPU: ${color}${template9 1000 name}		${color1}${goto 360}Fan: ${alignr}${color}${template9 2 fan.speed}%
${color1}GPU Usage: ${color}${template9 2 utilization.gpu}%		${alignr}${color1}VRAM Usage: ${color}${template9 4 memory.used}/${template9 4 memory.total}MB
${color}${template8 2 utilization.gpu} ${alignr}${color}${template7 2 memory.used 25000}
${color1}Temp: ${color}${template9 2 temperature.gpu}°C 				${color1}${goto 340}Power: ${alignr}${color}${template9 2 power.draw.instant}W
${color}${template8 2 temperature.gpu} ${alignr}${color}${template6 2 power.draw.instant}
]];
