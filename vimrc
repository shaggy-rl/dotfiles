" ---------------------------------------------
" Dave Eddy's vimrc
" dave@daveeddy.com
" ---------------------------------------------
set nocompatible		" Disable VI Compatibility

" ---------------------------------------------
" Vim Options
" ---------------------------------------------
set backspace=indent,eol,start	" Backspace all characters
set hlsearch			" Highlight search results
set nonumber			" Disable line numbers
set nostartofline		" Do not jump to first character with page commands
set ruler			" Enable the ruler
set showmatch			" Show matching brackets.yy
set showmode			" Show the current mode in status line
set showcmd			" Show partial command in status line
set tabstop=8			" Number of spaces <tab> counts for
set title			" Set the title

" ---------------------------------------------
" Distribution Specefic Options
" ---------------------------------------------
runtime! debian.vim

" ---------------------------------------------
" Abbreviations
" ---------------------------------------------
iab me:: Dave Eddy <dave@daveeddy.com>
iab python:: if __name__ == '__main__':

" ---------------------------------------------
" Syntax Highlighting
" ---------------------------------------------
if has("syntax")
	syntax on
endif

" ---------------------------------------------
" File/Indenting
" ---------------------------------------------
if has("autocmd")
	" Jump to previous cursor location
	au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

	" Enable filetype indenting
	filetype plugin indent on
	set autoindent

	" Puppet manifests
	autocmd BufNewFile,BufReadPre,FileReadPre   *.pp set ts=2 sw=2 sts=2 et filetype=puppet

	" JavaScript files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.json,*.js set filetype=javascript
	autocmd filetype                            javascript  set ts=2 sw=2 sts=2 et

	" Python files
	autocmd BufNewFile,BufReadPre,FileReadPre   *.py   set filetype=python
	autocmd filetype                            python set ts=4 sw=4 sts=4 et

	" Markdown files
	autocmd BufNewFile,BufRead,FileReadPre      *.md     set filetype=markdown
	autocmd filetype                            markdown set ts=4 sw=4 sts=4 et spell
	autocmd BufNewFile,BufRead                  */_posts/*.md syntax match Comment /\%^---\_.\{-}---$/
endif

" ---------------------------------------------
" Highlight Unwanted Whitespace
" ---------------------------------------------
highlight RedundantWhitespace ctermbg=green guibg=green
match RedundantWhitespace /\s\+$\| \+\ze\t/

" ---------------------------------------------
" Source local config
" ---------------------------------------------
if filereadable(expand("~/.vimrc.local"))
	source ~/.vimrc.local
endif
