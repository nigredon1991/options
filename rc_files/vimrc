set encoding=utf-8
set nocompatible              " be iMproved, required
scriptencoding utf-8
filetype off                  " required

" Next time pip update
" pip install neovim black wemake-python-styleguide pylint  mypy
"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" Vundle settings
"== == == == == == == == == == == == == == == == == == == == == == == == == == =
" set the runtime path to include Vundle and initialize
"
let g:polyglot_disabled = ['rst', 'json', 'template']
let g:groovy_ignore_groovydoc=1 " in Jenkinsfile include javascript lang options, don't need this
" let g:polyglot_disabled = ['rst', 'json', 'template', 'ftdetect']
call plug#begin('~/.vim/plugged')
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" '. - последняя редактируемая строка для файла
" ctrl + o - назад положение курсора во всех файлах
" =G - из начала файла - запустить autoindent
" :w !sudo dd of=% - запись через sudo
" /\%Vpattern - поиск в последнем выделении

"Plug 'gmarik/Vundle.vim'        " let Vundle manage Vundle, required

Plug 'junegunn/vader.vim'

"------ -= == Code/project navigation == =-------------
Plug 'tpope/vim-commentary'           " My commentary Fast comment - gc in visual mode
Plug 'Shougo/vimproc.vim', {'do' : 'make'} " Need for vebugger
Plug 'idanarye/vim-vebugger'
"--------------- -= == Other == =----------------------
Plug 'vim-airline/vim-airline'               " Lean & mean status/tabline for vim
" Plug 'majutsushi/tagbar'
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
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'sheerun/vim-polyglot'
Plug 'dbeniamine/cheat.sh-vim'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
let g:easytags_syntax_keyword = 'always'
let g:easytags_async = 1
let g:easytags_auto_highlight = 0
let g:easytags_dynamic_files = 1

Plug 'gu-fan/InstantRst'
" Plug 'gu-fan/riv.vim'
Plug 'nigredon1991/riv.vim'
let g:riv_auto_format_table = 0
" let g:separator_between_lines_in_table = ""

Plug 'srstevenson/vim-picker'
"Plug 'michaeljsmith/vim-indent-object'

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'vimwiki/vimwiki'

" Plug 'davidhalter/jedi-vim'
Plug 'junegunn/vim-easy-align'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'will133/vim-dirdiff'


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
set undofile
set undodir=~/.vim/undo

set maxmempattern=2000 " sometime need more memory
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
set ignorecase
set smartcase
set wildmenu
set wildmode=list:longest

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set backup
set writebackup
set noswapfile

set autoindent
set tabstop=4
set expandtab
" set noexpandtab

