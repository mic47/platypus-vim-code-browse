# Simple Code browsing utilities shortcuts

Few utilities to help with browsing code.

## Installation
Extract it into .vim directory, or use plugin manager like Vundle, Pathogen or others.

## Features

### Feature: Grep under cursor
Put this into `map <silent> <C-G> <Plug>(code_browse_shortcut)` your vimrc and each time you hit ctrl-f, vim will 
search for the word under cursor with grep (useful if you have set grepprg to search your whole repository).

### Feature: Open current line/selection on github
Note: Currently works only for git repositories that are on github. Happy to accept PRs to handle more than
just this.

Put `map <silent> <C-G> <Plug>(code_browse_shortcut)` into your vimrc, if hit
ctrl-g, it will open your browser with link to current line (or selected lines) in github. Useful for sharing
links to code between colleagues.

By default, it opens the link in the firefor. If you want to change it, set let `g:code_browse_browser_cmd` to something else.


