set nocompatible              " be iMproved, required
filetype off                  " required

"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" Vundle settings
"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" '. - последняя редактируемая строка для файла
" ctrl + o - назад положение курсора во всех файлах
" =G - из начала файла - запустить autoindent
" :w !sudo dd of=% - запись через sudo

Plugin 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

"-------- -= == Code/project navigation == =-------------
Plugin 'scrooloose/nerdtree'             " Project and file navigation
Plugin 'tpope/vim-commentary'           " My commentary Fast comment - gc in visual mode

"----------------- -= == Other == =----------------------
Plugin 'vim-airline/vim-airline'               " Lean & mean status/tabline for vim
"Plugin 'fisadev/FixedTaskList.vim'      " Pending tasks list
"Plugin 'rosenfeld/conque-term'          " Consoles as buffers
Plugin 'tpope/vim-surround'           " ysiw] - заковычить слово, cst} - изменить на скобки, ds} - удалить ковычки
Plugin 'tpope/vim-repeat'
Plugin 'vim-airline/vim-airline-themes'

"- ------------- -= == Languages support == =-------------
" --- Python - --
"Plugin 'scrooloose/syntastic'
Plugin 'w0rp/ale'          " Asynchronous Lint Engine
Plugin 'maralla/completor.vim' " Заканчиватель
Plugin 'powerman/vim-plugin-ruscmd' " Команды на русском языке
Plugin 'vim-pandoc/vim-pandoc-syntax' " Удобная подсветка для markdown

call vundle#end()                    " required
filetype on
filetype plugin on
filetype plugin indent on
set exrc
set secure

" Macros
" let @b = "Ili**A**"
" Don't redraw while executing macros(good performance config)
set lazyredraw
set cursorline
set hidden
set nofoldenable
set modelines=0
"set clipboard = unnamedplus
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
"set background = dark
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
    autocmd FileType md,markdown setlocal syntax=mkd filetype=markdown.pandoc shiftwidth=4 softtabstop=4

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
let g:syntastic_python_checkers = ['pylint']


" Testing

let g:ale_enabled = 1
let g:ale_fix_on_save = 1
let b:ale_linters = {
                        \ 'python': ['flake8', 'pylint'],
                        \'sh': ['shellcheck']
                        \}

"let b:ale_linters = 'all'
let g:ale_fixers = {
                        \ 'python' :['autopep8', 'yapf'],
                        \  'sh': 'shfmt'
                        \}
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
nmap <F8> <Plug>(ale_fix)
"let g:ale_echo_cursor = 1
"let g:ale_echo_msg_error_str = 'Error'
"let g:ale_echo_msg_format = '%code: %%s'
"let g:ale_echo_msg_warning_str = 'Warning'
"let g:ale_keep_list_window_open = 0
"let g:ale_lint_delay = 200
"let g:ale_lint_on_enter = 1
"let g:ale_lint_on_save = 1
"let g:ale_lint_on_text_changed = 'always'
"let g:ale_open_list = 0
"let g:ale_set_highlights = 1
"let g:ale_set_loclist = 1
"let g:ale_set_quickfix = 0
"let g:ale_set_signs = 1
"let g:ale_sign_column_always = 0
"let g:ale_sign_error = '>>'
"let g:ale_sign_offset = 1000000
"let g:ale_sign_warning = '--'
"let g:ale_statusline_format = ['%d error(s)', '%d warning(s)', 'OK']
"let g:ale_warn_about_trailing_whitespace = 1
