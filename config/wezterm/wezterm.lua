local wezterm = require("wezterm")

wezterm.on("update-right-status", function(window)
	window:set_right_status(window:active_workspace())
end)

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

	font = wezterm.font_with_fallback { 
		'JetBrainsMono Nerd Font Mono', 
		'Noto Color Emoji',
		'JetBrains Mono', 
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