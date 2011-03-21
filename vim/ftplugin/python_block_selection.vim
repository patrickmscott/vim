" What: Select Python Blocks by indentation.
" Authors: from Gerald Lai and various additions by mohsin@google.com
" Usage: source <this file> and
"   Press: vii, vai to select inner/outer python blocks by indentation.
"   Press: vii, yii, dii, cii to select/yank/delete/change an indented block.
" Block: is defined as a set of lines with indentation less than or equal
"    to cursor line. A 'class', 'def', 'main',
"    and two (or more) blank lines also act as block delimiters.

onoremap <silent>ai :<C-u>call IndentedTextObject(0)<CR>
onoremap <silent>ii :<C-u>call IndentedTextObject(1)<CR>
vnoremap <silent>ai <Esc>:call IndentedTextObject(0)<CR><Esc>gv
vnoremap <silent>ii <Esc>:call IndentedTextObject(1)<CR><Esc>gv

function! IsBlankLine(line_number)
  return getline(a:line_number) =~ "^\\s*$"
endfunction

function! IsClassDef(line_number)
    let block_boundary_re = "\\(^\\s*\\<\\(def\\|class\\)\\>\\)\\|__main__"
    return getline(a:line_number) =~ block_boundary_re
endfunction

function! IsBlockBoundary(distance1, current_indent, last_line, inner)
    " Arguments:
    " distance1 is either +1 for next, or -1 for previous lines to look at.
    " current_indent - include lines with indent more or equal to this.
    " last_line - so that we know when to stop.
    " inner - whether to exclude surrounding blank lines or not in the selection.

    " p0 refers to the line being examined.
    " p1 refers to the previous or next line (depending on distance1).
    " p2 refers to the previous-previous or next-next line.

    let p0 = line(".")
    let p1 = p0 + a:distance1
    let p2 = p0 + a:distance1*2

    if  p1 < 1  || p1 > a:last_line
       return 1
    endif

    let p1blank = IsBlankLine(p1)
    let p2blank = IsBlankLine(p2)

    " Class def always ends a block.
    if IsClassDef(p1)
        return 1
    endif

    " Condition is as follows, (if you can simplify this, more power to you).
    " 1. toplevel: next two lines are blank.
    " 2. indented: next or next-next line is more indented (allow for one blank line)
    " When !a:inner = include surrounding blank lines in the selection.

    if  !(a:current_indent == 0 && (!p1blank || (p2 > 0 && p2 < a:last_line && !p2blank)))
    \   && !(a:current_indent > 0  &&
    \                   (   (indent(p1) >= a:current_indent && !(p1blank && a:inner))
    \                    || (p1blank && indent(p2) >= a:current_indent)
    \                    || (p1blank && !a:inner)))
      return 1
    endif
    return 0
endfunction

function! IndentedTextObject(inner)
    let current_column = col(".")
    let current_line = line(".")
    let last_line = line("$")
    let current_indent = indent(line("."))

    " Look back for blocks jutting out.
    while !IsBlockBoundary(-1, current_indent, last_line, a:inner)
        -
    endwhile

    normal! 0V
    call cursor(current_line, current_column)

    " Look forward for blocks jutting out.
    while !IsBlockBoundary(+1, current_indent, last_line, a:inner)
        +
    endwhile

    normal! $

endfunction

