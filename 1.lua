dofile(os.getenv("HOME") .. '/.config/conky/' .. "base.lua")

conky.config = merge(base_config, {
	gap_x = 0,
});

conky.text = [[
${color1}Hostname: ${color}$nodename     				${color1}Kernel: ${color}${alignr}$kernel 
${color1}Uptime: ${color} $uptime ${color1}    	${alignr}Load: ${color} $loadavg 
$hr
${color1}RAM: $mem / $memmax (${color gray}$memperc%${color1}) ${color #88cc00}${membar 4}
${color #88cc00}${memgraph 75,470 07CC0D FF0000 -t}
${color}Swap Usage:${color1} $swap/$swapmax ${swapbar 4}
${color}$hr
${color1}File systems:
${color1}/    ${color}${fs_used /}/${fs_size /}${color1}			${goto 240}${color1}/home ${color}${fs_used /home}/${fs_size /home}${color1}
${color1}Read: ${color} ${diskio_read /dev/nvme0n1p3}			${goto 240}${color1}Read: ${color} ${diskio_read /dev/sda}
${color1}Write: ${color}${diskio_write /dev/nvme0n1p3}			${goto 240}${color1}Write: ${color}${diskio_write /dev/sda}
${diskiograph /dev/nvme0n1p3 60,470 07CC0D FF0000 -t}
${diskiograph /dev/nvme0n1p4 60,230 07CC0D FF0000 -t}			${goto 240}${diskiograph /dev/sda1 60,230 07CC0D FF0000 -t}
${color1}data_ssd ${color}${fs_used /mnt/data_ssd}/${fs_size /mnt/data_ssd}${color1}			${goto 240}${color1}data_hdd ${color}${fs_used /mnt/data_hdd}/${fs_size /mnt/data_hdd}${color1}
${color1}Read: ${color} ${diskio_read /dev/nvme0n1p2}			${goto 240}${color1}Read: ${color} ${diskio_read /dev/sda}
${color1}Write: ${color}${diskio_write /dev/nvme0n1p2}			${goto 240}${color1}Write: ${color}${diskio_write /dev/sda}
]];
