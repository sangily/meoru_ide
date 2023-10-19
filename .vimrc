set nocompatible              " be iMproved, required
filetype off                  " required

set rtp +=~/.vim/bundle/Vundle.vim/
call vundle#begin()
    " let Vundle manage Vundle
    " required!-
    " My Bundles here:
Plugin 'VundleVim/Vundle.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'blueyed/vim-diminactive'
Plugin 'junegunn/vim-easy-align'
Plugin 'MattesGroeger/vim-bookmarks'
"Plugin 'davidhalter/jedi-vim'   " python 자동완성 Plugin
"let g:jedi#show_call_signatures=0       " 자세히 설명하는 창을 보여준다 1=활성화, 0=비>활성화
"let g:jedi#popup_select_first="0"   " 자동완성시 자동팝업 등장 x
"let g:jedi#force_py_version=2     " 자동완성 3 = python3 , 2 = python2
Plugin 'hynek/vim-python-pep8-indent'   " python 자동 들여쓰기 Plugin
filetype plugin indent on               " python 자동 들여쓰기 on

Plugin 'nvie/vim-flake8'                " python 문법 검사 plugin
let g:syntastic_python_checkers=['flake8']        " ↓ 실행시 현재줄 주석
" let g:syntastic_python_flake8_args='--ignore='    " 무시하고자 하는

call vundle#end()
filetype plugin indent on	" required!

let g:flake8_show_in_file=1   " show
let g:flake8_max_markers=500  " maximum # of markers to show(500 is default)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim-Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set laststatus=2 					" Show status bar at the bottom
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'	" Status bar delimiter is '|'
let g:airline#extensions#tabline#enabled = 1		" Show file list at the top
let g:airline#extensions#tabline#fnamemod = ':t'	" Show only file name on the upper buffer list
"let g:airline#extensions#tabline#buffer_nr_show = 1     " Show buffer number
let g:airline_section_y = ''				" Delete y section
let g:airline_section_warning= ''			" Disable the last status window
set hidden						" No error occurs when moving to another buffer without saving the modified buffer contents.
							" (Changes are persisted in a buffer, but not saved to storage)
							"
"" Pink themes
let g:airline_theme='fruit_punch'
"" Green themes
"let g:airline_theme='ayu_mirage'
"let g:airline_theme='term'
"let g:airline_theme='badwolf'
"" Blue themes
"let g:airline_theme='night_owl'
"let g:airline_theme='owo'
"let g:airline_theme='understated'
							"
" make new tab
" move to previous buffer
" move to next buffer
" move to previous buffer closing current buffer
nnoremap <C-t> :enew<Enter>
nnoremap <C-PageDown> :bnext!<Enter>
nnoremap <C-PageUp> :bprevious!<Enter>
nnoremap <C-Space> :winc w<Enter>
nnoremap <C-w> :bp <BAR> bd #<Enter>
nnoremap <C-A-Left> :winc h<Enter>
nnoremap <C-A-Right> :winc l<Enter>
nnoremap <C-A-Down> :winc j<Enter>
nnoremap <C-A-Up> :winc k<Enter>
nnoremap <C-S-Up> <C-Y>
nnoremap <C-S-Down> <C-E>
nnoremap <C-S-Right> z<Right>
nnoremap <C-S-Left> z<Left>
"nnoremap <C-c> "+y
nnoremap <C-S-v> "+p
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Nerd-commenter : auto comment maker
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" \ca : change comment type : line or block
" \cc : add comment
" \ci : add or delete comment
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Dim-inactive : no cursor screen blur
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:diminactive_use_syntax = 1
let g:diminactive_use_colorcolumn = 0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" vim-easy-align : auto space align
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" visual line > ga > -> key > press alignment target
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Tab control
set smartindent			" use indentation used on the previous line
set cindent			" auto tabbing function
set smarttab			" expand tab as space
set expandtab			" expand tab as space
set ts=4  			" width of tab (tabstop)
set shiftwidth=4		" width of autoindent (<<, >> in normal mode)
set backspace=indent,eol,start	" backspace enable
"set list listchars=tab:▸\ ,trail:·,precedes:←,extends:→		"tab과 space 구분하기 용이하게 세팅

"" Searching
set hls  			"highlighting searching word
set showmatch			"highlighting matching ()
set cursorline			"highlighting currnet lint
set cursorcolumn		"highlighting current column
"set smartcase			"case sensitive when searching
"set ignorecase			"ignore case letter when searching
set diffopt+=iwhite		"ignore white space at diff mode
set isfname+={,}		"add {,} to path letter
"set isfname-="'			remove to path letter
set incsearch
set wildmenu			"auto-complete
set wildmode=list:full		"When more than one match, list all matches and complete first match
set completeopt=menuone,preview	"Add auto-complete in insert mode

"" GUI
set number			"show line number
set ru  			"show cursor
"set lines=48			"window vertical size
"set columns=93			"window horizontal size
"winpos 960 0			"window start position
"set textwidth=150
"set statusline+=%F		"show current path in status bar
set title  			"show currnet file in title bar

color torte
set bg=dark
set guifont=D2Coding\ 15

set t_Co=256			"syntax on color
set encoding=utf-8

filetype on
au BufNewFile,BufRead *.v setf verilog
au BufNewFile,BufRead *.vh setf verilog
au BufNewFile,BufRead *.sv setf verilog

"" corresponding set cursorline, cursorcolumn
hi CursorLine term=reverse cterm=NONE ctermbg=darkred guibg=#333333
hi CursorColumn term=reverse cterm=NONE ctermbg=darkred guibg=#333333
"hi CursorLine term=reverse cterm=reverse
"hi CursorColumn term=reverse cterm=reverse
hi Search  ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#BBBBBB guibg=#DC0000 gui=NONE

"" ETC
set noswapfile			"do not make swap file (.swp)
set nobackup			"do not make backup file (.v~)
set nowrap

set visualbell
set smd  			"display current mode in status line

set mouse=a			"copy and paste

""syn off

set autoindent
set backspace=eol,start,indent
if has("syntax")
	syntax off
	syntax on
endif

if has("gui_running")
	"크기 설정
	au GUIEnter * winsize 147 40
	"시작 위치 설정
	au GUIEnter * winpos 2080 30
endif

let python_highlight_all = 1

" zf : make fold
" zc : close fold
" zo : open fold
" zd : delete fold
set fdm
set foldmethod=manual

autocmd BufWinLeave *.* silent mkview
autocmd BufWinEnter *.* silent loadview

nmap <F12> :noh<CR>
set clipboard=unnamed
