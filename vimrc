call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set nocompatible
set autoindent
set smartindent
set copyindent
set smarttab
set number
set ruler
set hlsearch
set incsearch
set ignorecase "case insensitive searching
set smartcase " but sensitive if Caps are used
set showmatch
set winheight=999 " split window heights
set wildmenu " auto complete commands
set wildmode=list:longest,full
set wildignore=*.swp,*.class,*.bak
"set autochdir " change dir automatically
set showcmd
set ttyfast
set nostartofline
set background=dark
set autoread
set laststatus=2
set background=dark
set pastetoggle=<F2>
set gdefault "search and replace is global by default. use /g to toggle behaviour
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start
set history=100
set hidden
" TODO check how to add %{fugitive#statusline()} to statusline

let mapleader=","

syntax on
filetype on
filetype indent on
filetype plugin on

let NERDTreeIgnore=['^\.class$', '^\.old$']
let NERDTreeShowLineNumbers=1

map <F4> :set nohls!<CR>:set nohls?<CR>
map <F3> :set nonu!<CR>:set nonu?<CR>

noremap <S-tab> <C-b>
noremap <tab> <C-f>
noremap <space> <C-f>

nmap <C-c> :CommandT<CR>
nmap <C-d> :NERDTreeToggle<CR>

" typos mapped to the right commands
:command WQ wq
:command Wq wq
:command W w
:command Q q

"autocmd BufWritePre *.rb :%s/\s\+$//
autocmd InsertEnter * highlight LineNr ctermbg=red guibg=red
autocmd InsertLeave * highlight LineNr ctermbg=black guibg=black

let g:gist_detect_filetype = 1 
let g:gist_open_browser_after_post = 1 
let g:gist_browser_command = 'firefox %URL%'
