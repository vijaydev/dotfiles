call plug#begin('~/.vim/vim-plugins')

Plug '907th/vim-auto-save'
Plug 'FelikZ/ctrlp-py-matcher'
Plug 'Lokaltog/vim-easymotion'
Plug 'Raimondi/delimitMate'
Plug 'Shutnik/jshint2.vim'
Plug 'ap/vim-css-color', { 'for': ['css', 'less'] }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'elzr/vim-json', { 'for' : 'json' }
Plug 'ervandew/supertab'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'
Plug 'majutsushi/tagbar'
Plug 'marijnh/tern_for_vim', { 'do': 'npm install', 'for': 'javascript' }
Plug 'mustache/vim-mustache-handlebars'
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'tpope/vim-sleuth'
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }

call plug#end()

set nocompatible

set autoindent
set background=dark
set backspace=indent,eol,start
set backupdir=$HOME/.vim-backup
set completeopt-=preview
set copyindent
set dir=$HOME/.vim-backup
set expandtab
set gdefault "srch & replace is global by default. Use /g to toggle behaviour
set hidden
set history=100
set hlsearch
set ignorecase
set incsearch
set laststatus=2 "display the status line always
set lazyredraw
set nostartofline
set number
set pastetoggle=<F2>
set previewheight=50
set ruler
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartcase "but sensitive if Caps are used
set smartindent
set smarttab
set softtabstop=2
set splitbelow
set splitright
set tabpagemax=60
set tabstop=2
set ttyfast
set virtualedit+=block
set wildignore=*.swp,*.class,*.bak,*.git
set wildmenu
set wildmode=list:longest,full
set winheight=999 "split window heights

syntax on
filetype on
filetype indent on
filetype plugin on

let mapleader=","

map <Leader> <Plug>(easymotion-prefix)

let g:user_emmet_install_global = 0
let g:user_emmet_leader_key='M'
au FileType html,css EmmetInstall

let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<Enter>']

let g:ctrlp_show_hidden = 0
let g:ctrlp_custom_ignore = 'target'
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = { 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'] }
endif

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0

let NERDTreeIgnore=['^\.class$', '^\.old$']
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL%'

let g:ragtag_global_maps = 0

nmap <C-D> :NERDTreeToggle<CR>
nmap <C-A> :TagbarToggle<CR>
nmap <leader>/ :RainbowParenthesesToggle<CR>

cabbr <expr> %% expand('%:p:h')

cmap w!! w !sudo tee % >/dev/null
imap <F1> <Esc>
imap <leader>h #{}<Esc>h
imap <silent> <C-G> <% end %><CR>
imap <silent> <C-K> <%  %><Esc>2hi
imap <silent> <C-L> <%=  %><Esc>2hi
imap <silent> <leader>cf console.info()<Esc>i
imap <silent> <leader>ci console.info('')<Esc>hi
imap <silent> <leader>ct console.time('')<Esc>hi
imap <silent> <leader>cte console.timeEnd('')<Esc>hi
imap \\ <CR><Esc>O
inoremap jj <ESC>
map <F1> <Esc>
map <F3> :set nonu!<CR>:set nonu?<CR>
map <F5> :set nolist!<CR>:set nolist?<CR>
map <F6> :set nohls!<CR>:set nohls?<CR>
map <leader>dc :%s/^\(.*\)$/\1 \1/<CR>
map <leader>sw :%s/\s\+$//<CR>
map Q <Esc>
map q: :q
nmap <silent> // :nohlsearch<CR>
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>
nnoremap / /\v
nnoremap <C-j> ddpkJ
nnoremap <CR> o<ESC>
nnoremap <leader>o :CtrlPMixed<CR>
nnoremap <leader><leader> <c-^>
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>
nnoremap <leader>ft Vatzf
nnoremap <leader>n :bn<CR>
nnoremap <leader>nn :tabnew<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>s :%s//<left>
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ss <C-w>s
nnoremap <silent> vv <C-w>v
nnoremap <tab> %
nnoremap D d$
nnoremap Y y$
noremap <S-tab> <C-b>
noremap <space> <C-f>
vnoremap / /\v
vnoremap <silent> j gj
vnoremap <silent> k gk
vnoremap <tab> %

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa
:command Wqa wqa

" persist folds http://princ3.wordpress.com/2007/01/26/automaticaly-save-foldings-in-vim/
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

au BufRead,BufNewFile {Gemfile,Rakefile,config.ru} set ft=ruby
au BufReadCmd *.epub call zip#Browse(expand("<amatch>"))

" hack from here http://stackoverflow.com/questions/3712725/can-i-change-vim-completion-preview-window-height
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
  if &previewwindow
    exec 'setlocal winheight='.&previewheight
  endif
endfunc

" Reference: http://vim.wikia.com/wiki/Switching_case_of_characters. Use tilde
" to toggle between title, upper and lower case
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ ygv"=TwiddleCase(@")<CR>Pgv

" Wraps paths to make them relative to this directory.
function! Dot(path)
  return '~/.vim/' . a:path
endfunction
