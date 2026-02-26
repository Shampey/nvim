vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true

vim.o.number = true
vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.wrap = false
vim.o.winborder = "rounded"
-- thank you ai
local tabsize = 2
vim.opt.tabstop = tabsize      -- A hard tabstop is 4 columns wide
vim.opt.shiftwidth = tabsize   -- Indentation commands (>> in Normal mode, autoindent) use 4 spaces
vim.opt.softtabstop = tabsize -- Pressing Tab or Backspace in Insert mode inserts/removes 4 spaces
vim.opt.expandtab = true -- Insert spaces when Tab is pressed (instead of a tab character)
vim.opt.autoindent = true
vim.opt.completeopt = { "menuone", "noselect", "popup" }
-- vim.o.winbar = " "


-- install plugins!
vim.pack.add({
    -- { src = "https://github.com/catppuccin/nvim" },
    -- { src = "https://github.com/vague2k/vague.nvim" },
    -- { src = "https://github.com/EdenEast/nightfox.nvim" },
    -- { src = "https://github.com/AlexvZyl/nordic.nvim" },
    -- { src = "https://github.com/RRethy/base16-nvim" },
    -- { src = "https://github.com/rose-pine/neovim" },
    -- { src = "https://github.com/ellisonleao/gruvbox.nvim"},
    -- { src = "https://github.com/sainnhe/gruvbox-material"},
    -- { src = "https://github.com/morhetz/gruvbox"},
    { src = "https://github.com/folke/tokyonight.nvim"},

    { src = "https://github.com/neovim/nvim-lspconfig" },
    { src = "https://github.com/nvim-lualine/lualine.nvim" },
    { src = "https://github.com/rachartier/tiny-inline-diagnostic.nvim" },
    { src = "https://github.com/rktjmp/lush.nvim" },
    -- { src = "https://github.com/nvim-telescope/telescope.nvim" },
    { src = "https://github.com/nvim-tree/nvim-tree.lua" },
    { src = "https://github.com/nvim-lua/plenary.nvim" },
    { src = "https://github.com/saghen/blink.cmp" },
})

-- Setup all the plugins
--
--
-- diagnostic setup
--
vim.diagnostic.config({ virtual_text = false })
require "tiny-inline-diagnostic".setup({
    preset = "nonerdfont",
    signs = {
        arrow = ""
    }
})

require "nvim-tree".setup()


-- um
require('blink.cmp').setup({
  keymap = { preset = 'default' },
  appearance = {
    nerd_font_variant = 'mono'
  },
  completion = {
    documentation = { auto_show = false }
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer' },
  },
  fuzzy = {
    implementation = "lua"
  }
})

-- setup lualine
require "lualine".setup {
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
    },
    always_show_tabline = true,
    sections = {
        lualine_a = { { 'mode', right_padding = 2, color = { gui = 'bold' }, } },
        lualine_b = { 'branch', 'filename' },
        lualine_c = {
            '%='
        },
        lualine_x = {},
        lualine_y = { 'filetype' },
        lualine_z = {
            { 'location' },
        },
    },
    inactive_sections = {
        lualine_a = { 'filename' },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { { 'location', left_padding = 0 } },
    },
    tabline = {},
    extensions = {},
    padding_top = 2,
}

-- require "Telescope".setup {
--     defaults = {
--         file_ignore_patterns = {
--             "build/",
--             "bin/"
--         },
--     }
-- }


-- enable lsp
vim.lsp.enable({ "lua_ls", "gopls", "clangd", "superhtml", "jdtls" })

-- set keybinds
vim.g.mapleader = ' '
vim.keymap.set('n', '<leader>fo', vim.lsp.buf.format)

-- vim.keymap.set('n', '<leader>p', ':Telescope find_files<cr>')
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<cr>')
vim.keymap.set('n', '<leader>b', ':NvimTreeFindFile<cr>')

vim.keymap.set('n', '<leader>wt', ':terminal scp -P 21098 % wildlezz@server177.web-hosting.com:public_html/<cr><cr>')

vim.keymap.set('n', '<leader>gb', ':!./gradlew build -Dorg.gradle.java.home="/Users/wilde/wpilib/2026/jdk"<cr>')
vim.keymap.set('n', '<leader>gt', ':!./gradlew test -Dorg.gradle.java.home="/Users/wilde/wpilib/2026/jdk"<cr>')
vim.keymap.set('n', '<leader>gd', ':!./gradlew deploy  -PteamNumber=1619 --offline  -Dorg.gradle.java.home="/Users/wilde/wpilib/2026/jdk"<cr>')
vim.keymap.set('n', '<leader>gfd', ':!./gradlew deploy  -PteamNumber=9995 --offline  -Dorg.gradle.java.home="/Users/wilde/wpilib/2026/jdk"<cr>')
-- TODO: add deploy and sim

vim.keymap.set('n', '<leader>sp', ':vertical rightbelow split<cr>')
vim.keymap.set('n', '<leader>sd', ':sp<cr>')
vim.keymap.set('n', '<leader>h', '<C-w>h')
vim.keymap.set('n', '<leader>l', '<C-w>l')
vim.keymap.set('n', '<leader>k', '<C-w>k')
vim.keymap.set('n', '<leader>j', '<C-w>j')
-- vim.keymap.set('n', '<leader>test', ':terminal echo %')


-- colorscheme
--
-- pick your colorscheme
local scheme = "tokyonight-night"

-- require(scheme).setup({
--   disable_background = true,
--   transparent = true,
--   transparent_background = true,
-- })

-- define options per scheme
local theme_opts = {
    catppuccin = {
        transparent_background = true,
    },
    ["rose-pine"] = {
        transparent= true,
    },
    Vague = {
        transparent = true,
    },
    Duskfox = {
        transparent = true,
    },
    gruvbox = {
      transparent = true,
      transparent_background = true,
      disable_background = true,
    }
}

-- safely require and set up
local ok, theme = pcall(require, scheme)
if ok then
    local opts = theme_opts[scheme] or {}
    theme.setup(opts)
end

-- finally load it
vim.cmd("colorscheme " .. scheme)

-- remove the statusline background. doesnt work with duskfox for some reason
vim.cmd(":hi statusline guibg=NONE")
