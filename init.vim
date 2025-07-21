" Place this file in ~/.config/nvim/init.vim
" Run this to enable plugins
"   `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
" then run this from within nvim
"   `:PlugInstall`

" ...

" Enable plugin system
call plug#begin('~/.vim/plugged')

" Gruvbox colorscheme for better syntax highlighting
Plug 'morhetz/gruvbox'

" Improved YAML syntax highlighting
Plug 'stephpy/vim-yaml'

call plug#end()

" Enable true color support
set termguicolors

" Set colorscheme
colorscheme gruvbox

" Show line numbers
set number

" Disable mouse support
set mouse=
