local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

-- A helper function for my fallback fonts
local function font_with_fallback(name, params)
	local names = { name, "Noto Color Emoji", "JetBrains Mono" }
	return wezterm.font_with_fallback(names, params)
end

local fonts = {
    "JetBrainsMono Nerd Font Mono",
    --"VictorMono Nerd Font",
};

local font = fonts[2]

return {
	-- General configuration
	audible_bell = "Disabled",
	window_close_confirmation = "NeverPrompt",
	use_fancy_tab_bar = false,
	enable_tab_bar = false,

	window_padding = {
		left = 2,
		right = 2,
		top = 2,
		bottom = 2,
	},

	-- Font and color scheme
	font = font_with_fallback(font, { weight = "Bold" }),
	font_rules = {
		-- Select a fancy italic font for italic text
		{
			italic = true,
			font = font_with_fallback(font, { weight = "Bold", italic = true }),
		},

		-- Similarly, a fancy bold+italic font
		{
			italic = true,
			intensity = "Bold",
			font = font_with_fallback(font, { weight = "ExtraBold", italic = true }),
		},
	},
	font_size = 20, -- 13
	use_resize_increments = true,
	line_height = 1.0,
	-- color_scheme = "Eqie6 (terminal.sexy)",
    color_scheme = "Catppuccin Macchiato",
    window_background_opacity = 0.9,
	-- Background
	-- window_background_image = wezterm.home_dir .. "/.config/wezterm/2.jpg",
	-- window_background_image_hsb = {
	-- 	brightness = 0.05,
	-- 	hue = 1,
	-- 	saturation = 1,
	-- },

	--default_prog = { "tmux", "new-session", "-A", "-s", "Main" },

	-- leader = { key = "a", mods = "CTRL", timeout_milliseconds = 1000 },
	disable_default_key_bindings = true,
	keys = {
		{ key = "=", mods = "SUPER", action = wezterm.action.IncreaseFontSize },
		{ key = "-", mods = "SUPER", action = wezterm.action.DecreaseFontSize },
		--{ key = "c", mods = "CTRL|SHIFT", action = wezterm.action.Copy },
		--{ key = "v", mods = "CTRL|SHIFT", action = wezterm.action.Paste },
	},
}