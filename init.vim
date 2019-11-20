call plug#begin('~/nvim/plugged')

Plug 'jlanzarotta/bufexplorer'

" Track the engine.
Plug 'https://github.com/SirVer/ultisnips.git'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" generator getters/setters
Plug 'https://github.com/docteurklein/php-getter-setter.vim.git'

" dynamiczne uzupełnianie tekstu w zapytaniach sql
Plug 'https://github.com/vim-scripts/dbext.vim.git'

" kolory
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/sainnhe/vim-color-forest-night.git'
Plug 'https://github.com/semibran/vim-colors-synthetic.git'
Plug 'https://github.com/Heorhiy/VisualStudioDark.vim.git'

" poliglota
Plug 'https://github.com/sheerun/vim-polyglot'

Plug 'https://github.com/airblade/vim-gitgutter.git'
Plug 'https://github.com/majutsushi/tagbar.git'
Plug 'https://github.com/vim-airline/vim-airline.git'
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'https://github.com/universal-ctags/ctags.git'
Plug 'https://github.com/scrooloose/nerdtree.git'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'https://github.com/ncm2/ncm2.git'

Plug 'https://github.com/vim-syntastic/syntastic.git'

Plug 'https://github.com/evidens/vim-twig.git'

Plug 'https://github.com/terryma/vim-multiple-cursors.git'

call plug#end()


let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'
let g:NERDTreeWinSize=50

let g:ycm_disable_for_files_larger_than_kb = 1000000

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0


set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<c-i>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

:set hlsearch

map <C-u> :NERDTreeToggle<CR>

map <C-p> :NERDTreeFocus<CR>

map <C-f> :Files<CR>

map <C-d> :bdelete<CR>

map <C-t> :TagbarToggle<CR>

map <C-b> :ToggleBufExplorer<CR>

" ustaw kolor po otworzeniu
set termguicolors
set background=dark
colorscheme gruvbox-material

" profile połączeń baz danych do autouzupełniania wtyczki dbext.vim
let g:dbext_default_profile_clinica = 'type=PGSQL:user=XADM:dbname=clinica:host=192.168.1.175'
" przypisz profil do projektu
augroup project1
    au!
    autocmd BufRead */bn/repozytoria/sms/* DBSetOption profile=clinica
augroup end
