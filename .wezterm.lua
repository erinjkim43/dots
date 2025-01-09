-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- config.color_scheme = "Palenight (Gogh)"
config.color_scheme = "PaleNightHC"

config.font = wezterm.font("Liga SFMono Nerd Font")
-- config.font = wezterm.font("MesloLGS Nerd Font Mono")
-- family: MesloLGS NF
-- family: SFMono Nerd Font
-- family: Liga SFMono Nerd Font
-- family: Monaspace Neon
-- family: Geist Mono

config.font_size = 19

config.line_height = 1.25

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.window_background_opacity = 0.9
-- config.macos_window_background_blur = 10

config.window_background_opacity = 1

-- and finally, return the configuration to wezterm
return config
