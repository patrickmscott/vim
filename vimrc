set nocompatible        " Not backward compatible

" Requied by Vundle
filetype off
set rtp+=~/src/vim/vundle/
call vundle#rc()

" Let Vundle manage itself
Bundle 'gmarik/vundle'
" Extra cool status bar
Bundle 'bling/vim-airline'
" Yaml
Bundle 'chase/vim-ansible-yaml'
" Go tools
Bundle 'fatih/vim-go'
" SLS
Bundle 'saltstack/salt-vim'
" pep8 indent
Bundle 'hynek/vim-python-pep8-indent'

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_theme='molokai'
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'

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
set tw=80               " Set the text width to 80 columns
set cc=81               " Highlight the 81 column
set sh=bash             " Set the shell to bash for command execution

set t_ZH=[3m
set t_ZR=[23m

colorscheme molokai
syn on
" Small adjustment to molokai scheme for matching parens/braces
hi MatchParen ctermfg=208 ctermbg=234 cterm=bold
hi Normal ctermfg=252 ctermbg=234
hi LineNr ctermfg=250 ctermbg=234
hi String ctermfg=227
hi Type cterm=italic
hi Comment cterm=italic
hi Member ctermfg=81

au FileType gitcommit set tw=72
au FileType python setlocal ts=4 sw=4 tw=100 cc=101
au BufEnter * syn sync fromstart
" Jump to the last line and column edited
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal '\"" | endif

" Reindent the current line.
nmap <tab> ==

" Reindent the entire file and return the cursor back to the current position.
nmap <F8> mzgg=G`z

" ;i toggles ignorecase
noremap ;i :set invic<BAR>:echo "IgnoreCase:".strpart("OffOn",3*&ignorecase,3)<CR>

" Sort the visually selected range by pressing "s"
vmap s :!sort<CR>

" Shortcut to reload the file.
map <F5> :e<CR>

" Helps debug syntax hilight by identifying the applied id.
map <F10> :echo "hi<".synIDattr(synID(line("."),col("."),1),"name")."> trans<"
      \ . synIDattr(synID(line("."),col("."),0),"name"). "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>
