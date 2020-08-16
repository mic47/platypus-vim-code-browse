# Open code selection in browser

Note: Currently works only for git repositories that are on github. Happy to accept PRs to handle more than
just this.

If you install this plugin and put `map <silent> <C-G> <Plug>(code_browse_shortcut)` into your vimrc, if hit
ctrl-G, it will open your browser with link to current line (or selected lines) in github. Useful for sharing
links to code between colleagues.


## Installation
Extract it into .vim directory, or use plugin manager like Vundle, Pathogen or others.
