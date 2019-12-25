set encoding=utf-8
scriptencoding utf-8
"set nocompatible              " be iMproved, required
filetype off                  " required

"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" Vundle settings
"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" set the runtime path to include Vundle and initialize
"
call plug#begin('~/.vim/plugged')
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" '. - последняя редактируемая строка для файла
" ctrl + o - назад положение курсора во всех файлах
" =G - из начала файла - запустить autoindent
" :w !sudo dd of=% - запись через sudo

"Plug 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

Plug 'junegunn/vader.vim'

"------ -= == Code/project navigation == =-------------
Plug 'scrooloose/nerdtree'             " Project and file navigation
Plug 'tpope/vim-commentary'           " My commentary Fast comment - gc in visual mode
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Need for vebugger
Plug 'idanarye/vim-vebugger'
"--------------- -= == Other == =----------------------
Plug 'vim-airline/vim-airline'               " Lean & mean status/tabline for vim
"Plun 'fisadev/FixedTaskList.vim'      " Pending tasks list
"Plun 'rosenfeld/conque-term'          " Consoles as buffers
Plug 'tpope/vim-surround'           " ysiw] - заковычить слово, cst} - изменить на скобки, ds} - удалить ковычки
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline-themes'

"- ----------- -= == Languages support == =-------------
" --Python - --
Plug 'plytophogy/vim-virtualenv'
Plug 'michaeljsmith/vim-indent-object'
Plug 'w0rp/ale'          " Asynchronous Lint Engine
Plug 'maralla/completor.vim' " Заканчиватель
Plug 'powerman/vim-plugin-ruscmd' " Команды на русском языке
Plug 'vim-pandoc/vim-pandoc-syntax' " Удобная подсветка для markdown
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
let g:easytags_syntax_keyword = 'always'
let g:easytags_async = 1

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


Plug 'davidhalter/jedi-vim'

call plug#end()
"call vundle#end()                    " required
filetype on
filetype plugin on
filetype plugin indent on
" Разбор vimrc в других папках
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
"set clipboard+=unnamed
set clipboard=unnamed
"set synmaxcol=128 "Ломает подсветку синтаксиса в php после слишком длинной
"строки"
"set ttyscroll=10
set nowrap
set number
set hlsearch
set ignorecase
set smartcase
set wildmenu

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set noswapfile

set autoindent
set tabstop=4
set expandtab
" set noexpandtab

