"allow backspacing over everything in insert mode
set nocompatible        " Not backward compatible
"set background=dark     " I always use a dark background

" Turn on plugins and filetype indention
filetype plugin on
filetype plugin indent on

set ttyscroll=5         " Used to completely redraw the screen instead of
                        " scroll

set autoindent nocindent nosmartindent
set ts=2
set sw=2
set vb t_vb=
set swapsync=
set hls
set expandtab
retab

" Highlight columns 81 and 82
function! HighlightTooLongLines()
  highlight def link RightMargin Error
  if &textwidth != 0
    exec 'match RightMargin /\%<' . (&textwidth + 3) . 'v.\%>' . (&textwidth + 1) . 'v/'
  endif
endfunction
augroup filetypedetect
  au BufNewFile,BufRead * setlocal textwidth=80
  au BufNewFile,BufRead * call HighlightTooLongLines()
  au BufNewFile,BufRead *.go setlocal noexpandtab filetype=go
  au BufNewFile,BufRead *.cc,*.cpp,*.c,*.h set filetype=cpp
  au BufNewFile,BufRead *.proto setfiletype proto
  au BufNewFile,BufRead *.thrift setfiletype thrift
  au BufNewFile,BufRead *.py setlocal sw=4
augroup END

set directory=~/.backup
set backupdir=~/.backup
set backup
set viminfo='10,\"100,:20,%
set path+=,,..,.
set hl-=l
hi mysearchhighlight guifg=#ff0000 guibg=#ffff00 ctermfg=white ctermbg=red
set hl+=l:mysearchhighlight
inoremap <S-Insert> <ESC>"+pi
vnoremap ^C "+y

nmap <tab> ==
nmap <F8> mzgg=G`z

" Don't show me the swap file messages and truncate lines by "..." if too long.
set shortmess=AT

" Remove all autocommands
autocmd!

" Jump to the last line and column edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal '\"" | endif

" ;i toggles ignorecase
noremap ;i :set invic<BAR>:echo "IgnoreCase:".strpart("OffOn",3*&ignorecase,3)<CR>

set ic                    " Always ignore the case
set nu                    " Line numbering
set noterse
set wrapmargin=0
set wrap
set showmatch
set report=1
set hidden

" -----------------------------------------------------
" V6.0
" -----------------------------------------------------

" For syntax highlighting
syntax on
syn region m start="{" end="}" transparent fold
syn sync fromstart
"set foldmethod=syntax

" A few highlighting differences.
"hi Statement	term=bold cterm=NONE ctermfg=Magenta ctermbg=NONE gui=bold guifg=#ffff60 guibg=NONE
"hi Number	term=underline cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
"hi String	term=underline cterm=NONE ctermfg=Red ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
"hi Special term=underline cterm=NONE ctermfg=DarkRed ctermbg=NONE gui=NONE guifg=#ffa0a0 guibg=NONE
hi Identifier cterm=bold ctermfg=darkgreen
hi Comment ctermfg=lightblue
hi LineNr ctermfg=darkgrey
hi String ctermfg=blue cterm=bold
hi Operator ctermfg=magenta

" -----------------------------------------------------

" When splitting the window into two separate windows only the current
" window size is affected.
set noequalalways

set ch=1
set is " Incrementally show the search as we are typing it in
set matchtime=3

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
      \ . "> trans<" . synIDattr(synID(line("."),col("."),1),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Go to the column position and line
map ' `

" Control-A takes me to my other file.
map <C-A> :b #<CR>

" Sort the visually selected range by pressing "s"
vmap s :!sort<CR>

" Movement between buffers
map ~A ~AW
map ,k ~AW
map ,j ~A~A

" Easy closing of a window
map ,q :close<CR>

" Nice pagination of a paragraph
map ,p mm{V}gq'm

" Searching for the visually selected text
vmap // y/<C-R>"<CR>

" Select the current word
map ,w bvwh

" Goto the buffer explorer
map ,b :BufExplorer<CR>
map ,B :SBufExplorer<CR>

" joinspaces:  insert two spaces after a period with every joining of lines.
set joinspaces

" laststatus:  Always show status line, even for only one buffer.
set laststatus=2

" lazyredraw:  do not update screen while executing macros
set lazyredraw

set ttimeout
set notimeout

" Use uppercase k to go up too
map K k

" Use ALT-D to delete all of the buffers
map ä :1,4000bdel<CR>

" Use X to delete the entire line
map X 0D

" Type "Uu" when there is a visually selected region to change casing
" so that all words are capatalized.
vmap Uu "xc<c-r>=substitute(@x,'\<.','\U&','g')<cr><esc>

vmap ,c "+y

vnoremap . :normal .<CR>

set backspace=indent,eol,start
set smarttab