set splitbelow
set splitright
"set background = dark
set cmdheight=2
set t_Co=256
colorscheme smyck
set grepprg=grep\ -Irn\ $*\ /dev/null
" """"""""""""""""""""""""""""""""""""""""""""""""""""""

set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
"let no_buffers_menu=1
set mousemodel=popup
set ruler
set completeopt-=preview
set completeopt+=noinsert
set completeopt+=noselect
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

set spelllang=en,ru

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>
tnoremap <C-\> <C-\><C-n>

if has('nvim')
    augroup TerminalStuff
      autocmd TermOpen * setlocal nonumber norelativenumber
      tnoremap <expr> <A-r> '<C-\><C-N>"'.nr2char(getchar()).'pi'
    augroup END
endif

let mapleader = "\<Space>"

nnoremap <Leader>+ :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>
" Search within a scope (a {...} program block).
" Version 2010-02-28 from http://vim.wikia.com/wiki/VimTip1530

" Search within top-level block for word at cursor, or selected text.
nnoremap <Leader>[ /<C-R>=<SID>ScopeSearch('[[', 1)<CR><CR>
vnoremap <Leader>[ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>gV
" Search within current block for word at cursor, or selected text.
nnoremap <Leader>{ /<C-R>=<SID>ScopeSearch('[{', 1)<CR><CR>
vnoremap <Leader>{ <Esc>/<C-R>=<SID>ScopeSearch('[{', 2)<CR><CR>gV
" Search within current top-level block for user-entered text.
nnoremap <Leader>/ /<C-R>=<SID>ScopeSearch('[[', 0)<CR>
vnoremap <Leader>/ <Esc>/<C-R>=<SID>ScopeSearch('[[', 2)<CR><CR>

"==================================================
"++ ALE-Settings
""================================================
set statusline+=%#warningmsg#

let g:ale_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_linters = {
                     \'sh': ['shellcheck'],
                     \ 'python': ['pylint', 'flake8', "mypy"],
                     \ 'c': ['cppcheck', 'cc'],
                     \ 'cpp': ['cppcheck'],
                     \ 'yaml': ['yamllint'],
                     \ 'json': ['jsonlint'],
                     \}

let g:ale_fixers = {
                     \ 'python' :['black'],
                     \  'sh': [ 'shfmt'],
                     \ 'c': ['clang-format'],
                     \ 'cpp': ['clang-format'],
                     \ 'json': ['jq'],
                     \ 'racket': ['scmindent'],
                     \}
let g:ale_c_cppcheck_executable= 'cppcheck'
let g:ale_c_cppcheck_options= '-v --enable=style -DDAN_NEVER="" -DDAN_FREQUENT=""'
let g:ale_yaml_yamllint_options= '-c ~/.yamllintrc'
let g:ale_sh_shfmt_executable= 'shfmt'
let g:ale_python_black_executable= 'black'
let g:ale_python_black_options= '-l 100'
let g:ale_python_flake8_options= '--ignore=Q000,T001,C101,S303,WPS110,WPS305,WPS221,WPS335,D100,D104,D401,W504,RST201,RST301,RST303,RST304,D101,D103,D412,E800,S101,WPS111 --max-line-length=100 --no-isort-config'
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
" write with sudo
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Return a pattern to search within a specified scope, or
" return a backslash to cancel search if scope not found.
" navigator: a command to jump to the beginning of the desired scope
" mode: 0=scope only; 1=scope+current word; 2=scope+visual selection
function! s:ScopeSearch(navigator, mode)
  if a:mode == 0
    let pattern = ''
  elseif a:mode == 1
    let pattern = '\<' . expand('<cword>') . '\>'
  else
    let old_reg = getreg('@')
    let old_regtype = getregtype('@')
    normal! gvy
    let pattern = escape(@@, '/\.*$^~[')
    call setreg('@', old_reg, old_regtype)
  endif
  let saveview = winsaveview()
  execute 'normal! ' . a:navigator
  let first = line('.')
  normal %
  let last = line('.')
  normal %
  call winrestview(saveview)
  if first < last
    return printf('\%%>%dl\%%<%dl%s', first-1, last+1, pattern)
  endif
  return "\b"
endfunction

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
if !hasmapto("<Plug>VLToggle")
  nmap <unique> <Leader>vl <Plug>VLToggle
endif
let &cpoptions = s:save_cpo | unlet s:save_cpo


"  при переходе за границу в 80 символов в Ruby/Python/js/C/C++ подсвечиваем
"  на темном фоне текст
augroup vimrc_autocmds
    autocmd!
    autocmd FileType txt match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,php match Excess /\%100v.*/
    autocmd FileType ruby,python,javascript,php setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4 foldmethod=indent
    autocmd FileType bash,sh,hook setlocal noexpandtab shiftwidth=4 softtabstop=4
    autocmd FileType c,cpp  setlocal expandtab shiftwidth=2 softtabstop=2
    autocmd FileType md,markdown setlocal syntax=mkd filetype=markdown.pandoc shiftwidth=4 softtabstop=4
    autocmd FileType yaml setlocal shiftwidth=1 softtabstop=1 foldmethod=indent
    autocmd FileType Jenkinsfile setlocal shiftwidth=4 softtabstop=4
    autocmd FileType vim setlocal shiftwidth=4 softtabstop=4
    autocmd FileType racket setlocal shiftwidth=2 softtabstop=2 tabstop=4 foldmethod=indent

augroup END

nnoremap <F4> :!scp %:p example_server.lala:%:p <CR>


let g:easytags_whitelist = ['reps']

" ============ CSCOPE ============================
function! UpdateCscopeDb()
    let extensions = ['"*.cpp"', '"*.h"', '"*.hpp"', '"*.inl"', '"*.c"', '"*.java"', '"*.sh"', '"*.py"']
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

    nmap <C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>

    " nmap <C-Space>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    " nmap <C-Space>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    " nmap <C-Space>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    " nmap <C-Space><C-Space>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space><C-Space>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space><C-Space>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space><C-Space>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space><C-Space>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    " nmap <C-Space><C-Space>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    " nmap <C-Space><C-Space>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    " nmap <C-Space><C-Space>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


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


" TEST vimrc w0rp
" --- ALE settings ---
"
" Disable ALE warnings about trailing whitespace.
let g:ale_sign_error = '◉'
let g:ale_sign_warning = '◉'
highlight ALEErrorSign ctermfg=9 ctermbg=15 guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=15 guifg=#ED6237 guibg=#F5F5F5
"let g:ale_warn_about_trailing_whitespace = 0
let g:ale_maximum_file_size = 1024 * 1024
let g:ale_completion_enabled = 1
let g:ale_code_actions_enabled = 1
let g:ale_set_balloons_legacy_echo = 1
let g:ale_c_parse_compile_commands = 1

" Options for different linters.
let g:ale_python_mypy_ignore_invalid_syntax = 1
let g:ale_python_mypy_options = '--incremental'
"let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_text_changed = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_linters_explicit = 1


nmap <unique> <leader>pe <Plug>(PickerEdit)
nmap <unique> <leader>ps <Plug>(PickerSplit)
nmap <unique> <leader>pt <Plug>(PickerTabedit)
nmap <unique> <leader>pv <Plug>(PickerVsplit)
nmap <unique> <leader>pb <Plug>(PickerBuffer)
nmap <unique> <leader>p] <Plug>(PickerTag)
nmap <unique> <leader>pw <Plug>(PickerStag)
nmap <unique> <leader>po <Plug>(PickerBufferTag)
nmap <unique> <leader>ph <Plug>(PickerHelp)

" ga * | - for table
" Align by regexp
" :EasyAlign /[:;]+/
" :EasyAlign |       " align by 1st `|`
" :EasyAlign 3 |     " align by 3rd `|`
" :EasyAlign * |     " align by all `|`s
nmap ga <Plug>(EasyAlign)
xmap ga <Plug>(EasyAlign)


au BufRead,BufNewFile *.template set syntax=off

let g:instant_rst_browser='opera'


" Configure the `make` command to run RSpec
nnoremap ,wikit :read $HOME/reps/wiki/title.template<CR>jjj :put =strftime(\"%F %X %z\")<CR>kJ
nnoremap ,wiknew :put =strftime(\"%F-\")<CR>kJA
"============HEX============
" Hex read
nmap <Leader>hr :%!xxd<CR> :set filetype=xxd<CR>

" Hex write
nmap <Leader>hw :%!xxd -r<CR> :set binary<CR> :set filetype=<CR>

set makeprg=make

" NOW WE CAN:
" - Run :make to run make
" - :cl to list errors
" - :cc# to jump to error by number
" - :cn and :cp to navigate forward and back
  let g:vimwiki_list = [{'path': '~/reps/wiki/_posts/',
                       \ 'syntax': 'markdown', 'ext': '.md',
                       \ 'auto_tags': 1,
                       \ 'auto_generate_links': 1,
                       \ 'auto_generate_tags': 1}]
" ============ END ============================
"
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:CheatSheetDoNotMap=1
let g:CheatDoNotReplaceKeywordPrg=1

" let g:completor_disable_filename_c = 1
" let g:completor_disable_filename_cpp = 1
let g:completor_disable_filename = 1
let g:completor_disable_buffer = 1
let g:completor_disable_ultisnips = 1
let g:completor_enable_ultisnips= ['python', 'c', 'sh', 'cpp']
let g:completor_enable_buffer= ['python', 'c', 'sh', 'cpp']

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>gs <cmd>Telescope grep_string<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
