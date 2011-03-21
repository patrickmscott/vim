if exists("b:did_indent")
  finish
endif
let b:did_indent = 1

setlocal smartindent
" The following causes any use of the short declaration operator ":=" to
" indent the next line. Argh! I can't track down what's causing it, so
" I'll have to come back to it.

"setlocal cindent
" select and switch are deliberately excluded below.
setlocal cinwords=else,for,func,if

" cinkeys is as per default, except for ":" being removed.
"setlocal cinkeys=0{,0},0),0#,!^F,o,O,e
"setlocal cinoptions=11,+s,(0,W2s
"setlocal cinoptions+=g0,:0,l1,h0

"setlocal cinoptions+=:0  " case labels at switch level
"setlocal cinoptions+=l1  " case contents from label level
