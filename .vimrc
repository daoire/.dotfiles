"===========================
"Some general defaults
"===========================
syntax on "syntax highlighting
set nocompatible "using vim not vi
set number "show line numbers
set relativenumber "use relative numbering from current line
set tabstop=4
set shiftwidth=4
set backspace=indent,eol,start "fixes backspace issue

" reload buffer when entering/focusing on:
" useful for files which have been edited elsewhere
au FocusGained,BufEnter * :silent! !

" auto-save when leaving buffer of losing focus
au FocusLost,WinLeave * :silent! w


"Moved these to ~/.vim/ftplugin/html.vim so they only operate in html files
"imap ,. </<C-X><C-O><Esc>F<i
"imap ,/ </<C-X><C-O><Esc>F<i<CR><Esc>O

" opening/closing (),{},[],<>,"",'' key mappings
" http://vim.wikia.com/wiki/Automatically_append_closing_characters
inoremap <expr> " strpart(getline('.'), col('.')-1,1) == "\"" ? "\<Right>":"\"\"\<Left>"
inoremap <expr> ' strpart(getline('.'), col('.')-1,1) == "\'" ? "\<Right>":"\'\'\<Left>"

inoremap { {}<Left>
inoremap <expr> } strpart(getline('.'), col('.')-1,1) == "}" ? "\<Right>":"}"
inoremap <expr> <CR> strpart(getline('.'), col('.')-1,1) == "}" ? "<CR><Esc>O":"<CR>"


inoremap ( ()<Left>
inoremap <expr> ) strpart(getline('.'), col('.')-1,1) == ")" ? "\<Right>":")"

" inoremap < <><Left>
" inoremap <expr> > strpart(getline('.'), col('.')-1,1) == ">" ? "\<Right>":">"

inoremap [ []<Left>
inoremap <expr> ] strpart(getline('.'), col('.')-1,1) == "]" ? "\<Right>":"]"

"===========================
" Vundle setup & plugins
"===========================
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'chriskempson/base16-vim'
Plugin 'scrooloose/nerdtree'

call vundle#end()
filetype plugin indent on
filetype plugin on

"colorscheme base16-phd

"===========================
" Nerdtree
"===========================
map <C-n> :NERDTreeToggle<CR>

let NERDTreeQuitOnOpen=1 "Close NERDTree after opening file

"===========================
" HTML autocomplete
"===========================
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags

if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

highlight LineNr ctermfg=grey ctermbg=black
