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
" nvim-tree.lua Setup
" =========================

" Recommended: Don't show netrw (default file explorer)
let g:loaded_netrw = 1
let g:loaded_netrwPlugin = 1

" Basic setup for nvim-tree (Lua block)
lua << EOF
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
EOF

" Keymap: <leader>e toggles the file tree
nnoremap <leader>e :NvimTreeToggle<CR>

" =========================
" Optional: Open nvim-tree on startup
" =========================
" autocmd VimEnter * NvimTreeOpen

" =========================
" End of config
" =========================
