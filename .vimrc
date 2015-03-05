" ================== Custom VIMRC ================================

set nocompatible              " be iMproved, required
filetype off                  " required


set tabstop=4     " a tab is four spaces
set expandtab
set backspace=indent,eol,start
                  " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                  "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set ruler         " show row and col number

set incsearch     " show search matches as you type
set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
set nobackup
set noswapfile
filetype plugin on
syntax on


" set the runtime path to include Vundle and initialize
"
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()


" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo


"================ Plugins for Unite.vim Start ================

Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'sgur/unite-everything'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/tabpagebuffer.vim'
Plugin 'Shougo/vimfiler.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'ujihisa/unite-colorscheme'


"================ Plugins for vim-airline Start ================
"
Plugin 'bling/vim-airline'
Plugin 'powerline/fonts' 
Plugin 'tpope/vim-fugitive'

" =============== NeoComplete ===============
Plugin 'Shougo/neocomplcache.vim'

" ============== Autopep8 =================
Plugin 'tell-k/vim-autopep8'


" Plugin 'klen/python-mode' " This will slow you down for a larger files. Use
                            " after u know what to choose 

" ================= vim-indent-guides ==================
Plugin 'nathanaelkane/vim-indent-guides'


" ================= spark up ==================
Plugin 'rstacruz/sparkup'


" ================= Javascript plugins ==================
Plugin 'jelera/vim-javascript-syntax' 
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'wookiehangover/jshint.vim' 
Plugin 'Shutnik/jshint2.vim'
"""Plugin 'othree/javascript-libraries-syntax'
au FileType javascript call JavaScriptFold()
let g:used_javascript_libs = 'angularjs, angularui, '
autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 0
autocmd BufReadPre *.js let b:javascript_lib_use_underscore = 0
autocmd BufReadPre *.js let b:javascript_lib_use_backbone = 0
autocmd BufReadPre *.js let b:javascript_lib_use_prelude = 0
autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
set runtimepath+=~/.vim/bundle/jshint2.vim/
let jshint2_save = 1
let $JS_CMD='node'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" let g:unite_source_grep_command = 'ack'
" let g:unite_source_grep_default_opts = '--no-heading --no-color -k -H'
let g:unite_prompt='>>> '
" let g:unite_source_grep_recursive_opt = ''
" let g:unite_enable_split_vertically
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
" ------------------ vim airline settings ----------------
let g:airline_section_b = '%{strftime("%c")}'
let g:airline_section_y = 'BN: %{bufnr("%")}' 
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀ '
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_alt_sep = '▶'


" powerline symbols
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''


let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
let g:Powerline_mode_V="V·LINE"
let g:Powerline_mode_cv="V·BLOCK"
let g:Powerline_mode_S="S·LINE"
let g:Powerline_mode_cs="S·BLOCK"
set laststatus=2
set hidden

set guifont=Ubuntu\ Mono\ derivative\ Powerline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
"------------------------ pymode -----------------------
" let g:pymode_lint = 1
" let g:pymode_run = 1
" let g:pymode_run_bind = '<F5>'
" let g:pymode_lint_on_write = 1
" let g:pymode_lint_checkers = ['pylint', 'pyflakes', 'pep8', 'mccabe']

" ---------------------- General ------------------------
set textwidth=79  " lines longer than 79 columns will be broken
set shiftwidth=4  " operation >> indents 4 columns; << unindents 4 columns
set tabstop=4     " a hard TAB displays as 4 columns
set expandtab     " insert spaces when hitting TABs
set softtabstop=4 " insert/delete 4 spaces when hitting a TAB/BACKSPACE
set shiftround    " round indent to multiple of 'shiftwidth'
set autoindent    " align the new line indent with the previous line



" Customs key mappings
"================== unite ======================
nnoremap <space> :Unite file buffer<CR>
nnoremap <space>a :Unite file_rec buffer<CR>
nnoremap <space>s :Unite -quick-match file<CR>
nnoremap <space>b :Unite -quick-match buffer<CR>
nnoremap <space>g :Unite grep:.<CR>
nnoremap <space>f :Unite find:.<CR>
nnoremap <space>d :Unite directory:.<CR>
nnoremap <space>n :Unite directory/new:.<CR>
nnoremap <space>m :Unite mapping<CR>
nnoremap <space>. :Unite neomru/file<CR>
nnoremap <space>l :Unite line<CR>

"============== Buffers =========================
map <C-Left> :bn<CR>
map <C-Right> :bp<CR>
map <C-Up> :enew<CR>
map <C-down> :bd<CR>
map <C-S-Right> :sbn<CR>
map <C-S-a> :ba<CR>


"============== indent-guide =========================
map <F9> :IndentGuidesToggle <CR>
let g:indent_guides_default_mapping = 1 
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4

"=============== General ========================
nnoremap <C-z> :q <CR>
nnoremap <C-x> :wq <CR>
