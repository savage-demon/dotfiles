local wezterm = require("wezterm")
local config = {}

-- config.font = wezterm.font("JetBrainsMono Nerd Font", { weight = "Regular", stretch = "Normal", style = "Normal" })
-- config.font = wezterm.font("JetBrainsMono Nerd Font")

config.font = wezterm.font_with_fallback({
	"JetBrainsMono Nerd Font",
	"Fira Code",
	"DengXian",
})

config.font_size = 10

local TMEcolor = wezterm.color.get_builtin_schemes()["MaterialDarker"]
TMEcolor.background = "#191C22"
TMEcolor.selection_fg = "black"

config.color_schemes = {
	["TME"] = TMEcolor,
}

-- Pick color scheme based on system appearance, with safe fallbacks
local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		return "TME"
	end

	return "Atelierlakeside (light) (terminal.sexy)"
end

local appearance = "Dark"
if wezterm.gui then
	appearance = wezterm.gui.get_appearance()
end

config.color_scheme = scheme_for_appearance(appearance)

-- config.color_scheme = "MaterialDarker"
-- config.color_scheme = "Astrodark (Gogh)"

-- Acceptable values are SteadyBlock, BlinkingBlock, SteadyUnderline, BlinkingUnderline, SteadyBar, and BlinkingBar
config.default_cursor_style = "SteadyBlock"
config.freetype_load_target = "HorizontalLcd"

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
