function merge(a, b)
    if type(a) == 'table' and type(b) == 'table'
    then
	for k,v in pairs(b)
	do
		if type(v)=='table' and type(a[k] or false)=='table'
		then
			merge(a[k],v)
		else
			a[k]=v
		end
	end
    end
    return a
end

function gap_x(n)
    return 150 + (n - 1) * 500
end

base_config = {
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_hints = 'undecorated,below,sticky,skip_taskbar,skip_pager',
    own_window_class = 'Conky',
    own_window_argb_visual = true,
    own_window_argb_value = 128,
	own_window_colour = 'black',

	alignment = 'top_left',
    gap_y = 300,
    background = true,
    double_buffer = true,

    use_xft = true,
    font = 'DejaVu Sans Mono:size=10',
    xftalpha = 0.8,

    draw_shades = false,
	default_color = '#D1E7D1',
	default_outline_color = 'white',
	default_shade_color = 'white',
	color1 = '#CCAB8D',
	color2 = '#D1E7D1',
    -- light blue
	color3 = '#00BFFF',
	color4 = '#FFFFFF',
	maximum_width = 480,
	minimum_width = 480,
	max_user_text = 16384,
	minimum_height = 480,
	border_width = 0,
    draw_graph_borders = true,
	draw_borders = false,
	uppercase = false,
	draw_outline = false,
	border_outer_margin = 0,
    default_graph_width = 0,
    default_graph_height = 60,

	cpu_avg_samples = 1,
	top_cpu_separate = true,
	out_to_console = false,
    update_interval = 2,
	max_port_monitor_connections = 64,
	no_buffers = true,
	net_avg_samples = 2,
    lua_load = '~/.config/conky/scripts.lua'
};
