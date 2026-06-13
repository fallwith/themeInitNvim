# themeInit.nvim

A robust, modular Neovim theme featuring a sophisticated purple-magenta aesthetic. This is a port of [themeInt](https://initsyscall.codeberg.page/themeInit). It is designed for developers who crave a high-contrast, cohesive aesthetic without the visual fatigue common in standard dark themes. 


## Preview

### nightSyscall

<img src="https://codeberg.org/initsyscall/themeInitNvim/raw/branch/main/examples/nightSyscall.png" alt="nightSyscall"/>

### daySyscall

<img src="https://codeberg.org/initsyscall/themeInitNvim/raw/branch/main/examples/daySyscall.png" alt="daySyscall"/> 

## Palette

A refined color relationship that maintains consistency across light and dark variants:

| Role | Color | Usage |
|------|-------|-------|
| Background | `#161423` / `#fcf0e0` | Main canvas |
| Surface | `#201D33` / `#f5e8d8` | Floating windows, panels |
| Text | `#E0DEF4` / `#201820` | Primary text |
| Keywords | `#A277FF` | `fn`, `if`, `return` |
| Functions | `#FF3366` | Function calls and definitions |
| Types | `#CBA6F7` | `struct`, `class`, types |
| Strings | `#F087BD` | String literals |
| Numbers | `#F6C177` | Numeric literals |
| Operators | `#80FFEA` | `+`, `-`, `=`, `=>` |

Two carefully crafted themes: `nightSyscall` (dark) and `daySyscall` (light).

## Install

**Lazy.nvim**
```lua
{
  "initsyscall/themeInitNvim",
  url = "https://codeberg.org/initsyscall/themeInitNvim",
  priority = 1000,
  config = function()
    require("themeInit").setup({ theme = "nightSyscall" })
  end
}
```

**Packer**
```lua
use {
  "initsyscall/themeInitNvim",
  url = "https://codeberg.org/initsyscall/themeInitNvim",
  config = function()
    require("themeInit").setup()
  end
}
```

## Usage

```lua
-- Via setup()
require("themeInit").setup({ theme = "nightSyscall" })            -- dark
require("themeInit").setup({ theme = "daySyscall" })              -- light
require("themeInit").setup({ theme = "nightSyscall", transparent = true })  -- transparent

-- Via :colorscheme command
:colorscheme nightSyscall
:colorscheme daySyscall
```

## Architecture

```
lua/themeInit/
├── init.lua       # Main module - loads & applies highlights
├── palette.lua    # Single source of truth - all colors defined once
├── highlights.lua # All highlight groups (base, treesitter, LSP, plugins)
└── util.lua       # Minimal color utilities
```

## Design Philosophy

Built with `palette.lua` as the single source of truth - converted from JSON. The architecture separates concerns: palette holds colors, highlights defines groups, util provides helpers.

Key design choices:
- **No runtime color calculations** - all colors pre-defined in palette
- **Efficient highlight application** - uses `nvim_set_hl()` (Neovim 0.7+)
- **Full plugin ecosystem** - Treesitter, LSP, Telescope, Neo-tree, Bufferline, WhichKey, render-markdown.nvim, GitSigns, nvim-cmp, and more
- **Explicit theme selection** - user chooses `nightSyscall` or `daySyscall`
- **Transparent mode** - add `transparent = true` to make backgrounds transparent (Normal, statusline, tabs, cursorline, and plugin canvases)
- **Transparent markdown** - render-markdown.nvim headings and code blocks have no background

## Features

- **Semantic Highlighting** - Deeply integrated with Treesitter for surgical syntax precision
- **LSP Support** - Explicit styles for Diagnostics and semantic tokens
- **Colorscheme Command** - Use `:colorscheme nightSyscall` or `:colorscheme daySyscall`
- **Extensive Language Support** - Zig, Rust, C/C++, Go, JavaScript, TypeScript, HTML, CSS, Lua, Python, Bash, JSON, YAML, TOML

## Examples

Check `example/` for minimal code showcasing the palette:
- `main.zig` - Zig with structs and fibonacci
- `main.rs` - Rust with pattern matching and collections
- `app.js` - JavaScript with classes and arrow functions
- `index.html` - HTML with embedded CSS/JS
- `main.cpp` - C++ with STL containers and lambdas

## License

Apache 2.0 - See [LICENSE](LICENSE) for details.

---

<p align="center">
  Built by <a href="https://codeberg.org/initsyscall">initsyscall</a> |
  <a href="https://codeberg.org/initsyscall/themeInitNvim">Repository</a>
</p>
