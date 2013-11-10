execute pathogen#infect() 
set runtimepath^=~/.vim/bundle/ctrlp.vim 
nnoremap j gj
nnoremap k gk

set nocompatible
syntax on
filetype plugin indent on

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