" set splitbelow
set splitright
"set background = dark
set cmdheight=2
set t_Co=256
colorscheme smyck
"
set grepprg=grep\ -Irn\ $*\ /dev/null
" """"""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
"let no_buffers_menu=1
set mousemodel=popup
set ruler
set completeopt-=preview
set guicursor=a:blinkon0
if has('gui_running')
  set cursorline
  endif
set ttyfast
"
" включить подсветку кода
syntax on
set showcmd


set switchbuf=useopen

set visualbell
set laststatus=2             " всегда показываем статусбар
set incsearch     " инкреминтируемый поиск
set hlsearch     " подсветка результатов поиска
set number             " показывать номера строк
set scrolloff=5     " 5 строк при скролле за раз
set backupdir=/tmp/
set directory=/tmp/
set undodir=/tmp/

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>
tnoremap <C-\> <C-\><C-n>

" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpoptions | set cpoptions&vim
if !exists('g:VeryLiteral')
  let g:VeryLiteral = 0
endif
function! s:VSetSearch(cmd)
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  normal! gvy
  if @@ =~? '^[0-9a-z,_]*$' || @@ =~? '^[0-9a-z ,_]*$' && g:VeryLiteral
    let @/ = @@
  else
    let pat = escape(@@, a:cmd.'\')
    if g:VeryLiteral
      let pat = substitute(pat, '\n', '\\n', 'g')
    else
      let pat = substitute(pat, '^\_s\+', '\\s\\+', '')
      let pat = substitute(pat, '\_s\+$', '\\s\\*', '')
      let pat = substitute(pat, '\_s\+', '\\_s\\+', 'g')
    endif
    let @/ = '\V'.pat
  endif
  normal! gV
  call setreg('"', old_reg, old_regtype)
endfunction
vnoremap <silent> * :<C-U>call <SID>VSetSearch('/')<CR>/<C-R>/<CR>
vnoremap <silent> # :<C-U>call <SID>VSetSearch('?')<CR>?<C-R>/<CR>
vmap <kMultiply> *
nmap <silent> <Plug>VLToggle :let g:VeryLiteral = !g:VeryLiteral
  \\| echo "VeryLiteral " . (g:VeryLiteral ? "On" : "Off")<CR>
if !hasmapto('<Plug>VLToggle')
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpoptions = s:save_cpo | unlet s:save_cpo

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
    autocmd FileType txt match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,php match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,php setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
    autocmd FileType bash,sh,hook setlocal noexpandtab shiftwidth=4 softtabstop=4
    autocmd FileType c,cpp  setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType md,markdown setlocal syntax=mkd filetype=markdown.pandoc shiftwidth=4 softtabstop=4
    autocmd FileType yaml setlocal shiftwidth=1 softtabstop=1

augroup END

" настройки Vim-Airline
set laststatus=2
"let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#formatter = 'unique_tail'

" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>

"==================================================
"++ Syntastic-Settings
""================================================
set statusline+=%#warningmsg#

" Testing
" Jedi
"let g:jedi#use_tabs_not_buffers = 1
"let g:jedi#goto_command = "<leader>d"
"let g:jedi#goto_assignments_command = "<leader>g"
"let g:jedi#goto_definitions_command = ""
"let g:jedi#documentation_command = "K"
"let g:jedi#usages_command = "<leader>n"
"let g:jedi#completions_command = "<C-Space>"
"let g:jedi#rename_command = "<leader>r"
"let g:jedi#completions_enabled = 1

let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let b:ale_linters = {
                     \'sh': ['shellcheck'],
                     \ 'python': ['pylint'],
                     \ 'c': ['cppcheck'],
                     \ 'cpp': ['cppcheck'],
                     \}
"                      \ 'python': ['pylint','pyls'],
                     "\ 'python': ['flake8'],

let g:ale_fixers = {
                     \ 'python' :['black'],
                     \  'sh': [ 'shfmt'],
                     \ 'c': ['clang-format'],
                     \ 'cpp': ['clang-format'],
                     \ 'json': ['jq'],
                     \}
let g:ale_c_cppcheck_executable= 'cppcheck'
let g:ale_c_cppcheck_options= '-v --enable=style -DDAN_NEVER="" -DDAN_FREQUENT=""'
let g:ale_sh_shfmt_executable= 'shfmt'
let g:ale_python_black_executable= 'black'
let g:ale_python_black_options= '-l 100'
let g:ale_sh_shfmt_options= '--sr' " Если надо будет при перенаправлени в файл ставить пробел
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: Google}"'
let g:ale_cpp_clangformat_options = '-style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always, AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}"'
"let g:ale_c_clangformat_options = '-style=Google'
let g:ale_set_highlights = 1
let g:ale_completion_enabled = 1
let g:airline#extensions#ale#enabled = 1
"let g:ale_set_loclist = 0
"let g:ale_set_quickfix = 1
nmap <F8> <Plug>(ale_fix)
"nmap <F2> <Plug>(ale_go_to_definition<CR>)
let g:easytags_whitelist = ['reps']

" ============ LanguageServer ============================
" " Use `gq` in visual to format this
" set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
" function LC_maps()
" if has_key(g:LanguageClient_serverCommands, &filetype)
"         let g:ale_enabled = 0
"         nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
"         nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
"         nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
"         nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
"         nnoremap <silent> <F8> :call LanguageClient#textDocument_formatting()()<CR>
" endif
" endfunction

" "    autocmd FileType c,cpp call LC_maps()

"  let g:LanguageClient_serverCommands = {
"      \ 'c': ['clangd'],
"      \ 'cpp': ['clangd'],
"      \ }
" let g:LanguageClient_autoStart = 1

" tnoremap <Esc> <C-\><C-n>

" ============ CSCOPE ============================
function! UpdateCscopeDb()
    let extensions = ['*.cpp', '*.h', '*.hpp', '*.inl', '*.c', '*.java']
    let update_file_list = 'find . -name ' . join(extensions, ' -o -name ') . ' > ./cscope.files'
    echo update_file_list
    echo system(update_file_list)
    echo system('cscope -b')
    cscope kill 0
    silent cscope add .
endfunction

if has('cscope')

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set cscopetagorder=0

    " add any cscope database in current directory
    if filereadable('cscope.out')
        silent cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB !=#''
"        silent cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    " Below are three sets of the maps: one set that just jumps to your
    " search result, one that splits the existing vim window horizontally and
    " diplays your search result in the new window, and one that does the same
    " thing, but does a vertical split instead (vim 6 only).
    "
    " I've used CTRL-\ and CTRL-@ as the starting keys for these maps, as it's
    " unlikely that you need their default mappings (CTRL-\'s default use is
    " as part of CTRL-\ CTRL-N typemap, which basically just does the same
    " thing as hitting 'escape': CTRL-@ doesn't seem to have any default use).
    " If you don't like using 'CTRL-@' or CTRL-\, , you can change some or all
    " of these maps to use other keys.  One likely candidate is 'CTRL-_'
    " (which also maps to CTRL-/, which is easier to type).  By default it is
    " used to switch between Hebrew and English keyboard mode.
    "
    " All of the maps involving the <cfile> macro use '^<cfile>$': this is so
    " that searches over '#include <time.h>" return only references to
    " 'time.h', and not 'sys/time.h', etc. (by default cscope will return all
    " files that contain 'time.h' as part of their name).


    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>	

    nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>	


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	
    nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif


nmap <F12> :call UpdateCscopeDb()<cr>
vmap <F12> <esc>:call UpdateCscopeDb()<cr>
imap <F12> <esc>:call UpdateCscopeDb()<cr>

" ============ CSCOPE END ============================

" ============ LanguageServer ============================
" ============ END ============================
