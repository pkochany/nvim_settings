call plug#begin('~/nvim/plugged')

" Buffer list display
Plug 'jlanzarotta/bufexplorer'

" Track the engine.
Plug 'https://github.com/SirVer/ultisnips.git'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" getters/setters generator
Plug 'https://github.com/docteurklein/php-getter-setter.vim.git'

" SQL Querry autocomplete 
Plug 'https://github.com/vim-scripts/dbext.vim.git'

" Color schemes
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/sainnhe/vim-color-forest-night.git'
Plug 'https://github.com/semibran/vim-colors-synthetic.git'
Plug 'https://github.com/Heorhiy/VisualStudioDark.vim.git'

" Languages coloring pack
Plug 'https://github.com/sheerun/vim-polyglot'

" Git difference display in opened documents
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Tag list display
Plug 'https://github.com/majutsushi/tagbar.git'

" Bottom bar enchancement
Plug 'https://github.com/vim-airline/vim-airline.git'

" Fuzzy finder
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tags generation from within nvim
Plug 'https://github.com/universal-ctags/ctags.git'

" Project tree display
Plug 'https://github.com/scrooloose/nerdtree.git'

" Commenting marked text
Plug 'https://github.com/tpope/vim-commentary.git'

" Completion manager (TO BE CHANGED)
Plug 'https://github.com/ncm2/ncm2.git'

" Syntax checker
Plug 'https://github.com/vim-syntastic/syntastic.git'

" Twig language support
Plug 'https://github.com/evidens/vim-twig.git'

" Multiple cursors
Plug 'https://github.com/terryma/vim-multiple-cursors.git'

call plug#end()

" Set path to python binaries
let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/bin/python3'

" Project explorer width modifier
let g:NERDTreeWinSize=50

" Syntax checker setup
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" Tab behavior
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" c-j c-k for moving in snippet
let g:UltiSnipsExpandTrigger		= "<c-i>"
let g:UltiSnipsJumpForwardTrigger	= "<c-j>"
let g:UltiSnipsJumpBackwardTrigger	= "<c-k>"
let g:UltiSnipsRemoveSelectModeMappings = 0

" Highlight all search results
:set hlsearch

" Key mappings
map <C-u> :NERDTreeToggle<CR>
map <C-p> :NERDTreeFocus<CR>
map <C-f> :Files<CR>
map <C-d> :bdelete<CR>
map <C-t> :TagbarToggle<CR>
map <C-b> :ToggleBufExplorer<CR>

" Set color scheme
set termguicolors
set background=dark
colorscheme gruvbox-material

" Database profiles for SQL Querry autocomplete dbext.vim
let g:dbext_default_profile_orlowo = 'type=PGSQL:user=XADM:dbname=orlowo:host=localhost'
" Set profile above to the project
augroup project1
    au!
    autocmd BufRead */bn/repozytoria/sms/* DBSetOption profile=orlowo
augroup end


" Working in terminal emulator
if has("nvim")
  " Make escape work in the Neovim terminal.
  tnoremap <Esc> <C-\><C-n>

  " Make navigation into and out of Neovim terminal splits nicer.
  tnoremap <C-h> <C-\><C-N><C-w>h
  tnoremap <C-j> <C-\><C-N><C-w>j
  tnoremap <C-k> <C-\><C-N><C-w>k
  tnoremap <C-l> <C-\><C-N><C-w>l

  " I like relative numbering when in normal mode.
  autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber

  " Prefer Neovim terminal insert mode to normal mode.
  autocmd BufEnter term://* startinsert
endif
