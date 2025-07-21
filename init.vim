" Place this file in ~/.config/nvim/init.vim
" Run this to enable plugins
"   `curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
" then run this from within nvim
"   `:PlugInstall`

" ...

" Enable plugin system
call plug#begin('~/.vim/plugged')

" Colorscheme for better syntax highlighting
Plug 'joshdick/onedark.vim'

" Improved YAML syntax highlighting
Plug 'stephpy/vim-yaml'

call plug#end()

" Enable true color support
set termguicolors

" Set background to dark
set background=dark

" Clear highlights to prevent old colors from sticking
hi clear

" Use the 'darker' style of onedark
let g:onedark_config = {'style': 'darker'}

" Set colorscheme
colorscheme onedark

" Show line numbers
set number

" Disable mouse support
set mouse=
