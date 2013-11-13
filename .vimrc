set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
set nocompatible
filetype off

if has("win32")
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc("~/vimfiles")
else
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

" manage Vundle see :h vundle for more details or wiki for FAQ
Bundle 'gmarik/vundle'
" My bundles here:
"
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'FuzzyFinder'
Bundle 'git://git.wincent.com/command-t.git'
" End of bundles

filetype plugin indent on
syntax on

set diffexpr=
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

set hidden
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set guioptions-=T
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)
set number "set relativenumber
set wrap
set textwidth=79
set formatoptions=qrn1

let g:ctrlp_map = '<c-p>'

fun! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg
endf

fun! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endf

" Backup
set dir=%TMP%
set backupdir=%TMP%
"set nowritebackup
"set nobackup
"set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)
if has("persistent_undo")
    if has("win32")
        set undodir=~/vimfiles/undodir
    else
        set undodir=~/.vim/undodir
    endif
    set undofile
endif


autocmd BufEnter * lcd %:p:h
autocmd BufRead *.py nmap <F5> :!python %<CR>

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

"nnoremap / /\v
"vnoremap / /\v

nnoremap j gj
nnoremap k gk

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

if has("win32")
    "set shell=cmd.exe
    let gitdir='C:\Program Files (x86)\Git\bin'
    let $PATH.=';' .gitdir
    set shell=powershell.exe
    set shellcmdflag=-Command
    set shellpipe=>
    set shellredir=>
    set shellquote=\"
    set shellxquote=
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

" command to tidy xml
command Tidy execute "%! gc '%' | Tidy-Xml"


" My bundles here:
"
" very nice file browser
Bundle 'scrooloose/nerdtree'
" full path fuzzy search
Bundle 'kien/ctrlp.vim'
" git tools
Bundle 'tpope/vim-fugitive'
" jump around documents
Bundle 'Lokaltog/vim-easymotion'
" path searching
Bundle 'git://git.wincent.com/command-t.git'
"
nnoremap j gj
nnoremap k gk

set nocompatible
set hidden " The current buffer can be put to the background without writing to disk
syntax on
filetype plugin indent on

" Backup
set nowritebackup
set nobackup
set directory=/tmp// " prepend(^=) $HOME/.tmp/ to default path; use full path as backup filename(//)

autocmd BufEnter * lcd %:p:h
autocmd BufRead *.py nmap <F5> :!python %<CR>
set laststatus=2
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
source $VIMRUNTIME/vimrc_example.vim
set number

set statusline=%<%f%<%{FileTime()}%<%h%m%r%=%-20.(line=%03l,col=%02c%V,totlin=%L%)\%h%m%r%=%-30(,BfNm=%n%Y%)\%P\*%=%{CurTime()}
set rulerformat=%15(%c%V\ %p%%%)

if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

let g:ctrlp_map = '<c-p>'

fun! FileTime()
  let ext=tolower(expand("%:e"))
  let fname=tolower(expand('%<'))
  let filename=fname . '.' . ext
  let msg=""
  let msg=msg." ".strftime("(Modified %b,%d %y %H:%M:%S)",getftime(filename))
  return msg
endf

fun! CurTime()
  let ftime=""
  let ftime=ftime." ".strftime("%b,%d %y %H:%M:%S")
  return ftime
endf
