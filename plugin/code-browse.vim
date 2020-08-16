scriptencoding utf-8

let g:code_browse_browser_cmd="firefox"
" Put this to your vimrc to set the command.
" map <silent> <C-G> <Plug>(code_browse_browser)
" map <silent> <C-F> <Plug>(code_browse_grep)


function! CodeBrowseSelectionInBrowser() range
  let s:base_cmd = "echo $(git remote get-url --push origin | sed -e 's/:/\\//;s/^git@/https:\\/\\//;s/[.]git$/\\/tree/')/$(git rev-parse HEAD)/$(realpath --relative-to=\"$(git rev-parse --show-toplevel)\" $(pwd))/"
  let s:cmd = "!firefox $(" . s:base_cmd . @% . "\\#L" . a:firstline . "-L" . a:lastline . ")"
  execute s:cmd
endfunc

map <silent> <Plug>(code_browse_browser) :call CodeBrowseSelectionInBrowser()<cr><cr>
imap <silent> <Plug>(code_browse_browser) <esc>:call CodeBrowseSelectionInBrowser()<cr><cr>i
vmap <silent> <Plug>(code_browse_browser) :call CodeBrowseSelectionInBrowser()<cr><cr><esc>

function! GrepUnderCursor()
  let s:wordundercursor = expand("<cword>")
  let s:cmd = "grep " . s:wordundercursor
  execute s:cmd
endfunction

func! GetSelectedText()
  normal gv"xy
  let result = getreg("x")
  normal gv
  return result
endfunc

function! GrepSelection(selection)
  echom a:selection
  echo a:selection
  execute "grep '" . a:selection . "'"
endfunction

map <Plug>(code_browse_grep) :call GrepUnderCursor()<cr><cr>
imap <Plug>(code_browse_grep) <esc>:call GrepUnderCursor<cr><cr>i
vmap <Plug>(code_browse_grep) :call GrepSelection(GetSelectedText())<cr><cr><esc>



