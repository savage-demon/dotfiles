local wezterm = require("wezterm")
local config = {}

config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
config.font_size = 14
config.color_scheme = "MaterialDarker"
config.default_cursor_style = "SteadyUnderline" -- Acceptable values are SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar
config.freetype_load_target = "Light"
config.font_antialias = "Subpixel"
-- config.default_domain = 'WSL:Ubuntu-22.04'

config.keys = {
	{
		key = "F11",
		--   mods = 'SHIFT|CTRL',
		action = wezterm.action.ToggleFullScreen,
	},
}

config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.enable_tab_bar = false
config.colors = {
	-- -- The default text color
	-- foreground = 'silver',
	-- -- The default background color
	-- background = 'black',

	-- Overrides the cell background color when the current cell is occupied by the
	-- cursor and the cursor style is set to Block
	cursor_bg = "#52ad70",
	-- Overrides the text color when the current cell is occupied by the cursor
	cursor_fg = "black",
}

return config
