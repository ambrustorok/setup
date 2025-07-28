" Place this file in ~/.config/nvim/init.vim
" Run this to enable plugins (install vim-plug)
"   `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
" then run this from within nvim
"   `:PlugInstall`
" =========================
" Plugin Manager: vim-plug
" =========================
call plug#begin('~/.vim/plugged')
" Onedark colorscheme
Plug 'joshdick/onedark.vim'
" YAML syntax highlighting
Plug 'stephpy/vim-yaml'
" File tree and icons
Plug 'nvim-tree/nvim-tree.lua'
Plug 'nvim-tree/nvim-web-devicons'

" Language Support
" JavaScript/TypeScript syntax and features
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'

" Python support
Plug 'vim-python/python-syntax'

" JTML syntax highlighting (HTML-like)
Plug 'othree/html5.vim'

" LSP support for better language features
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Treesitter for better syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

call plug#end()

" =========================
" General Settings
" =========================
set number              " Show line numbers
set mouse=              " Disable mouse support
set termguicolors       " Enable true color support
set background=dark     " Use dark background

" =========================
" Colorscheme: Onedark (darker style)
" =========================
hi clear
let g:onedark_config = {'style': 'darker'}
colorscheme onedark

" =========================
" Python syntax settings
" =========================
let g:python_highlight_all = 1

" =========================
" nvim-tree.lua Setup
" =========================
" Recommended: Don't show netrw (default file explorer)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Basic setup for nvim-tree (Lua block)
lua << EOF
-- nvim-tree setup
require("nvim-tree").setup({
  view = {
    width = 30,
    side = "left",
  },
  renderer = {
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
})

-- Treesitter setup
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "python", "html", "css", "json", "yaml" },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  },
}

-- LSP setup
local lspconfig = require('lspconfig')

-- Python LSP (pyright)
lspconfig.pyright.setup{}

-- JavaScript/TypeScript
lspconfig.ts_ls.setup{}

-- HTML LSP (for JTML files)
lspconfig.html.setup{
  filetypes = { "html", "jtml" }
}

-- Completion setup
local cmp = require'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})
EOF

" =========================
" File type associations
" =========================
" Associate .jtml files with HTML syntax
autocmd BufNewFile,BufRead *.jtml set filetype=html

" Keymap: <leader>e toggles the file tree
nnoremap <leader>e :NvimTreeToggle<CR>

" =========================
" Optional: Open nvim-tree on startup
" =========================
" autocmd VimEnter * NvimTreeOpen

" =========================
" End of config
" =========================
