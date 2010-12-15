set nocompatible
call pathogen#runtime_append_all_bundles()
syntax on
set number
set autoindent
set smartindent
set copyindent
set smarttab
set ruler
set hlsearch
map <F4> :set nohls!<CR>:set nohls?<CR>
set incsearch
set ignorecase "case insensitive searching
set smartcase " but sensitive if Caps are used
set showmatch
set winheight=999 " split window heights
set wildmenu " auto complete commands
set wildmode=list:longest,full
set autochdir " change dir automatically 
set showcmd
set ttyfast
set nostartofline
set background=dark
filetype on 
filetype indent on
filetype plugin on
set autoread " watch for file changes
set laststatus=2
set background=dark

"use 2 spaces when using autoindent/cindent
set shiftwidth=2
"use the same value as shiftwidth
set softtabstop=2
"use 2 char positions for a TAB
set tabstop=2
"allow backspacing over identatiom, end-of-line, and start-of-line
set backspace=2
cabbr D NERDTreeToggle
let NERDTreeIgnore=['^\.class$', '^\.old$']
set wildignore=*.swp,*.class,*.bak
set pastetoggle=<F2>
set gdefault "search and replace is global by default. use /g to toggle behaviour

" space scroll in normal mode
noremap <S-tab> <C-b>
noremap <tab> <C-f>
noremap <space> <C-f>

" typos mapped to the right commands
:command WQ wq
:command Wq wq
:command W w
:command Q q
