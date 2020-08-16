scriptencoding utf-8

let g:code_browse_browser_cmd="firefox"

function! CodeBrowseSelectionInBrowser() range
  let s:base_cmd = "echo $(git remote get-url --push origin | sed -e 's/:/\\//;s/^git@/https:\\/\\//;s/[.]git$/\\/tree/')/$(git rev-parse HEAD)/$(realpath --relative-to=\"$(git rev-parse --show-toplevel)\" $(pwd))/"
  let s:cmd = "!firefox $(" . s:base_cmd . @% . "\\#L" . a:firstline . "-L" . a:lastline . ")"
  execute s:cmd
endfunc

map <silent> <Plug>(code_browse_shortcut) :call CodeBrowseSelectionInBrowser()<cr><cr>
imap <silent> <Plug>(code_browse_shortcut) <esc>:call CodeBrowseSelectionInBrowser()<cr><cr>i
vmap <silent> <Plug>(code_browse_shortcut) :call CodeBrowseSelectionInBrowser()<cr><cr><esc>

" Put this to your vimrc to set the command.
" map <silent> <C-G> <Plug>(code_browse_shortcut)

