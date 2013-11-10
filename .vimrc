set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

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
