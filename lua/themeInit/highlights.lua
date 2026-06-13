local M = {}

function M.get_highlights(palette)
  local c = palette.colors
  local util = require("themeInit.util")

  local highlights = {
    -- ==================== BASE ====================
    Normal = { fg = c.textPrimary, bg = c.bg },
    NormalNC = { fg = c.textPrimary, bg = c.bg },
    NormalFloat = { fg = c.textPrimary, bg = c.surface },
    FloatBorder = { fg = c.border, bg = c.surface },
    FloatTitle = { fg = c.textPrimary, bold = true },

    LineNr = { fg = c.textMuted },
    CursorLineNr = { fg = c.kwd, bold = true },
    SignColumn = { bg = c.bg },
    FoldColumn = { fg = c.textMuted },
    Folded = { fg = c.textSecondary, bg = c.surface },

    Cursor = { fg = c.bg, bg = c.textPrimary },
    CursorLine = { bg = c.surface },
    CursorColumn = { bg = c.surface },

    StatusLine = { fg = c.textPrimary, bg = c.surface },
    StatusLineNC = { fg = c.textMuted, bg = c.bg },
    WinBar = { fg = c.textPrimary, bg = c.bg },
    WinBarNC = { fg = c.textMuted, bg = c.bg },

    Pmenu = { fg = c.textPrimary, bg = c.surface },
    PmenuSel = { fg = c.bg, bg = c.kwd },
    PmenuSbar = { bg = c.surface },
    PmenuThumb = { bg = c.border },

    Search = { fg = c.bg, bg = c.kwd },
    IncSearch = { fg = c.bg, bg = c.opr },
    CurSearch = { fg = c.bg, bg = c.opr },

    Visual = { bg = util.blend(c.kwd, c.bg, 0.3) },
    VisualNOS = { bg = util.blend(c.kwd, c.bg, 0.2) },

    MatchParen = { fg = c.opr, bold = true },

    ColorColumn = { bg = c.surface },
    Conceal = { fg = c.textMuted },
    EndOfBuffer = { fg = c.bg },

    Directory = { fg = c.kwd },
    Question = { fg = c.kwd },
    MoreMsg = { fg = c.kwd },
    WarningMsg = { fg = c.num },
    ErrorMsg = { fg = c.fnc },
    ModeMsg = { fg = c.textPrimary },

    VertSplit = { fg = c.border },
    WinSeparator = { fg = c.border },

    TabLine = { fg = c.textMuted, bg = c.surface },
    TabLineFill = { bg = c.bg },
    TabLineSel = { fg = c.bg, bg = c.kwd },

    NonText = { fg = c.textMuted },
    SpecialKey = { fg = c.textMuted },
    Whitespace = { fg = c.textMuted },

    Title = { fg = c.kwd, bold = true },

    -- ==================== SYNTAX (Fallback) ====================
    Comment = { fg = c.textMuted, italic = true },
    Constant = { fg = c.num },
    String = { fg = c.str },
    Character = { fg = c.str },
    Number = { fg = c.num },
    Boolean = { fg = c.num },
    Float = { fg = c.num },

    Identifier = { fg = c.textPrimary },
    Function = { fg = c.fnc },

    Statement = { fg = c.kwd },
    Conditional = { fg = c.kwd },
    Repeat = { fg = c.kwd },
    Label = { fg = c.kwd },
    Operator = { fg = c.opr },
    Keyword = { fg = c.kwd },

    Type = { fg = c.typ },
    Structure = { fg = c.typ },

    Special = { fg = c.opr },
    SpecialChar = { fg = c.opr },

    Delimiter = { fg = c.textSecondary },
    Debug = { fg = c.textSecondary },

    Underlined = { underline = true },
    Bold = { bold = true },
    Italic = { italic = true },

    Error = { fg = c.fnc },
    Todo = { fg = c.num, bold = true },

    -- C++ preprocessor (Vim syntax fallback)
    cInclude = { fg = c.num },
    cDefine = { fg = c.num },
    cPreProc = { fg = c.num },
    cPreCondit = { fg = c.num },
    Include = { fg = c.num },
    PreProc = { fg = c.num },
    Define = { fg = c.num },

    -- ==================== TREESITTER ====================
    ["@comment"] = { fg = c.textMuted, italic = true },
    ["@error"] = { fg = c.fnc },
    ["@preproc"] = { fg = c.kwd },
    ["@define"] = { fg = c.kwd },
    ["@operator"] = { fg = c.opr },

    ["@punctuation.delimiter"] = { fg = c.textSecondary },
    ["@punctuation.bracket"] = { fg = c.textSecondary },
    ["@punctuation.special"] = { fg = c.opr },

    ["@string"] = { fg = c.str },
    ["@string.regex"] = { fg = c.opr },
    ["@string.escape"] = { fg = c.opr },
    ["@string.special"] = { fg = c.opr },

    ["@character"] = { fg = c.str },
    ["@character.special"] = { fg = c.opr },

    ["@boolean"] = { fg = c.num },
    ["@number"] = { fg = c.num },
    ["@float"] = { fg = c.num },

    ["@function"] = { fg = c.fnc },
    ["@function.builtin"] = { fg = c.fnc },
    ["@function.macro"] = { fg = c.kwd },
    ["@method"] = { fg = c.fnc },
    ["@constructor"] = { fg = c.typ },
    ["@parameter"] = { fg = c.str },

    ["@keyword"] = { fg = c.kwd },
    ["@keyword.function"] = { fg = c.kwd },
    ["@keyword.operator"] = { fg = c.kwd },
    ["@keyword.return"] = { fg = c.kwd },
    ["@keyword.storage"] = { fg = c.kwd },
    ["@conditional"] = { fg = c.kwd },
    ["@repeat"] = { fg = c.kwd },
    ["@exception"] = { fg = c.fnc },

    ["@type"] = { fg = c.typ },
    ["@type.builtin"] = { fg = c.typ },
    ["@type.definition"] = { fg = c.typ },
    ["@type.qualifier"] = { fg = c.typ },
    ["@storageclass"] = { fg = c.kwd },
    ["@structure"] = { fg = c.typ },

    ["@variable"] = { fg = c.textPrimary },
    ["@variable.builtin"] = { fg = c.kwd },

    ["@constant"] = { fg = c.num },
    ["@constant.builtin"] = { fg = c.num },
    ["@constant.macro"] = { fg = c.kwd },

    ["@namespace"] = { fg = c.typ },
    ["@symbol"] = { fg = c.opr },

    ["@tag"] = { fg = c.kwd },
    ["@tag.attribute"] = { fg = c.num },
    ["@tag.delimiter"] = { fg = c.textSecondary },

    ["@text"] = { fg = c.textPrimary },
    ["@text.strong"] = { bold = true },
    ["@text.emphasis"] = { italic = true },
    ["@text.underline"] = { underline = true },
    ["@text.strike"] = { strikethrough = true },
    ["@text.title"] = { fg = c.kwd, bold = true },
    ["@text.title.1"] = { fg = c.kwd, bold = true },
    ["@text.title.2"] = { fg = c.kwd, bold = true },
    ["@text.title.3"] = { fg = c.kwd },
    ["@text.title.4"] = { fg = c.kwd },
    ["@text.title.5"] = { fg = c.textPrimary },
    ["@text.title.6"] = { fg = c.textPrimary },

    ["@markup.heading"] = { fg = c.kwd, bold = true },
    ["@markup.heading.1"] = { fg = c.kwd, bold = true },
    ["@markup.heading.2"] = { fg = c.kwd, bold = true },
    ["@markup.heading.3"] = { fg = c.kwd },
    ["@markup.heading.4"] = { fg = c.kwd },
    ["@markup.heading.5"] = { fg = c.textPrimary },
    ["@markup.heading.6"] = { fg = c.textPrimary },
    ["@markup.heading.marker"] = { fg = c.kwd },
    ["@markup.list"] = { fg = c.opr },
    ["@text.literal"] = { fg = c.str },
    ["@text.uri"] = { fg = c.opr, underline = true },
    ["@text.todo"] = { fg = c.num, bold = true },
    ["@text.note"] = { fg = c.kwd },
    ["@text.warning"] = { fg = c.num },
    ["@text.danger"] = { fg = c.fnc },

    ["@diff.plus"] = { fg = c.num },
    ["@diff.minus"] = { fg = c.fnc },
    ["@diff.delta"] = { fg = c.opr },
    ["@diff.context"] = { fg = c.textSecondary },

    -- Missing Treesitter groups
    ["@annotation"] = { fg = c.kwd },
    ["@modifier"] = { fg = c.kwd },
    ["@attribute"] = { fg = c.kwd },
    ["@decorator"] = { fg = c.kwd },
    ["@function.call"] = { fg = c.fnc },
    ["@method.call"] = { fg = c.fnc },
    ["@variable.member"] = { fg = c.num },
    ["@variable.parameter"] = { fg = c.str },
    ["@type.enum"] = { fg = c.typ },
    ["@type.struct"] = { fg = c.typ },
    ["@type.class"] = { fg = c.typ },
    ["@type.interface"] = { fg = c.typ },
    ["@constant.enum"] = { fg = c.num },
    ["@string.documentation"] = { fg = c.str, italic = true },
    ["@module"] = { fg = c.typ },
    ["@field"] = { fg = c.num },
    ["@property"] = { fg = c.num },
    ["@fold"] = { fg = c.textMuted },

    -- Additional Treesitter groups for full coverage
    ["@keyword.import"] = { fg = c.kwd },
    ["@keyword.exception"] = { fg = c.fnc },
    ["@keyword.repeat"] = { fg = c.kwd },
    ["@keyword.conditional"] = { fg = c.kwd },
    ["@keyword.type"] = { fg = c.kwd },

    ["@method.builtin"] = { fg = c.fnc },
    ["@namespace.builtin"] = { fg = c.typ },

    ["@comment.documentation"] = { fg = c.textMuted, italic = true },
    ["@comment.error"] = { fg = c.fnc },
    ["@comment.warning"] = { fg = c.num },
    ["@comment.todo"] = { fg = c.num, bold = true },
    ["@comment.note"] = { fg = c.kwd },

    ["@string.special.symbol"] = { fg = c.opr },
    ["@string.special.url"] = { fg = c.opr, underline = true },
    ["@string.special.path"] = { fg = c.str },

    ["@number.float"] = { fg = c.num },
    ["@number.integer"] = { fg = c.num },

    ["@label"] = { fg = c.kwd },

    -- LSP semantic tokens (additional types not in standard LSP spec)
    ["@lsp.type.generic"] = { fg = c.typ },
    ["@lsp.type.decorator"] = { fg = c.kwd },
    ["@lsp.type.field"] = { fg = c.num },
    ["@lsp.type.bitfield"] = { fg = c.typ },
    ["@lsp.type.event"] = { fg = c.typ },
    ["@lsp.type.package"] = { fg = c.typ },

    -- Rust-specific Treesitter groups
    ["@conditional.rust"] = { fg = c.kwd },
    ["@keyword.rust"] = { fg = c.kwd },
    ["@type.rust"] = { fg = c.typ },
    ["@function.rust"] = { fg = c.fnc },
    ["@variable.rust"] = { fg = c.textPrimary },
    ["@attribute.rust"] = { fg = c.kwd },
    ["@constant.rust"] = { fg = c.num },
    ["@string.rust"] = { fg = c.str },
    ["@number.rust"] = { fg = c.num },
    ["@operator.rust"] = { fg = c.opr },

    -- Zig-specific Treesitter groups
    ["@keyword.zig"] = { fg = c.kwd },
    ["@function.zig"] = { fg = c.fnc },
    ["@type.zig"] = { fg = c.typ },
    ["@constant.zig"] = { fg = c.num },
    ["@string.zig"] = { fg = c.str },
    ["@number.zig"] = { fg = c.num },
    ["@operator.zig"] = { fg = c.opr },
    ["@variable.builtin.zig"] = { fg = c.kwd },
    ["@include.zig"] = { fg = c.kwd },

    -- Additional Zig groups
    ["@keyword.function.zig"] = { fg = c.kwd },
    ["@keyword.storage.zig"] = { fg = c.kwd },
    ["@keyword.repeat.zig"] = { fg = c.kwd },
    ["@keyword.conditional.zig"] = { fg = c.kwd },
    ["@type.builtin.zig"] = { fg = c.typ },
    ["@function.builtin.zig"] = { fg = c.fnc },
    ["@constant.builtin.zig"] = { fg = c.num },
    ["@variable.parameter.zig"] = { fg = c.str },
    ["@operator.arithmetic.zig"] = { fg = c.opr },
    ["@operator.logical.zig"] = { fg = c.opr },

    -- JavaScript/TypeScript-specific groups
    ["@keyword.js"] = { fg = c.kwd },
    ["@function.js"] = { fg = c.fnc },
    ["@method.js"] = { fg = c.fnc },
    ["@type.js"] = { fg = c.typ },
    ["@variable.js"] = { fg = c.textPrimary },
    ["@constant.js"] = { fg = c.num },
    ["@string.js"] = { fg = c.str },
    ["@number.js"] = { fg = c.num },
    ["@operator.js"] = { fg = c.opr },
    ["@property.js"] = { fg = c.num },
    ["@regex.js"] = { fg = c.opr },
    ["@jsx.element"] = { fg = c.kwd },
    ["@jsx.attribute"] = { fg = c.num },

    -- Additional JS/TS groups
    ["@constructor.js"] = { fg = c.typ },
    ["@variable.parameter.js"] = { fg = c.str },
    ["@type.builtin.js"] = { fg = c.typ },
    ["@keyword.function.js"] = { fg = c.kwd },
    ["@operator.logical.js"] = { fg = c.opr },
    ["@operator.arithmetic.js"] = { fg = c.opr },

    -- C++-specific groups
    ["@keyword.cpp"] = { fg = c.kwd },
    ["@function.cpp"] = { fg = c.fnc },
    ["@method.cpp"] = { fg = c.fnc },
    ["@type.cpp"] = { fg = c.typ },
    ["@class.cpp"] = { fg = c.typ },
    ["@struct.cpp"] = { fg = c.typ },
    ["@namespace.cpp"] = { fg = c.typ },
    ["@include.cpp"] = { fg = c.num },
    ["@preproc.cpp"] = { fg = c.num },
    ["@define.cpp"] = { fg = c.num },
    ["@constant.cpp"] = { fg = c.num },
    ["@string.cpp"] = { fg = c.str },
    ["@number.cpp"] = { fg = c.num },
    ["@operator.cpp"] = { fg = c.opr },
    ["@variable.cpp"] = { fg = c.textPrimary },

    -- Additional C++ groups
    ["@keyword.function.cpp"] = { fg = c.kwd },
    ["@keyword.storage.cpp"] = { fg = c.kwd },
    ["@keyword.cast.cpp"] = { fg = c.kwd },
    ["@type.builtin.cpp"] = { fg = c.typ },
    ["@variable.parameter.cpp"] = { fg = c.str },
    ["@function.builtin.cpp"] = { fg = c.fnc },
    ["@constant.builtin.cpp"] = { fg = c.num },
    ["@operator.logical.cpp"] = { fg = c.opr },
    ["@operator.arithmetic.cpp"] = { fg = c.opr },

    -- HTML-specific groups
    ["@tag.html"] = { fg = c.kwd },
    ["@tag.attribute.html"] = { fg = c.num },
    ["@attribute.html"] = { fg = c.num },
    ["@string.html"] = { fg = c.str },
    ["@text.html"] = { fg = c.textPrimary },
    ["@keyword.html"] = { fg = c.kwd },
    ["@comment.html"] = { fg = c.textMuted, italic = true },

    -- Additional HTML groups
    ["@tag.delimiter.html"] = { fg = c.textSecondary },
    ["@attribute.value.html"] = { fg = c.str },
    ["@attribute.name.html"] = { fg = c.num },
    ["@script.html"] = { fg = c.kwd },
    ["@style.html"] = { fg = c.kwd },

    -- Additional common groups
    ["@character.printf"] = { fg = c.str },

    -- ==================== LSP ====================
    LspReferenceText = { bg = util.blend(c.kwd, c.bg, 0.2) },
    LspReferenceRead = { bg = util.blend(c.kwd, c.bg, 0.2) },
    LspReferenceWrite = { bg = util.blend(c.kwd, c.bg, 0.2) },

    DiagnosticError = { fg = c.fnc },
    DiagnosticWarn = { fg = c.num },
    DiagnosticInfo = { fg = c.opr },
    DiagnosticHint = { fg = c.kwd },

    DiagnosticVirtualTextError = { fg = c.fnc },
    DiagnosticVirtualTextWarn = { fg = c.num },
    DiagnosticVirtualTextInfo = { fg = c.opr },
    DiagnosticVirtualTextHint = { fg = c.kwd },

    DiagnosticUnderlineError = { undercurl = true, sp = c.fnc },
    DiagnosticUnderlineWarn = { undercurl = true, sp = c.num },
    DiagnosticUnderlineInfo = { undercurl = true, sp = c.opr },
    DiagnosticUnderlineHint = { undercurl = true, sp = c.kwd },

    DiagnosticSignError = { fg = c.fnc },
    DiagnosticSignWarn = { fg = c.num },
    DiagnosticSignInfo = { fg = c.opr },
    DiagnosticSignHint = { fg = c.kwd },

    DiagnosticFloatingError = { fg = c.fnc },
    DiagnosticFloatingWarn = { fg = c.num },
    DiagnosticFloatingInfo = { fg = c.opr },
    DiagnosticFloatingHint = { fg = c.kwd },

    -- LSP Semantic Tokens
    ["@lsp.type.namespace"] = { fg = c.typ },
    ["@lsp.type.type"] = { fg = c.typ },
    ["@lsp.type.class"] = { fg = c.typ },
    ["@lsp.type.enum"] = { fg = c.typ },
    ["@lsp.type.interface"] = { fg = c.typ },
    ["@lsp.type.struct"] = { fg = c.typ },
    ["@lsp.type.typeParameter"] = { fg = c.typ },
    ["@lsp.type.parameter"] = { fg = c.str },
    ["@lsp.type.variable"] = { fg = c.textPrimary },
    ["@lsp.type.property"] = { fg = c.num },
    ["@lsp.type.enumMember"] = { fg = c.num },
    ["@lsp.type.function"] = { fg = c.fnc },
    ["@lsp.type.method"] = { fg = c.fnc },
    ["@lsp.type.macro"] = { fg = c.kwd },
    ["@lsp.type.keyword"] = { fg = c.kwd },
    ["@lsp.type.comment"] = { fg = c.textMuted, italic = true },
    ["@lsp.type.string"] = { fg = c.str },
    ["@lsp.type.number"] = { fg = c.num },
    ["@lsp.type.boolean"] = { fg = c.num },
    ["@lsp.type.builtin"] = { fg = c.kwd },
    ["@lsp.type.self"] = { fg = c.kwd },
    ["@lsp.type.operator"] = { fg = c.opr },
    ["@lsp.type.regexp"] = { fg = c.opr },
    ["@lsp.type.array"] = { fg = c.typ },
    ["@lsp.type.object"] = { fg = c.typ },
    ["@lsp.type.null"] = { fg = c.kwd },
    ["@lsp.type.unknown"] = { fg = c.textPrimary },

    -- LSP modifiers
    ["@lsp.mod.static"] = { fg = c.kwd },
    ["@lsp.mod.deprecated"] = { fg = c.textMuted, strikethrough = true },
    ["@lsp.mod.async"] = { fg = c.kwd },
    ["@lsp.mod.readonly"] = { fg = c.kwd },
    ["@lsp.mod.abstract"] = { fg = c.kwd },
    ["@lsp.mod.override"] = { fg = c.kwd },
    ["@lsp.mod.definition"] = { fg = c.kwd },
    ["@lsp.mod.declaration"] = { bold = true },
    ["@lsp.mod.modification"] = { fg = c.opr },
    ["@lsp.mod.documentation"] = { fg = c.str, italic = true },
    ["@lsp.mod.defaultLibrary"] = { fg = c.kwd },
    ["@lsp.mod.mutable"] = { italic = true },

    -- ==================== TELESCOPE ====================
    TelescopeNormal = { fg = c.textPrimary, bg = c.bg },
    TelescopeBorder = { fg = c.border, bg = c.bg },
    TelescopePromptNormal = { fg = c.textPrimary, bg = c.surface },
    TelescopePromptBorder = { fg = c.border, bg = c.surface },
    TelescopePromptTitle = { fg = c.bg, bg = c.kwd },
    TelescopePreviewTitle = { fg = c.bg, bg = c.typ },
    TelescopeResultsTitle = { fg = c.bg, bg = c.num },
    TelescopeSelection = { bg = c.surface },
    TelescopeSelectionCaret = { fg = c.kwd },
    TelescopeMultiSelection = { fg = c.kwd },
    TelescopeMatching = { fg = c.opr, bold = true },
    TelescopePromptPrefix = { fg = c.kwd },

    -- ==================== NEO-TREE ====================
    NeoTreeNormal = { fg = c.textPrimary, bg = c.bg },
    NeoTreeNormalNC = { fg = c.textPrimary, bg = c.bg },
    NeoTreeDirectoryName = { fg = c.kwd },
    NeoTreeDirectoryIcon = { fg = c.kwd },
    NeoTreeFileIcon = { fg = c.textSecondary },
    NeoTreeFileName = { fg = c.textPrimary },
    NeoTreeGitAdded = { fg = c.num },
    NeoTreeGitDeleted = { fg = c.fnc },
    NeoTreeGitModified = { fg = c.opr },
    NeoTreeGitUntracked = { fg = c.textMuted },
    NeoTreeIndentMarker = { fg = c.border },
    NeoTreeExpander = { fg = c.textMuted },
    NeoTreeRootName = { fg = c.kwd, bold = true },
    NeoTreeSymbolicLinkTarget = { fg = c.opr },
    NeoTreeTitleBar = { fg = c.bg, bg = c.kwd },
    NeoTreeFloatBorder = { fg = c.border },

    -- ==================== BUFFERLINE ====================
    BufferLineFill = { bg = c.bg },
    BufferLineBackground = { fg = c.textMuted, bg = c.bg },
    BufferLineBufferSelected = { fg = c.textPrimary, bold = true, bg = c.bg },
    BufferLineBufferVisible = { fg = c.textSecondary, bg = c.bg },
    BufferLineCloseButton = { fg = c.textMuted },
    BufferLineCloseButtonSelected = { fg = c.fnc },
    BufferLineSeparator = { fg = c.border, bg = c.bg },
    BufferLineSeparatorSelected = { fg = c.border, bg = c.bg },
    BufferLineSeparatorVisible = { fg = c.border, bg = c.bg },
    BufferLineIndicatorSelected = { fg = c.kwd },
    BufferLinePick = { fg = c.fnc, bold = true },
    BufferLinePickSelected = { fg = c.fnc, bold = true },

    -- ==================== TOGGLETERM ====================
    ToggleTermBorder = { fg = c.border },

    -- ==================== WHICHKEY ====================
    WhichKey = { fg = c.kwd },
    WhichKeyGroup = { fg = c.typ },
    WhichKeyDesc = { fg = c.textPrimary },
    WhichKeySeparator = { fg = c.textMuted },
    WhichKeyNormal = { fg = c.textPrimary, bg = c.bg },
    WhichKeyBorder = { fg = c.border, bg = c.bg },
    WhichKeyTitle = { fg = c.bg, bg = c.kwd },

    -- ==================== INDENT-BLANKLINE ====================
    IndentBlanklineChar = { fg = c.border },
    IndentBlanklineContextChar = { fg = c.kwd },
    IndentBlanklineSpaceChar = { fg = c.border },

    -- ==================== DASHBOARD ====================
    DashboardHeader = { fg = c.kwd },
    DashboardCenter = { fg = c.textPrimary },
    DashboardShortCut = { fg = c.opr },
    DashboardFooter = { fg = c.textMuted },
    DashboardProjectTitle = { fg = c.typ },
    DashboardProjectIcon = { fg = c.typ },
    DashboardMethod = { fg = c.fnc },

    -- ==================== GITSIGNS ====================
    GitSignsAdd = { fg = c.num },
    GitSignsChange = { fg = c.opr },
    GitSignsDelete = { fg = c.fnc },
    GitSignsAddInline = { bg = util.blend(c.num, c.bg, 0.2) },
    GitSignsChangeInline = { bg = util.blend(c.opr, c.bg, 0.2) },
    GitSignsDeleteInline = { bg = util.blend(c.fnc, c.bg, 0.2) },

    -- ==================== NVIM-TREE ====================
    NvimTreeNormal = { fg = c.textPrimary, bg = c.bg },
    NvimTreeRootFolder = { fg = c.kwd, bold = true },
    NvimTreeFolderName = { fg = c.kwd },
    NvimTreeFolderIcon = { fg = c.kwd },
    NvimTreeFileIcon = { fg = c.textSecondary },
    NvimTreeFileName = { fg = c.textPrimary },
    NvimTreeGitDirty = { fg = c.opr },
    NvimTreeGitNew = { fg = c.num },
    NvimTreeGitDeleted = { fg = c.fnc },
    NvimTreeIndentMarker = { fg = c.border },
    NvimTreeOpenedFile = { fg = c.kwd },

    -- ==================== DIFF ====================
    DiffAdd = { fg = c.num, bg = util.blend(c.num, c.bg, 0.15) },
    DiffChange = { fg = c.opr, bg = util.blend(c.opr, c.bg, 0.15) },
    DiffDelete = { fg = c.fnc, bg = util.blend(c.fnc, c.bg, 0.15) },
    DiffText = { bg = util.blend(c.opr, c.bg, 0.25) },

    -- ==================== SPELLING ====================
    SpellBad = { undercurl = true, sp = c.fnc },
    SpellCap = { undercurl = true, sp = c.opr },
    SpellLocal = { undercurl = true, sp = c.num },
    SpellRare = { undercurl = true, sp = c.typ },

    -- ==================== CMP (Completion) ====================
    CmpItemAbbr = { fg = c.textPrimary },
    CmpItemAbbrDeprecated = { fg = c.textMuted, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.kwd, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.kwd },
    CmpItemKind = { fg = c.typ },
    CmpItemMenu = { fg = c.textMuted },
    CmpItemKindFunction = { fg = c.fnc },
    CmpItemKindMethod = { fg = c.fnc },
    CmpItemKindVariable = { fg = c.textPrimary },
    CmpItemKindKeyword = { fg = c.kwd },
    CmpItemKindClass = { fg = c.typ },
    CmpItemKindInterface = { fg = c.typ },
    CmpItemKindModule = { fg = c.typ },
    CmpItemKindProperty = { fg = c.textPrimary },
    CmpItemKindUnit = { fg = c.num },
    CmpItemKindSnippet = { fg = c.opr },
    CmpItemKindFile = { fg = c.textSecondary },
    CmpItemKindFolder = { fg = c.kwd },
    CmpItemKindEnum = { fg = c.typ },
    CmpItemKindConstant = { fg = c.num },
    CmpItemKindStruct = { fg = c.typ },
    CmpItemKindTypeParameter = { fg = c.typ },

    -- ==================== NOICE ====================
    NoiceNormal = { fg = c.textPrimary, bg = c.surface },
    NoiceBorder = { fg = c.border, bg = c.surface },
    NoicePopup = { bg = c.surface },
    NoiceConfirm = { bg = c.surface },
    NoiceCmdline = { fg = c.textPrimary, bg = c.surface },
    NoiceCmdlineIcon = { fg = c.kwd },
    NoiceCmdlinePopup = { bg = c.surface },
    NoiceCmdlinePopupBorder = { fg = c.border },
    NoiceMini = { fg = c.textMuted },

    -- ==================== LAZY ====================
    LazyNormal = { fg = c.textPrimary, bg = c.bg },
    LazyReasonPlugin = { fg = c.typ },
    LazyReasonStart = { fg = c.kwd },
    LazyReasonImport = { fg = c.num },
    LazyReasonRequire = { fg = c.opr },
    LazyReasonRuntime = { fg = c.textSecondary },
    LazyReasonSource = { fg = c.str },
    LazyButton = { fg = c.bg, bg = c.kwd },
    LazyButtonActive = { fg = c.bg, bg = c.typ },
    LazySpecial = { fg = c.opr },
    LazyTaskOutput = { fg = c.textMuted },
    LazyCommit = { fg = c.str },
    LazyCommitRange = { fg = c.textMuted },
    LazyUrl = { fg = c.opr, underline = true },
    LazyProp = { fg = c.textSecondary },
    LazyValue = { fg = c.num },
    LazyH1 = { fg = c.kwd, bold = true },
    LazyH2 = { fg = c.typ, bold = true },

    -- ==================== MASON ====================
    MasonNormal = { fg = c.textPrimary, bg = c.bg },
    MasonHeader = { fg = c.bg, bg = c.kwd },
    MasonHighlight = { fg = c.kwd },
    MasonHighlightBlock = { fg = c.bg, bg = c.kwd },
    MasonHighlightBlockBold = { fg = c.bg, bg = c.kwd, bold = true },
    MasonMuted = { fg = c.textMuted },
    MasonHeading = { fg = c.kwd, bold = true },

    -- ==================== NOTIFY ====================
    NotifyNormal = { fg = c.textPrimary, bg = c.surface },
    NotifyBorder = { fg = c.border },
    NotifyTitle = { fg = c.kwd, bold = true },
    NotifyERRORIcon = { fg = c.fnc },
    NotifyERRORBody = { fg = c.textPrimary },
    NotifyWARNIcon = { fg = c.num },
    NotifyWARNBody = { fg = c.textPrimary },
    NotifyINFOIcon = { fg = c.opr },
    NotifyINFOBody = { fg = c.textPrimary },
    NotifyDEBUGIcon = { fg = c.textMuted },
    NotifyDEBUGBody = { fg = c.textMuted },
    NotifyTRACEIcon = { fg = c.typ },
    NotifyTRACEBody = { fg = c.textSecondary },

    -- ==================== LUALINE ====================
    lualine_a_normal = { fg = c.bg, bg = c.kwd },
    lualine_b_normal = { fg = c.textPrimary, bg = c.surface },
    lualine_c_normal = { fg = c.textSecondary, bg = c.bg },

    lualine_a_insert = { fg = c.bg, bg = c.fnc },
    lualine_b_insert = { fg = c.textPrimary, bg = c.surface },
    lualine_c_insert = { fg = c.textSecondary, bg = c.bg },

    lualine_a_visual = { fg = c.bg, bg = c.num },
    lualine_b_visual = { fg = c.textPrimary, bg = c.surface },
    lualine_c_visual = { fg = c.textSecondary, bg = c.bg },

    lualine_a_replace = { fg = c.bg, bg = c.fnc },
    lualine_b_replace = { fg = c.textPrimary, bg = c.surface },
    lualine_c_replace = { fg = c.textSecondary, bg = c.bg },

    lualine_a_command = { fg = c.bg, bg = c.opr },
    lualine_b_command = { fg = c.textPrimary, bg = c.surface },
    lualine_c_command = { fg = c.textSecondary, bg = c.bg },

    lualine_a_terminal = { fg = c.bg, bg = c.kwd },
    lualine_b_terminal = { fg = c.textPrimary, bg = c.surface },
    lualine_c_terminal = { fg = c.textSecondary, bg = c.bg },

    lualine_a_inactive = { fg = c.textMuted, bg = c.surface },
    lualine_b_inactive = { fg = c.textMuted, bg = c.bg },
    lualine_c_inactive = { fg = c.textMuted, bg = c.bg },

    -- ==================== RENDER-MARKDOWN ====================
    RenderMarkdownH1 = { fg = c.kwd, bold = true },
    RenderMarkdownH2 = { fg = c.kwd, bold = true },
    RenderMarkdownH3 = { fg = c.kwd },
    RenderMarkdownH4 = { fg = c.kwd },
    RenderMarkdownH5 = { fg = c.textPrimary },
    RenderMarkdownH6 = { fg = c.textPrimary },

    RenderMarkdownCode = { fg = c.fnc, bg = "NONE" },
    RenderMarkdownCodeBlock = { fg = c.fnc, bg = "NONE" },
    RenderMarkdownCodeInline = { fg = c.fnc, bg = "NONE" },

    RenderMarkdownBullet = { fg = c.opr },
    RenderMarkdownDash = { fg = c.opr },
    RenderMarkdownTableHead = { fg = c.kwd },
    RenderMarkdownTableRow = { fg = c.textPrimary },

    RenderMarkdownLink = { fg = c.opr, underline = true },
    RenderMarkdownUrl = { fg = c.opr, underline = true },
    RenderMarkdownImage = { fg = c.typ },

    RenderMarkdownQuote = { fg = c.textSecondary, italic = true },
    RenderMarkdownHorizontalRule = { fg = c.border },

    RenderMarkdownTodo = { fg = c.num, bold = true },
    RenderMarkdownCheckbox = { fg = c.kwd },
    RenderMarkdownCheckboxChecked = { fg = c.num },

    -- Heading backgrounds (make transparent)
    RenderMarkdownH1Bg = { bg = "NONE" },
    RenderMarkdownH2Bg = { bg = "NONE" },
    RenderMarkdownH3Bg = { bg = "NONE" },
    RenderMarkdownH4Bg = { bg = "NONE" },
    RenderMarkdownH5Bg = { bg = "NONE" },
    RenderMarkdownH6Bg = { bg = "NONE" },

    -- Code block fallback background (make transparent)
    RenderMarkdownCodeFallback = { bg = "NONE" },
    RenderMarkdownCodeBorder = { fg = c.border },
  }

  return highlights
end

return M
