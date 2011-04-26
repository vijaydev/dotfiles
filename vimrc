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

set previewheight=50
" hack from here http://stackoverflow.com/questions/3712725/can-i-change-vim-completion-preview-window-height
au BufEnter ?* call PreviewHeightWorkAround()
func PreviewHeightWorkAround()
	if &previewwindow
		exec 'setlocal winheight='.&previewheight
	endif
endfunc

set previewheight=50
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
set gdefault "srch & replace is global by default. Use /g to toggle behaviour
set shiftwidth=2
set softtabstop=2
set tabstop=2
set backspace=indent,eol,start
set history=100
set hidden
set tabpagemax=20
" TODO check how to add %{fugitive#statusline()} to statusline

let mapleader=","

syntax on
filetype on
filetype indent on
filetype plugin on

let NERDTreeIgnore=['^\.class$', '^\.old$']
"let NERDTreeShowLineNumbers=1

map <F4> :set nohls!<CR>:set nohls?<CR>
map <F3> :set nonu!<CR>:set nonu?<CR>

noremap <S-tab> <C-b>
noremap <tab> <C-f>
noremap <space> <C-f>

nmap <C-c> :CommandT<CR>
nmap <C-d> :NERDTreeToggle<CR>
" nmap <C-x> :TlistToggle<CR>
map <C-z> <Esc>:w<CR>

nnoremap <leader>p "+p
nnoremap <leader>y "+y

nnoremap <C-j> ddpkJ

:command WQ wq
:command Wq wq
:command W w
:command Q q
:command Qa qa

"autocmd BufWritePre *.rb :%s/\s\+$//
autocmd InsertEnter * highlight LineNr ctermbg=red guibg=red
autocmd InsertLeave * highlight LineNr ctermbg=black guibg=black

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
