dofile(os.getenv("HOME") .. '/.config/conky/' .. "base.lua")

conky.config = merge(base_config, {
	gap_x = gap_x(1),
    template9 = [[${color}${fs_used \1}/${fs_size \1} (${fs_used_perc \1}%)]]
});

conky.text = [[
${color1}RAM: $mem / $memmax (${color gray}$memperc%${color1}) ${color #88cc00}${membar 4}
${color #88cc00}${memgraph 07CC0D FF0000 -t}
${color}Swap Usage:${color1} $swap/$swapmax ${swapbar 4}
${color}$hr
${color}Name                CPU% ${alignc}Name			MEM%
${color3} ${top name 1} ${color2}${top cpu 1} ${alignc}${color3}${top_mem name 1}	 	  ${color2}${top_mem mem 1}
${color3} ${top name 2} ${color2}${top cpu 2} ${alignc}${color3}${top_mem name 2}	 	  ${color2}${top_mem mem 2}
${color3} ${top name 3} ${color2}${top cpu 3} ${alignc}${color3}${top_mem name 3}	 	  ${color2}${top_mem mem 3}
${color}$hr
${color}Name		   IO%   	IO Read		IO Write
${color3}${top_io name 1} ${color2}${top_io io_perc 1} 	${top_io io_read 1}		${top_io io_write 1}
${color3}${top_io name 2} ${color2}${top_io io_perc 2} 	${top_io io_read 2}		${top_io io_write 2}
${color3}${top_io name 3} ${color2}${top_io io_perc 3} 	${top_io io_read 3}		${top_io io_write 3}
${color1}File systems:
${color1}/    ${template9 /}			${color1}${goto 240}${color1}/home ${template9 /home}
${fs_bar 4,220 /} ${goto 240}${fs_bar 4,220 /home}
${color1}Read: ${color} ${diskio_read /dev/nvme0n1p3}			${goto 240}${color1}Read: ${color} ${diskio_read /dev/sda}
${color1}Write: ${color}${diskio_write /dev/nvme0n1p3}			${goto 240}${color1}Write: ${color}${diskio_write /dev/sda}
${diskiograph /dev/nvme0n1p3 60,470 07CC0D FF0000 -t}
${diskiograph /dev/nvme0n1p4 60,230 07CC0D FF0000 -t}			${goto 240}${diskiograph /dev/sda1 60,230 07CC0D FF0000 -t}
${color1}data_ssd ${template9 /mnt/data_ssd}			${color1}${goto 240}${color1}data_hdd ${template9 /mnt/data_hdd}
${color1}Read: ${color} ${diskio_read /dev/nvme0n1p2}			${goto 240}${color1}Read: ${color} ${diskio_read /dev/sda}
${color1}Write: ${color}${diskio_write /dev/nvme0n1p2}			${goto 240}${color1}Write: ${color}${diskio_write /dev/sda}
${stippled_hr}
${color}IO: ${color1}${diskio} ${goto 167}${color}Read: ${color1}${diskio_read} ${goto 320}${color}Write: ${color1}${diskio_write}
${diskiograph 40,150 07CC0D FF0000 -t} ${diskiograph_read 40,150 07CC0D FF0000 -t} ${diskiograph_write 40,150 07CC0D FF0000 -t}
${lua_parse smart_temps}
]];
