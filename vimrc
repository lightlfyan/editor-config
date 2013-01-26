set ch=2		" Make command line two lines high
set mousehide		" Hide the mouse when typing text
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

  highlight Normal guibg=grey90
  highlight Cursor guibg=Green guifg=NONE
  highlight lCursor guibg=Cyan guifg=NONE
  highlight NonText guibg=grey80
  highlight Constant gui=NONE guibg=grey95
  highlight Special gui=NONE guibg=grey95

endif

set fenc=utf-8 
set fencs=utf-8,usc-bom,euc-jp,gb18030,gbk,gb2312,cp936 
filetype on 
set clipboard+=unnamed
syntax on
set nobackup 
set nu
set tabstop=4
set shiftwidth=4
set expandtab
set nobackup
set guifont=Monaco:h12
set lines=35 columns=118
set guioptions-=T
set smartindent
set backspace=indent,eol,start
"set foldenable
"set foldmethod=syntax
set foldcolumn=0
setlocal foldlevel=1
set foldclose=all
set smarttab
set autoindent
set softtabstop=4
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
colo github

map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC>:NERDTreeToggle<CR>
let NERDSpaceDelims=1 
let NERDCompactSexyComs=1 

map <F11> :tabnew<CR>
map <F12> :close<CR>
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif
