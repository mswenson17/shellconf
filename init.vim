call plug#begin('~/.vim/plugged')

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.  plugin on GitHub repo
Plug 'bkad/CamelCaseMotion'              " makes numbers, underscores, and case shifts the word limit
Plug 'chrisbra/csv.vim'                  " plugin for better parsing, iteration through csv files (excel replacement)
Plug 'fidian/hexmode'                    " plugin for displaying binary files as hex 
Plug 'lervag/vimtex'                     " LaTeX syntax and format plugin 
Plug 'majutsushi/tagbar'                 " Adds a file overview window
"Plug 'maxbrunsfeld/vim-yankstack'        " saves previous yanks
Plug 'mbbill/undotree'                   " graphical representation of the undo tree
"Plug 'milkypostman/vim-togglelist'        " adds toggle for quick and leader lists
"Plug 'ronakg/quickr-cscope.vim'           " better cscope bindings
Plug 'roxma/nvim-completion-manager'     " adds completions DEPRECEATED
    Plug 'Rip-Rip/clang_complete'
    "Plug 'sassanh/nvim-cm-eclim'
Plug 'scrooloose/nerdcommenter'          " adds comment toggles
Plug 'scrooloose/nerdtree'               " file  browsing window
Plug 'taketwo/vim-ros'                   " ros syntax highlighting and utilities
Plug 'tpope/vim-abolish'                 " adds Subvert command and case-coersion crs command
Plug 'tpope/vim-fugitive'                " adds git commands
Plug 'tpope/vim-repeat'                  " allows certain plugin commands to be repeated with .
Plug 'tpope/vim-surround'                " adds substitution of brackets for different brackets
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'                 " cleans up the netrw window
Plug 'w0rp/ale'                          " linter and syntax checker
Plug 'vim-airline/vim-airline'           " status bar improvements
Plug 'Yggdroot/indentLine'               " adds dashed lines at tab widths to show indents better
"
" All of your Plugins must be added before the following line
call plug#end()            " required

"Vim Settings
set undofile                             " undos persist across vim instances
set undodir=~/.vim/undo                  " store undo files in one place
set noswapfile                           " turn off swap files (they're annoying)
set encoding=utf-8                       " needed to display unicode characters correctly
set guicursor=                           " needed to stop cursor from doing weird shit
"set tags=~/ctags/tags
"let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0
"set shell=bash\ -l
"set lazyredraw
colo molokai                             " semi custom colorscheme with modifications for vimdiff
set number                               " show line number
set cursorline                           " show cursorline
set ruler                                " show cursor location data in bottom right
set nowrap                               " turns off linewrapping by default
set laststatus=2                         " always have a status line (this is default)
set tabstop=4                            " width of tabs (default is 8)
set shiftwidth=4                         " num spaces to use for indent commands
set expandtab                            " spaces instead of tabs
set wildmenu
set wildmode=longest,full                " tab completion settings
"set wildignore=.svn,CVS,.git,tmp,*.o,*~,*.pyc,*.d,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pdf,*.bak,*.beam
set hlsearch                             " highlight search matches
set smartcase                            " searching is case insensitve unless specified
set incsearch                            " show search term as you type it
set hidden                               " change buffers without needing to save
set foldenable                           " turns on folding
set foldlevelstart=5                     " don't fold the first levels when opening a file
syn region myFold start="\#IF" end="\#ENDIF" transparent fold
set foldmethod=syntax                    " folds based on syntax
let g:xml_syntax_folding =1              " fold xml 

set noequalalways                        " subdivide window when splitting instead of rebalancing
set splitbelow                           " make new window on the bottom
set splitright                           " make new window on the right
set timeoutlen=300                       " wait 300ms for a mapped command to timeout
set ttimeoutlen=1000                     " wait 1s for a keycode to complete
"set visualbell                           " fuck beeping
"set t_vb=                                " fuck flashing 
set diffopt=filler,vertical,context:1000,iwhite  " sane diff options
set mouse=a                              " can interact with the mouse in all modes

"set csre
"set cscopetag

let g:tex_conceal=""                     " stop vimtex from subsituting latin characters
""autocmd BufRead,BufNewFile *.txt setlocal spell
autocmd BufRead,BufNewFile *.launch setfiletype roslaunch  " use ros syntax for launch files

"call yankstack#setup()
""
""Mappings
inoremap kj <Esc>

nnoremap S "_diwP 
"stuff for using enter key to insert blank lines in normal mode
autocmd CmdwinEnter * nnoremap <CR> <CR>   
nnoremap <S-Enter> o<Esc>
nnoremap <CR> <cr>O<Esc>

" i mistype this all the goddamn time
noremap ~? ~/   

" turns on fnacy search
noremap / /\v

" Turn off highlighting
nnoremap <S-L> :nohl<CR>

"sacriledge
"nnoremap B ^
"map Y y$
"nnoremap E $


" I also hit J when i mean j all the time. this make the join command require
" a double press. 
nnoremap J j
nnoremap <silent>JJ J


" better window switching
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <A-l> :bn<CR>
nnoremap <A-h> :bp<CR>
nnoremap <A-j> :b#<CR>

"onoremap " i"
"onoremap ( i(

cnoremap :ex<CR> :Ex<CR>


if has('nvim')
    " this sets the line numbering to relative while yanking or deleting text,
    " then sets it back
    autocmd TextYankPost  * :set norelativenumber
    nnoremap <silent><expr>d ':set relativenumber<CR>"'.v:register.'d'
    nnoremap <silent><expr>y ':set relativenumber<CR>"'.v:register.'y'
    onoremap <ESC> set norelativenumber<ESC>

    ""terminal mode remaps
    autocmd WinEnter term://* startinsert
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l

    tnoremap <A-l> <C-\><C-n>:bn<CR>
    tnoremap <A-h> <C-\><C-n>:bp<CR>
    tnoremap <A-j> <C-\><C-n>:b#<CR>
    tnoremap <Esc> <C-\><C-n>

""noremap <F3> :YcmForceCompileAndDiagnostics<CR> 
noremap <F4> :ALEFix<CR>
noremap <F5> :UndotreeToggle<CR>
noremap <F7> :NERDTreeToggle<CR>
noremap <F8> :TagbarToggle<CR> 
if has('nvim')
    noremap <F9> :so ~/.config/nvim/init.vim<CR>
else
    noremap <F9> :so ~/.vimrc<CR>
noremap <F10> :redraw!<CR>
noremap <F11> :e ~/.bashrc<CR>
noremap <F12> :e ~/.config/nvim/init.vim<CR>

nnoremap <silent><leader>w :call ToggleWrap()<CR>
nnoremap <silent><leader>t :call TrimWhitespace()<CR>

""Functions
fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfunction
command! TrimWhitespace call TrimWhitespace()

function! ToggleWrap()
    if &wrap
        echo "Wrap OFF"
        setlocal nowrap
        setlocal nolbr 
        set virtualedit=
        silent! nunmap <buffer> j
        silent! nunmap <buffer> k
        silent! ounmap <buffer> j
        silent! ounmap <buffer> k
    else
        echo "Wrap ON"
        setlocal wrap 
        setlocal lbr 
        set virtualedit=all
        noremap  <buffer> <silent> k gk
        noremap  <buffer> <silent> j gj
        onoremap  <buffer> <silent> k gk
        onoremap  <buffer> <silent> j gj
    endif
endfunction

""Plugin Options""

"csv
let g:csv_strict_columns = 1
let g:csv_no_column_highlight = 1
let g:csv_disable_fdt = 0
autocmd BufRead,BufNewFile *.csv :1,$ ArrangeColumn!
autocmd BufWritePre,FileWritePre *.csv :1,$UnArrangeColumn
autocmd BufWritePost,FileWritePost *.csv :1,$ArrangeColumn!

""Quickfix and Location window settings
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>:cclose<CR>
nnoremap <leader> q :copen<CR>
nnoremap [q :cp<CR>
nnoremap ]q :cn<CR>
let g:toggle_list_copen_command=":bo copen"

""File Explorer Settings
let g:NERDTreeQuitOnOpen=1
let g:netrw_sort_options="i"
let g:netrw_sort_sequence=""
let NERDTreeIgnore = ['\.pyc$']

""indentLine settings
let g:indentLine_leadingSpaceEnabled = 0
let g:indentLine_enabled = 1
let g:indentLine_color_term = 237
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*,t\/\/.*bash']
"let g:indentLine_concealcursor = 'vc'
"let g:indentLine_conceallevel = 0 
"
"CamelCaseMotion Settings
map w <Plug>CamelCaseMotion_w
map b <Plug>CamelCaseMotion_b
map e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
omap iw <Plug>CamelCaseMotion_iw
xmap iw <Plug>CamelCaseMotion_iw
omap ib <Plug>CamelCaseMotion_ib
xmap ib <Plug>CamelCaseMotion_ib
omap ie <Plug>CamelCaseMotion_ie
xmap ie <Plug>CamelCaseMotion_ie

""undo settings
let g:undotree_WindowLayout = 2
let g:undotree_SetFocusWhenvToggle = 1
let g:undotree_TreeNodeShape = '*'

""Airline Settings
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#whitespace#enabled = 0   
let g:airline#extensions#syntastic#enabled = 0
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
"nmap <leader>- <Plug>AirlineSelectPrevTab
"nmap <leader>+ <Plug>AirlineSelectNextTab

if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif

"" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-n>"
"let g:UltiSnipsJumpBackwardTrigger="<c-b>"

"nvim-completion settings
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

"ALE
let g:ale_lint_on_save =1
let g:ale_fixers = {
\            'python':['autopep8'],
\            'cpp':['clang-format'],
\            'xml':['xmllint']
\}

let g:ale_python_autopep8_options = '--aggressive --max-line-length=120'
let g:ale_c_clangformat_options = '-style="{IndentWidth: 4}"'
let g:clang_library_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'

"NERDComment
let g:NERDCreateDefaultMappings = 0
nmap <leader><space> <plug>NERDCommenterToggle
vmap <leader><space> <plug>NERDCommenterToggle

"let g:ycm_global_extra_conf = '~/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_server_keep_logfiles = 1
"let g:ycm_server_log_level = 'debug'
"let g:ycm_always_populate_location_list = 1
"let g:ycm_path_to_python_interpreter = '/usr/bin/python'
"let g:ycm_autoclose_preview_window_after_insertion = 1

