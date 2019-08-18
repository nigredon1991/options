set nocompatible              " be iMproved, required
filetype off                  " required

call plug#begin('~/.vim/plugged')
" Менеджер плагинов
" https://github.com/junegunn/vim-plug
"
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
Plug 'w0rp/ale'          " Asynchronous Lint Engine
Plug 'maralla/completor.vim' " Заканчиватель
Plug 'powerman/vim-plugin-ruscmd' " Команды на русском языке
Plug 'vim-pandoc/vim-pandoc-syntax' " Удобная подсветка для markdown
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

"Plug 'autozimu/LanguageClient-neovim', {
"    \ 'branch': 'next',
"    \ 'do': 'bash install.sh',
"    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'
Plug 'davidhalter/jedi-vim'

call plug#end()
"call vundle#end()                    " required
filetype plugin on
filetype plugin indent on
" Разбор vimrc в других папках
set exrc
set secure
" Macros
" Don't redraw while executing macros(good performance config)
set lazyredraw

set cursorline
set hidden
set nofoldenable
set modelines=0
set clipboard+=unnamed
"set clipboard=unnamed
"set synmaxcol=128 "Ломает подсветку синтаксиса в php после слишком длинной
"строки"
set encoding=utf-8
set nowrap
set number
set hlsearch
set ignorecase
set smartcase
set nobackup
set nowb
set noswapfile

set autoindent
set tabstop=4
set expandtab
set splitbelow
set cmdheight=2
set t_Co=256
colorscheme smyck
set backspace=indent,eol,start
aunmenu Help.
aunmenu Window.
set mousemodel=popup
set ruler
set completeopt-=preview
set gcr=a:blinkon0
if has("gui_running")
  set cursorline
endif
set ttyfast
syntax on
set showcmd


set switchbuf=useopen

set visualbell
set enc=utf-8
set ls=2
set incsearch
set hlsearch
set nu
set scrolloff=5

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>
nnoremap s "_d
"  Delete to null, not unnamed register

" Search for selected text.
" http://vim.wikia.com/wiki/VimTip171
let s:save_cpo = &cpo | set cpo&vim
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
let &cpo = s:save_cpo | unlet s:save_cpo

augroup vimrc_autocmds
    autocmd!
    autocmd FileType ruby,python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType ruby,python,javascript,php match Excess /\%80v.*/
    autocmd FileType ruby,python,javascript,php setlocal expandtab shiftwidth=4 softtabstop=4
    autocmd FileType bash,sh,hook,c,cpp  setlocal noexpandtab shiftwidth=4 softtabstop=4
    autocmd FileType md,markdown setlocal syntax=mkd filetype=markdown.pandoc shiftwidth=4 softtabstop=4

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
let g:ale_fix_on_save = 1
let b:ale_linters = {
                     \'sh': ['shellcheck'],
                     \ 'c': ['clang'],
                     \ 'cpp': ['clang'],
                     \}
"                      \ 'python': ['pylint','pyls'],

let g:ale_fixers = {
                     \ 'python' :['black'],
                     \  'sh': [ 'shfmt'],
                     \ 'c': ['clang-format'],
                     \ 'cpp': ['clang-format'],
                     \}
let g:ale_sh_shfmt_executable= 'shfmt'
let g:ale_python_black_executable= 'black'
let g:ale_python_black_options= '-l 80'
let g:ale_sh_shfmt_options= '--sr' " Если надо будет при перенаправлени в файл ставить пробел
let g:ale_c_clangformat_options = '-style="{BasedOnStyle: LLVM, IndentWidth: 8, UseTab: Always,  AllowShortIfStatementsOnASingleLine: false, IndentCaseLabels: false}"'
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
set formatexpr=LanguageClient#textDocument_rangeFormatting_sync()
function LC_maps()
if has_key(g:LanguageClient_serverCommands, &filetype)
        let g:ale_enabled = 0
        nnoremap <buffer> <silent> K :call LanguageClient#textDocument_hover()<cr>
        nnoremap <buffer> <silent> gd :call LanguageClient#textDocument_definition()<CR>
        nnoremap <buffer> <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
        nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
        nnoremap <silent> <F8> :call LanguageClient#textDocument_formatting()()<CR>
endif
endfunction

"    autocmd FileType c,cpp call LC_maps()

 let g:LanguageClient_serverCommands = {
     \ 'c': ['clangd'],
     \ 'cpp': ['clangd'],
     \ }
let g:LanguageClient_autoStart = 1

tnoremap <Esc> <C-\><C-n>
" ============ LanguageServer ============================
" ============ END ============================
