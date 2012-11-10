call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

set nocompatible
set autoindent
set smartindent
set copyindent
set smarttab
set expandtab
set number
set ruler
set hlsearch
set incsearch
set ignorecase "case insensitive searching
set smartcase " but sensitive if Caps are used
set showmatch
set winheight=999 " split window heights
set previewheight=50
" hack from here http://stackoverflow.com/questions/3712725/can-i-change-vim-completion-preview-window-height
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
  if &previewwindow
    exec 'setlocal winheight='.&previewheight
  endif
endfunc
set wildmenu " auto complete commands
set wildmode=list:longest,full
set wildignore=*.swp,*.class,*.bak,*.git
"set autochdir " change dir automatically
set showcmd
set ttyfast
set nostartofline
set background=dark
set autoread
set laststatus=2
set background=dark
set pastetoggle=<F2>
set gdefault "srch & replace is global by default. Use /g to toggle behaviour
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start
set history=100
set hidden
set tabpagemax=60
set dir=/home/vijay/.vim/backup
set scrolloff=5
set backupdir=/home/vijay/.vim/backup

"set undofile
"set undodir=/home/vijay/.vim_undo
let mapleader=","

syntax on
filetype on
filetype indent on
filetype plugin on

let NERDTreeIgnore=['^\.class$', '^\.old$']
" Dont show Press ? for help
let NERDTreeMinimalUI = 1
" Use nicer arrows in the tree
let NERDTreeDirArrows = 1
"let NERDTreeShowLineNumbers=1

"map <F6> :set nohls!<CR>:set nohls?<CR>
map <F3> :set nonu!<CR>:set nonu?<CR>
map <F5> :set nolist!<CR>:set nolist?<CR>

noremap <S-tab> <C-b>
noremap <tab> <C-f>
noremap <space> <C-f>

nmap <C-c> :CommandT<CR>
nmap <C-d> :NERDTreeToggle<CR>
map <C-b> :TlistToggle<CR>

map <C-x> <Esc>:w<CR>

cmap w!! w !sudo tee % >/dev/null

nnoremap <leader>p :bp<CR>
nnoremap <leader>n :bn<CR>
" switch betn last two buffers: https://github.com/krisleech/vimfiles/blob/master/vimrc
nnoremap <leader><leader> <c-^>

nnoremap <C-j> ddpkJ
nnoremap <C-t> bi<tt><ESC>f i</tt><ESC>
nnoremap <C-p> bi+<ESC>ea+<ESC>
nnoremap <CR> o<ESC>
nnoremap S i<cr><esc><right>

nnoremap <Leader>s :%s//<left>

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa
:command Wqa wqa

"autocmd BufWritePre *.rb :%s/\s\+$//
"autocmd InsertEnter * highlight LineNr ctermbg=red guibg=red
"autocmd InsertLeave * highlight LineNr ctermbg=black guibg=black

" persist folds
" http://princ3.wordpress.com/2007/01/26/automaticaly-save-foldings-in-vim/
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

let Tlist_Ctags_Cmd = "/usr/bin/ctags"

let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:gist_browser_command = 'google-chrome %URL%'

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

" Copied from https://github.com/oinak/dotvim/blob/master/.vimrc
function! StripWhitespace()
  exec ':%s/ \+$//'
endfunction
map <leader>sw :call StripWhitespace()<CR>

nmap <leader>m <C-w><C-w>_

" https://bitbucket.org/sjl/dotfiles/src/1b6ffba66e9f/vim/.vimrc
nnoremap D d$
nnoremap Y y$
" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Copy full buffer to OS clipboard.
function! CopyAll()
  normal mzggVG"+y'z
  call Say("Copied.")
endfunction
map <leader>a :call CopyAll()<CR>

" Delete buffer contents and Paste from OS clipboard.
function! PasteFromClipboard()
  normal ggVGd"+p1G
  "call Say("Pasted.")
endfunction
command B call PasteFromClipboard()

"fold tag
nnoremap <leader>ft Vatzf

nnoremap <leader>nn :tabnew<CR>

" Tab switching like firefox
map <leader>] gt
map <leader>[ gT
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 :tablast<CR>

nnoremap <silent> j gj
nnoremap <silent> k gk
vnoremap <silent> j gj
vnoremap <silent> k gk

"set dictionary=/usr/share/dict/words

nmap <silent> // :nohlsearch<CR>

"https://github.com/skwp/dotfiles/blob/master/vimrc
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

set cursorline
set virtualedit+=block

imap <leader>h #{}<Esc>h
imap <C-H> =><Space>
imap <silent> <C-K> <%  %><Esc>2hi
imap <silent> <C-G> <% end %><CR>
imap <silent> <C-L> <%=  %><Esc>2hi
imap <silent> <leader>cf console.info()<Esc>i
imap <silent> <leader>ci console.info('')<Esc>hi
imap <silent> <leader>ct console.time('')<Esc>hi
imap <silent> <leader>cte console.timeEnd('')<Esc>hi

" find merge conflict markers
nmap <silent> <leader>cf <ESC>/\v^[<=>]{7}( .*\|$)<CR>

map <F1> <Esc>
imap <F1> <Esc>
