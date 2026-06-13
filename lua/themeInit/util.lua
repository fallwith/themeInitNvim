local M = {}

function M.hex_to_rgb(hex)
  hex = hex:gsub("#", "")
  return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
end

function M.blend(hex_fg, hex_bg, alpha)
  local fg_r, fg_g, fg_b = M.hex_to_rgb(hex_fg)
  local bg_r, bg_g, bg_b = M.hex_to_rgb(hex_bg)

  local r = math.floor(fg_r * alpha + bg_r * (1 - alpha))
  local g = math.floor(fg_g * alpha + bg_g * (1 - alpha))
  local b = math.floor(fg_b * alpha + bg_b * (1 - alpha))

  return string.format("#%02x%02x%02x", r, g, b)
end

function M.get_term_colors(colors)
  return {
    colors.bg,               --  0: Black
    colors.fnc,              --  1: Red
    colors.str,              --  2: Green
    colors.num,              --  3: Yellow
    colors.typ,              --  4: Blue
    colors.kwd,              --  5: Magenta
    colors.opr,              --  6: Cyan
    colors.textPrimary,      --  7: White
    colors.surface,          --  8: Bright Black
    colors.fnc,              --  9: Bright Red
    colors.str,              -- 10: Bright Green
    colors.num,              -- 11: Bright Yellow
    colors.typ,              -- 12: Bright Blue
    colors.kwd,              -- 13: Bright Magenta
    colors.opr,              -- 14: Bright Cyan
    colors.textPrimary,      -- 15: Bright White
  }
end

return M
