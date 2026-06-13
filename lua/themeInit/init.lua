local M = {}

local palette = require("themeInit.palette")
local highlights = require("themeInit.highlights")
local util = require("themeInit.util")

M.setup = function(opts)
  opts = opts or {}

  local theme_name = opts.theme or "nightSyscall"
  local term_colors = opts.term_colors ~= false

  local theme = palette.themes[theme_name]
  if not theme then
    vim.notify("themeInit: Theme '" .. theme_name .. "' not found. Using 'nightSyscall'.", vim.log.levels.WARN)
    theme_name = "nightSyscall"
    theme = palette.themes[theme_name]
  end

  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = theme_name
  vim.o.termguicolors = true

  if theme.type == "dark" then
    vim.o.background = "dark"
  else
    vim.o.background = "light"
  end

  local ok, hl_groups = pcall(highlights.get_highlights, theme)
  if not ok then
    vim.notify("themeInit: Failed to generate highlights: " .. tostring(hl_groups), vim.log.levels.ERROR)
    return
  end

  for group, props in pairs(hl_groups) do
    vim.api.nvim_set_hl(0, group, props)
  end

  if opts.transparent then
    for _, group in ipairs({
      "Normal", "NormalNC", "NormalFloat",
      "SignColumn", "FoldColumn",
      "StatusLine", "StatusLineNC",
      "WinBar", "WinBarNC",
      "TabLineFill", "TabLine",
      "CursorLine", "CursorColumn", "ColorColumn",
      "BufferLineFill",
      "WhichKeyNormal",
      "TelescopeNormal",
      "NeoTreeNormal", "NeoTreeNormalNC",
      "NvimTreeNormal",
      "LazyNormal",
      "MasonNormal",
      "NotifyNormal",
      "NoiceNormal",
    }) do
      vim.api.nvim_set_hl(0, group, { bg = "NONE" })
    end
  end

  if term_colors then
    local term_colors_list = util.get_term_colors(theme.colors)
    for i, color in ipairs(term_colors_list) do
      vim.g["terminal_color_" .. (i - 1)] = color
    end
  end

  M.current_theme = theme_name
  M.current_palette = theme
  M.transparent = opts.transparent
end

function M.get_lualine_theme()
  local theme = M.current_palette or palette.themes.nightSyscall
  local c = theme.colors
  local transparent = M.transparent or false

  if not transparent then
    return {
      normal = {
        a = { fg = c.bg, bg = c.kwd, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      insert = {
        a = { fg = c.bg, bg = c.fnc, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      visual = {
        a = { fg = c.bg, bg = c.num, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      replace = {
        a = { fg = c.bg, bg = c.fnc, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      command = {
        a = { fg = c.bg, bg = c.opr, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      terminal = {
        a = { fg = c.bg, bg = c.kwd, gui = "bold" },
        b = { fg = c.textPrimary, bg = c.surface },
        c = { fg = c.textSecondary, bg = c.bg },
      },
      inactive = {
        a = { fg = c.textMuted, bg = c.surface },
        b = { fg = c.textMuted, bg = c.bg },
        c = { fg = c.textMuted, bg = c.bg },
      },
    }
  end

  -- Transparent mode: section A keeps accent color, B/C go transparent
  return {
    normal = {
      a = { fg = c.bg, bg = c.kwd, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    insert = {
      a = { fg = c.bg, bg = c.fnc, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    visual = {
      a = { fg = c.bg, bg = c.num, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    replace = {
      a = { fg = c.bg, bg = c.fnc, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    command = {
      a = { fg = c.bg, bg = c.opr, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    terminal = {
      a = { fg = c.bg, bg = c.kwd, gui = "bold" },
      b = { fg = c.textPrimary, bg = "NONE" },
      c = { fg = c.textSecondary, bg = "NONE" },
    },
    inactive = {
      a = { fg = c.textMuted, bg = "NONE" },
      b = { fg = c.textMuted, bg = "NONE" },
      c = { fg = c.textMuted, bg = "NONE" },
    },
  }
end

return M
