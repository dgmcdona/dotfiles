-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices.

-- Fog example, changing the initial geometry for new windows:
config.initial_cols = 120
config.initial_rows = 28

-- or, changing the font size and color scheme.
config.font_size = 12
config.color_scheme = "nightfox"
config.use_fancy_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"

local act = wezterm.action

config.leader = { key = "Space", mods = "CTRL", timeout_milliseconds = 1000 }

config.keys = {
  {
    key = "Space",
    mods = "LEADER",
    action = act.ActivateKeyTable({
      name = "resize_pane",
      one_shot = false,
    }),
  },
  -- Split panes (tmux: prefix + " and prefix + %)
  {
    key = "-",
    mods = "LEADER",
    action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
  },
  {
    key = "|",
    mods = "LEADER|SHIFT",
    action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
  },

  -- Navigate panes (tmux: prefix + arrow keys or hjkl if you set it)
  { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
  { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
  { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
  { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

  -- New tab (tmux: prefix + c)
  { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

  -- Navigate tabs (tmux: prefix + n/p or prefix + number)
  { key = "n", mods = "LEADER", action = act.ActivateTabRelative(1) },
  { key = "p", mods = "LEADER", action = act.ActivateTabRelative(-1) },
  { key = "1", mods = "LEADER", action = act.ActivateTab(0) },
  { key = "2", mods = "LEADER", action = act.ActivateTab(1) },
  { key = "3", mods = "LEADER", action = act.ActivateTab(2) },
  { key = "4", mods = "LEADER", action = act.ActivateTab(3) },
  { key = "5", mods = "LEADER", action = act.ActivateTab(4) },
  { key = "6", mods = "LEADER", action = act.ActivateTab(5) },
  { key = "7", mods = "LEADER", action = act.ActivateTab(6) },
  { key = "8", mods = "LEADER", action = act.ActivateTab(7) },
  { key = "9", mods = "LEADER", action = act.ActivateTab(8) },

  -- Close pane (tmux: prefix + x)
  {
    key = "x",
    mods = "LEADER",
    action = act.CloseCurrentPane({ confirm = true }),
  },

  -- Zoom pane (tmux: prefix + z)
  { key = "z", mods = "LEADER", action = act.TogglePaneZoomState },

  -- Enter copy mode (tmux: prefix + [)
  { key = "[", mods = "LEADER", action = act.ActivateCopyMode },

  -- Detach (not needed locally, but for muscle memory)
  { key = "d", mods = "LEADER", action = act.ShowLauncher },

  {
    key = "r",
    mods = "LEADER",
    action = act.PromptInputLine({
      description = "Enter new name for tab",
      action = wezterm.action_callback(function(window, pane, line)
        -- line will be `nil` if they hit escape without entering anything
        -- An empty string if they just hit enter
        -- Or the actual line of text they wrote
        if line then
          window:active_tab():set_title(line)
        end
      end),
    }),
  },
}

config.key_tables = {
  resize_pane = {
    { key = "h", action = act.AdjustPaneSize({ "Left", 5 }) },
    { key = "j", action = act.AdjustPaneSize({ "Down", 5 }) },
    { key = "k", action = act.AdjustPaneSize({ "Up", 5 }) },
    { key = "l", action = act.AdjustPaneSize({ "Right", 5 }) },

    -- Exit resize mode
    { key = "Escape", action = "PopKeyTable" },
    { key = "Enter", action = "PopKeyTable" },
  },
}

local tabline =
  wezterm.plugin.require("https://github.com/michaelbrusegard/tabline.wez")

tabline.setup()
tabline.apply_to_config(config)

return config
