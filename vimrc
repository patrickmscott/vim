set nocompatible        " Not backward compatible

" Requied by Vundle
filetype off
set rtp+=~/src/vundle/
call vundle#rc()

" Let Vundle manage itself
Bundle 'gmarik/vundle'
" Extra cool status bar
Bundle 'bling/vim-airline'

let g:airline_left_sep = ''
let g:airline_right_sep = ''

" Turn on plugins and filetype indention
filetype plugin indent on

set ts=2 sw=2           " Tabs and continuations are 2 spaces
set vb t_vb=            " Disable the visual bell
set swapsync=           " Disable syncing the swap file
set expandtab           " Expand all tabs
set dir=~/.backup       " Directory for swap files
set backup              " Enable backup files
set backupdir=~/.backup " Backup directory
set shortmess+=A        " Don't show the swap file messages
set ic                  " Always ignore the case
set nu                  " Line numbering
set noterse             " Show a message when searching a file and we hit the
                        " bottom or top
set wrap                " Wrap wide lines
set showmatch           " Match brackets when inserted
set report=1            " Show the number of lines changed
set ch=1                " 1 line command height
set is                  " Incrementally show the search as we are typing
set laststatus=2        " Always show the status line
set hls                 " Highlight search results
set wildmenu            " Enable a much cooler tab completion

" Highlight columns 81 and 82
function! HighlightTooLongLines()
  hi def link RightMargin Error
  exec 'match RightMargin /\%<83v.\%>81v/'
endfunction

au FileType go setlocal noexpandtab
au FileType python setlocal sw=4
au BufNewFile,BufRead * call HighlightTooLongLines()
" Jump to the last line and column edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal '\"" | endif

" Reindent the current line.
nmap <tab> ==

" Reindent the entire file and return the cursor back to the current position.
nmap <F8> mzgg=G`z

" ;i toggles ignorecase
noremap ;i :set invic<BAR>:echo "IgnoreCase:".strpart("OffOn",3*&ignorecase,3)<CR>
" For syntax highlighting
syntax on
syn region m start="{" end="}" transparent fold
syn sync fromstart
hi Identifier cterm=bold ctermfg=darkgreen
hi Comment ctermfg=lightblue
hi LineNr ctermfg=darkgrey
hi String ctermfg=blue cterm=bold
hi Operator ctermfg=grey
hi Directory ctermfg=cyan

" Sort the visually selected range by pressing "s"
vmap s :!sort<CR>
