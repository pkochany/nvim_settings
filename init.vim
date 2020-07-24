" ========== THIS PART IS FOR VIM-PLUG PLUGIN MANAGER ==========
call plug#begin('~/nvim/plugged')

" Buffer list display
" When pressing Ctrl + b you toggle open a panel showing you                        
" files currently opened in a buffer.
Plug 'jlanzarotta/bufexplorer'

" These two combined allow us to use custom snippets located in UltiSnips folder you copied earlier.
" The way it works is very simple. You just add to this file:
"
" # <comment>
" snippet <snippet_name> <snipped_description>
" <any_code_you_want>
" endsnippet
"
" I foud it helpful to begin snippet name with file name where it will work.
" So for example symphony snippets would start with php_symfony_xxx.
" ORM snippets would start yml_orm_xxx.
"
" Track the engine.
Plug 'https://github.com/SirVer/ultisnips.git'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'


" getters/setters generator
" A plugin to automatically add getters and setters in php classes.
" You just mark variables with visual block (Shift + V) and input one of the commands:
" :InsertGetterSetter
" :InsertGetterOnly
" :InsertSetterOnly
" :InsertBothGetterSetter
Plug 'https://github.com/docteurklein/php-getter-setter.vim.git'

" SQL Querry autocomplete
" One of my favorites.
" This plugin allows you to connect to a database and provide intelli sense when writing
" queries against this database.
Plug 'https://github.com/vim-scripts/dbext.vim.git'

" Color schemes
" Pretty self explanatory, allowing us to pick more color schemes.
Plug 'https://github.com/sainnhe/gruvbox-material.git'
Plug 'https://github.com/sainnhe/vim-color-forest-night.git'
Plug 'https://github.com/semibran/vim-colors-synthetic.git'
Plug 'https://github.com/Heorhiy/VisualStudioDark.vim.git'

" Languages coloring pack
" It provides color markup for a lot of languages.
Plug 'https://github.com/sheerun/vim-polyglot'

" Git difference display in opened documents
" It displays green pluses and red minuses in left row insode of vim if
" current file is being tracked by git version control.
Plug 'https://github.com/airblade/vim-gitgutter.git'

" Tag list display
" Pressing Ctrl + t shows lists of tags helpful to jump across files.
Plug 'https://github.com/majutsushi/tagbar.git'

" Bottom bar enchancement
" Just a mych better display of the bottom bar.
Plug 'https://github.com/vim-airline/vim-airline.git'

" Fuzzy finder
" Pressing Ctrl + f allows you to search for a specific file name in current
" project.
Plug 'https://github.com/junegunn/fzf.vim.git'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tags generation from within nvim
" Allows for tags generation. The concept of tags is exmplained in main file.
Plug 'https://github.com/universal-ctags/ctags.git'

" Project tree display
" When pressing Ctrl + p it will toggle the display of project view.
" If you are focusing it you can close it with Ctrl + d.
" If you want to jump back to it after opening the file press Ctrl + u.
Plug 'https://github.com/scrooloose/nerdtree.git'

" Commenting marked text
" When you highlight text in visual mode you can toggle commenting by pressing keys
" gc (just gc, without ctrl or anything).
Plug 'https://github.com/tpope/vim-commentary.git'

" Syntax checker
" Every time you save a file it will check syntax and show warning according
" to a specific coding standard that we can declare and modify.
Plug 'https://github.com/vim-syntastic/syntastic.git'

" Twig language support
" Language support for twig files.
Plug 'https://github.com/evidens/vim-twig.git'

" Multiple cursors
" Mark something in visual mode and press:
" Ctrl + n to mark next match.
" Ctrl + x to skip next match.
" Ctrl + p to return to previous match.
Plug 'https://github.com/terryma/vim-multiple-cursors.git'

" Auto complete plugin so when you write something suggestions appear
Plug 'https://github.com/ycm-core/YouCompleteMe'
Plug 'ervandew/supertab'

" Auto save plugin
Plug 'https://github.com/907th/vim-auto-save'

call plug#end()

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
map <C-p> :NERDTreeToggle<CR>
map <C-u> :NERDTreeFocus<CR>
map <C-f> :Files<CR>
map <C-d> :bdelete<CR>
map <C-t> :TagbarToggle<CR>
" with ctrl + B toggle buffer explorer
map <C-b> :ToggleBufExplorer<CR>
map <C-q> :q!<CR>
map <C-s> :w<CR>
" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" global default config for YouCompleteMe
let g:ycm_python_interpreter_path = ''
let g:ycm_python_sys_path = []
let g:ycm_extra_conf_vim_data = [
  \  'g:ycm_python_interpreter_path',
  \  'g:ycm_python_sys_path'
  \]
let g:ycm_global_ycm_extra_conf = '~/global_extra_conf.py'

" ctrl + arrow navigation between windows
nmap <silent> <C-Up> :wincmd k<CR>
nmap <silent> <C-Down> :wincmd j<CR>
nmap <silent> <C-Left> :wincmd h<CR>
nmap <silent> <C-Right> :wincmd l<CR>

" enable AutoSave on Vim startup
let g:auto_save = 1
" do not display the auto-save notification
" let g:auto_save_silent = 1  

" Set color scheme
set termguicolors
set background=dark
colorscheme gruvbox-material

" Database profiles for SQL Querry autocomplete dbext.vim
let g:dbext_default_profile_test = 'type=PGSQL:user=:dbname=:host='
" Set profile above to the project
augroup project1
    au!
    autocmd BufRead */* DBSetOption profile=test
augroup end


