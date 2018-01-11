set nocompatible              " be iMproved, required
filetype off                  " required

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" '. - последня редактируемая строка для файла
" ctrl + o - назад положение курсора во всех файлах

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'             " Project and file navigation
Plugin 'tpope/vim-commentary'           " My commentary Fast comment - gc in visual mode

"------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'               " Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
"Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'           " ysiw] - заковычить слово, cst} - изменить на скобки, ds} - удалить ковычки
Plugin 'tpope/vim-repeat'           
Plugin 'vim-airline/vim-airline-themes'

"---------------=== Languages support ===-------------
" --- Python ---
"Plugin 'klen/python-mode'            " Python mode (docs, refactor, lints, highlighting, run and ipdb and more)
"Plugin 'davidhalter/jedi-vim'         " Jedi-vim autocomplete plugin
"Plugin 'mitsuhiko/vim-jinja'        " Jinja support for vim
"Plugin 'mitsuhiko/vim-python-combined'  " Combined Python 2/3 for Vim
Plugin 'scrooloose/syntastic'

call vundle#end()                    " required
filetype on
filetype plugin on
filetype plugin indent on
" Разбор vimrc в других папках
set exrc
set secure

" Macros
let @b="Ili**A**"
" Don't redraw while executing macros (good performance config)
set lazyredraw

set cursorline
set hidden
set nofoldenable
set modelines=0
"set clipboard=unnamedplus
set clipboard=unnamed
"set synmaxcol=128 "Ломает подсветку синтаксиса в php после слишком длинной
"строки"
set ttyscroll=10
set encoding=utf-8
set nowrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set autoindent
set tabstop=4
set expandtab
" set noexpandtab

set splitbelow
"set background=dark
set cmdheight=2
set t_Co=256
colorscheme smyck 
"
"
" """"""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
"let no_buffers_menu=1
set mousemodel=popup
set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
  endif
  set ttyfast
"
" включить подсветку кода
syntax on
set showcmd


tab sball
set switchbuf=useopen

set visualbell       
set enc=utf-8     " utf-8 по дефолту в фаÐ¹лах
set ls=2             " всегда показываем статусбар
set incsearch     " инкреминтируемый поиск
set hlsearch     " подсветка результатов поиска
set nu             " показывать номера строк
set scrolloff=5     " 5 строк при скролле за раз

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>

" отключаем бэкапы и своп-файлы
"set nobackup          " no backup files
"set nowritebackup    " only in case you don't want a backup file while editing
set noswapfile          " no swap files

" прячем панельки
"set guioptions-=m   " меню
"set guioptions-=T    " тулбар
"set guioptions-=r   "  скроллбары

"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,php match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,php setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd FileType bash,sh,hook,c,cpp  setlocal noexpandtab shiftwidth=4 softtabstop=4
    autocmd FileType md,markdown setlocal syntax=mkd
augroup END

" указываем каталог с настройками SnipMate
let g:snippets_dir = "~/.vim/vim-snippets/snippets"

" настройки Vim-Airline
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
"игноррируемые файлы с расширениями
"let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$','pip-log\.txt$', '\.o$']  

" TaskList настройки
"map <F2> :TaskList<CR>        
" отобразить список тасковна F2

" Работа буфферами
map <C-q> :bd<CR>        
" CTRL+Q - закрыть текущий буффер



"=====================================================
"" Python-mode settings
"=====================================================
"" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
"let g:pymode_rope = 1
"let g:pymode_rope_completion = 1
"let g:pymode_rope_complete_on_dot = 1

" документация
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_write = 1

" поддержка virtualenv
let g:pymode_virtualenv = 1

" установка breakpoints
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_key = '<leader>b'

" подстветка синтаксиса
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" отключить autofold по коду
let g:pymode_folding = 1

" возможность запускать код
let g:pymode_run = 1
let g:pymode_run_bind = '<leader>r'

"==================================================
"++ Syntastic-Settings
""================================================
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
