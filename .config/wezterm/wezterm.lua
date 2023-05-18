local wez = require("wezterm")
local act = wez.action

return {
  color_scheme = "Catppuccin Mocha",
  font = wez.font("MesloLGM Nerd Font"),
  font_size = 13,
  -- key
  disable_default_key_bindings = true,
  leader = { key = "f", mods = "CTRL", timeout_milliseconds = 1000 },
  keys = {
    { key = "h", mods = "LEADER", action = act.ActivatePaneDirection("Left") },
    { key = "j", mods = "LEADER", action = act.ActivatePaneDirection("Down") },
    { key = "k", mods = "LEADER", action = act.ActivatePaneDirection("Up") },
    { key = "l", mods = "LEADER", action = act.ActivatePaneDirection("Right") },

    { key = "\\", mods = "LEADER", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
    { key = "-", mods = "LEADER", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
    { key = "s", mods = "LEADER", action = act.PaneSelect({ alphabet = "1234567890", mode = "Activate" }) },
    { key = "S", mods = "LEADER", action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActive" }) },
    { key = "x", mods = "LEADER", action = act.CloseCurrentPane({ confirm = false }) },

    { key = "c", mods = "LEADER", action = act.SpawnTab("CurrentPaneDomain") },

    { key = "v", mods = "LEADER", action = act.ActivateCopyMode },
    { key = "p", mods = "LEADER", action = act.ActivateKeyTable({ name = "pane_edit_mode", one_shot = false }) },

    { key = "w", mods = "LEADER", action = act.ShowTabNavigator },
  },
  key_tables = {
    pane_edit_mode = {
      { key = "h", action = act.ActivatePaneDirection("Left") },
      { key = "j", action = act.ActivatePaneDirection("Down") },
      { key = "k", action = act.ActivatePaneDirection("Up") },
      { key = "l", action = act.ActivatePaneDirection("Right") },

      { key = "H", action = act.AdjustPaneSize({ "Left", 5 }) },
      { key = "J", action = act.AdjustPaneSize({ "Down", 5 }) },
      { key = "K", action = act.AdjustPaneSize({ "Up", 5 }) },
      { key = "L", action = act.AdjustPaneSize({ "Right", 5 }) },

      { key = "\\", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
      { key = "-", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
      { key = "s", action = act.PaneSelect({ alphabet = "1234567890", mode = "Activate" }) },
      { key = "S", action = act.PaneSelect({ alphabet = "1234567890", mode = "SwapWithActive" }) },
      { key = "x", action = act.CloseCurrentPane({ confirm = false }) },

      { key = "q", action = act.PopKeyTable },
    },

    -- search_mode = {
    --   { key = "Enter", mods = "NONE", action = act.CopyMode("PriorMatch") },
    --   { key = "Escape", mods = "NONE", action = act.CopyMode("Close") },
    --   { key = "n", mods = "CTRL", action = act.CopyMode("NextMatch") },
    --   { key = "p", mods = "CTRL", action = act.CopyMode("PriorMatch") },
    --   { key = "r", mods = "CTRL", action = act.CopyMode("CycleMatchType") },
    --   { key = "u", mods = "CTRL", action = act.CopyMode("ClearPattern") },
    --   {
    --     key = "PageUp",
    --     mods = "NONE",
    --     action = act.CopyMode("PriorMatchPage"),
    --   },
    --   {
    --     key = "PageDown",
    --     mods = "NONE",
    --     action = act.CopyMode("NextMatchPage"),
    --   },
    --   { key = "UpArrow", mods = "NONE", action = act.CopyMode("PriorMatch") },
    --   {
    --     key = "DownArrow",
    --     mods = "NONE",
    --     action = act.CopyMode("NextMatch"),
    --   },
    -- },
  },
}
