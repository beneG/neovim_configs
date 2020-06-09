"let mapleader="<space>"
let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required
"source 'C:/coding/neovim/share/nvim/runtime/autoload/provider/ruby.vim'


" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()


set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'morhetz/gruvbox'
Plugin 'gruvbox-community/gruvbox'
"Plugin 'nanotech/jellybeans.vim'
"Plugin 'tomasiser/vim-code-dark'
"Plugin 'gcmt/taboo.vim'
Plugin 'scrooloose/syntastic'
Plugin 'takac/vim-hardtime'
Plugin 'farmergreg/vim-lastplace'
"Plugin 'mileszs/ack.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 's3rvac/autofenc'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'unblevable/quick-scope'
Plugin 'ryanoasis/vim-devicons'

Plugin 'rust-lang/rust.vim'
Plugin 'machakann/vim-highlightedyank'
Plugin 'fatih/vim-go'
Plugin 'preservim/nerdtree'
"Plugin 'scrooloose/nerdtree'
"Plugin 'greggerz/nerdtree-svn-plugin' does not work
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'shougo/vinarise.vim'
Plugin 'juneedahamed/svnj.vim'
"Plugin 'Shougo/defx.nvim'
Plugin 'pprovost/vim-ps1'

"Plugin 'metakirby5/codi.vim'
Plugin 'Shougo/vimproc.vim'
"Plugin 'idanarye/vim-vebugger'
Plugin 'myusuf3/numbers.vim'
"Plugin 'b3niup/numbers.vim'
Plugin 'mhinz/vim-startify'
Plugin 'mbbill/undotree'
Plugin 'terryma/vim-smooth-scroll'
Plugin 'enricobacis/vim-airline-clock'
"Plugin 'liuchengxu/vim-which-key'
Plugin 'powerman/vim-plugin-ruscmd'
Plugin 'ryvnf/readline.vim'
"Plugin 'haya14busa/incsearch.vim'
Plugin 'arecarn/selection.vim'
Plugin 'arecarn/crunch.vim'
"Plugin 'joom/vim-commentary'
Plugin 'dhruvasagar/vim-table-mode'
Plugin 'junegunn/vim-slash'
"Plugin 'yegappan/grep'
Plugin 'davidhalter/jedi-vim'
Plugin 'rking/ag.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'udalov/kotlin-vim'
Plugin 'moll/vim-node'
Plugin 'wilywampa/python-mode'

"Plugin 'jceb/vim-orgmode'
Plugin 'itchyny/calendar.vim'
Plugin 'junegunn/gv.vim'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/denite.nvim'

Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
"Plugin 'ervandew/supertab'
"Plugin 'taglist.vim'
"Plugin 'vimoutliner/vimoutliner'
"Plugin 'vim-ruby/vim-ruby'


"Plugin 'Shougo/neomru.vim'
Plugin 'majutsushi/tagbar'
"Plugin 'jlanzarotta/bufexplorer'
Plugin 'godlygeek/tabular'
Plugin 'BufOnly.vim'
Plugin 'wesQ3/vim-windowswap'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'mattesgroeger/vim-bookmarks'
"Plugin 'thinca/vim-quickrun'
Plugin 'liuchengxu/vim-clap'
Plugin 'kabbamine/zeavim.vim'
Plugin 'bling/vim-bufferline'
"Plugin 'junegunn/vim-peekaboo'
Plugin 'junegunn/limelight.vim'
"Plugin 'liuchengxu/vista.vim'
Plugin 'dstein64/vim-startuptime'
Plugin 'Vigemus/iron.nvim'
Plugin 'kana/vim-niceblock'

Plugin 'dahu/vim-rng'

"Plugin 'atweiden/vim-betterdigraphs'
Plugin 'euclio/vim-markdown-composer'
Plugin 'pangloss/vim-javascript'
Plugin 'chrisbra/unicode.vim'
Plugin 'matze/vim-move'
"Plugin 'osyo-manga/vim-over'
"Plugin 'lekv/vim-clewn'
"Plugin 'Conque-GDB'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'chlordane.vim'
Plugin 'taku-o/vim-vis'
"Plugin 'mariappan/dragvisuals.vim'
"Plugin 'fisadev/dragvisuals.vim'
"Plugin 'marijnh/tern_for_vim'
Plugin 'tpope/vim-surround'
Plugin 'glts/vim-magnum'
Plugin 'tpope/vim-repeat'
Plugin 'glts/vim-radical'
Plugin 'tpope/vim-speeddating'
Plugin 'terryma/vim-expand-region'


" All of your Plugins must be added before the following line
call vundle#end()            " required



filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
"nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
luafile $HOME/.config/nvim/plugins.lua
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "«"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "Ņ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
let g:javascript_conceal_noarg_arrow_function = "🞅"
let g:javascript_conceal_underscore_arrow_function = "🞅"

set conceallevel=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let vim_markdown_preview_github=1
""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"inoremap <expr> <C-K> ShowDigraphs()
"function! ShowDigraphs()
"    digraphs
"    call getchar()
"    return "\<C-K>"
"endfunction
"inoremap <expr> <C-K> BDG_GetDigraph()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"nmap     <C-F>f <Plug>CtrlSFPrompt
"vmap     <C-F>f <Plug>CtrlSFVwordPath
"vmap     <C-F>F <Plug>CtrlSFVwordExec
"nmap     <C-F>n <Plug>CtrlSFCwordPath
"nmap     <C-F>p <Plug>CtrlSFPwordPath
"nnoremap <C-F>o :CtrlSFOpen<CR>
"nnoremap <C-F>t :CtrlSFToggle<CR>
"inoremap <C-F>t <Esc>:CtrlSFToggle<CR>

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }



""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let g:windowswap_map_keys = 0 "prevent default bindings
"nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>
"nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>
"nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap <leader>h <c-w>h
noremap <leader>l <c-w>l
noremap <leader>k <c-w>k
noremap <leader>j <c-w>j

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fzf Configuration
" Mapping selecting Mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" In Neovim, you can set up fzf window using a Vim command
"let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:elite_mode=1

if get(g:, 'elite_mode')
    nnoremap <silent> <Up>    :resize +2<CR>
    nnoremap <silent> <Down>  :resize -2<CR>
    nnoremap <silent> <Left>  :vertical resize +2<CR>
    nnoremap <silent> <Right> :vertical resize -2<CR>
endif


let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'denite']
let g:numbers_exclude_buftypes = ['acwrite', 'help', 'nofile', 'nowrite', 'quickfix', 'terminal']
"autocmd  FileType fzf set nonumber norelativenumber
"  \| autocmd BufLeave <buffer> set number relativenumber



"augroup TerminalStuff
"  au!
"  autocmd TermOpen  * setlocal nonumber norelativenumber
  "autocmd TermLeave	* setlocal nonumber norelativenumber

  "autocmd TermOpen	* setlocal nonumber norelativenumber
  "autocmd FocusLost * setlocal nonumber norelativenumber
"augroup END



"map <C-n> :NERDTreeToggle<CR>
"map <C-m> :TagbarToggle<CR>
let g:tagbar_iconchars = ['', '']

let g:zv_zeal_executable = 'C:/Program Files/Zeal/zeal.exe'
let g:deoplete#enable_at_startup = 1


let g:loaded_perl_provider = 0
let g:ruby_host_prog = 'C:/coding/ruby/bin/neovim-ruby-host.bat'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
""let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsExpandTrigger="<enter>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"
"
"" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'
"let g:ycm_key_list_stop_completion = ['<enter>'] "['<tab>']
let g:ycm_key_list_stop_completion = ['<tab>']
set completeopt-=preview

let g:SuperTabDefaultCompletionType = "context"
"autocmd CmdwinEnter * inoremap <expr><buffer> <TAB>
"      \ pumvisible() ? "\<C-n>" : "\<TAB>"
"let g:SuperTabNoCompleteBefore=[';']
let g:SuperTabNoCompleteAfter=[';', '^', '\s'] "(default value: ['^', '\s'])

" better key bindings for UltiSnipsExpandTrigger
"let g:UltiSnipsExpandTrigger = "<tab>"

let g:UltiSnipsExpandTrigger = "<nop>"
inoremap <expr> <CR> pumvisible() ? "<C-R>=UltiSnips#ExpandSnippetOrJump()<CR>" : "\<CR>"

let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"


nnoremap <silent> <c-u> :call smooth_scroll#up(&scroll, 50, 4)<CR>
nnoremap <silent> <c-d> :call smooth_scroll#down(&scroll, 50, 4)<CR>
nnoremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 8)<CR>
nnoremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 8)<CR>



function! s:isAtStartOfLine(mapping)
  let text_before_cursor = getline('.')[0 : col('.')-1]
  let mapping_pattern = '\V' . escape(a:mapping, '\')
  let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
  return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
          \ <SID>isAtStartOfLine('\|\|') ?
          \ '<c-o>:TableModeEnable<cr><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
          \ <SID>isAtStartOfLine('__') ?
          \ '<c-o>:silent! TableModeDisable<cr>' : '__'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""


let g:fzf_files_options =
\ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'

" NERDTree settings
map <silent> <F2> :NERDTreeToggle<CR>

map <silent> <F3> :TagbarToggle<CR>


autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-cpp-enhanced-highlight settings

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_posix_standard = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1



""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:highlightedyank_highlight_duration = -1





""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 "1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = ['clang_tidy']
"let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_compiler = 'g++'
"let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' --std=c++17'
"let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++'
let g:syntastic_error_symbol = "\uF057"
let g:syntastic_warning_symbol = "\uF05A"
let g:syntastic_style_error_symbol = "\uE7C4"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" quick-scope settings
let g:qs_max_chars=150
let g:qs_highlight_on_keys=['f', 'F', 't', 'T']
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline



augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set hlsearch
set incsearch
set inccommand=split " this cool feature makes substitution interactive

"set statusline="%f%m%r%h%w [%Y] [0x%02.2B]%< %F%=%4v,%4l %3p%% of %L"
set ls=2


set nocompatible
syntax enable
filetype plugin on

set path+=**
set wildmenu

" Force to use underline for spell check results
augroup SpellUnderline
    autocmd!
    autocmd ColorScheme *
                \ highlight SpellBad
                \   cterm=Underline
                \   ctermfg=NONE
                \   ctermbg=NONE
                \   term=Reverse
                \   gui=Undercurl
                \   guisp=Red
    autocmd ColorScheme *
                \ highlight SpellCap
                \   cterm=Underline
                \   ctermfg=NONE
                \   ctermbg=NONE
                \   term=Reverse
                \   gui=Undercurl
                \   guisp=Red
    autocmd ColorScheme *
                \ highlight SpellLocal
                \   cterm=Underline
                \   ctermfg=NONE
                \   ctermbg=NONE
                \   term=Reverse
                \   gui=Undercurl
                \   guisp=Red
    autocmd ColorScheme *
                \ highlight SpellRare
                \   cterm=Underline
                \   ctermfg=NONE
                \   ctermbg=NONE
                \   term=Reverse
                \   gui=Undercurl
                \   guisp=Red
augroup END

"colorscheme codedark
"colorscheme gruvbox
"colorscheme jellybeans

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"airline settings
let g:airline_theme = 'gruvbox'

let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_buffers = 0


let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
"let g:airline#extensions#tabline#right_sep = ''
"let g:airline#extensions#tabline#right_alt_sep = ''
let airline#extensions#tabline#show_splits = 0
let airline#extensions#tabline#tabs_label = ''

" Disable tabline close button
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#fnamecollapse = 1

let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#buffers_label = ''
let g:airline#extensions#tabline#tabs_label = ''
set noshowmode
set showtabline=1




let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1
let g:webdevicons_enable_airline_statusline = 1
let g:webdevicons_enable_ctrlp = 1
"let g:webdevicons_conceal_nerdtree_brackets = 1
"let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '
let g:webdevicons_enable_denite = 1
let g:DevIconsEnableFoldersOpenClose = 1


"let airline#extensions#whitespace#trailing_format='T[%s]'
"let g:airline#extensions#whitespace#mixed_indent_file_format='MI[%s]'

set encoding=utf8


" enable powerline fonts
let g:airline_powerline_fonts = 1
"let g:airline_left_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''

"let g:airline#extensions#tabline#formatter = 'unique_tail'


let g:bufferline_echo = 0
let g:bufferline_active_buffer_left = '['
let g:bufferline_active_buffer_right = ']'
let g:bufferline_modified = '[]'
let g:bufferline_rotate = 2
let g:bufferline_inactive_highlight = 'StatusLineNC'
let g:bufferline_active_highlight = 'StatusLine'


"let g:gruvbox_termcolors=16
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline_skip_empty_sections = 1


"set sessionoptions+=tabpages,globals
"let g:taboo_tabline = 1

"easy move over tabs
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
"nnoremap <C-j> :tabprevious<CR>
"nnoremap <C-k> :tabnext<CR>


"open files in tabs
"au BufAdd,BufNewFile * nested tab sball


"hardtime plugin enable
"let g:hardtime_default_on = 0
"let g:hardtime_showmsg = 1


set encoding=utf-8
set termencoding=utf-8
set fillchars=vert:│


"autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

set backspace=indent,eol,start





let python_highlight_all = 1
let cpp_hightlight_all = 1

set undofile
"set foldcolumn=1






"move selected region with JK
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap K :m '<-2<CR>gv=gv


"search in files
"let g:ackprg = 'ag --nogroup --nocolor --column'
let g:ackprg = 'ag --column'


"commands in rus layout
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

" gb to switch buffer
nnoremap gb :ls<CR>:b<Space>


set cursorline
set mouse=a
set ruler
set laststatus=0
"set number
set nonumber
set norelativenumber

set virtualedit=block        " Position cursor anywhere in visual block


let g:python3_host_prog='C:\coding\python\python.EXE'
let g:python_host_prog='C:\coding\python27\python.EXE'
let python_highlight_all=1

let g:autofenc_emit_messages=1



function! ChangeFileencoding()
  let encodings = ['cp1251', 'utf-8', 'koi8-r', 'cp866']
  let prompt_encs = []
  let index = 0
  while index < len(encodings)
    call add(prompt_encs, index.'. '.encodings[index])
    let index = index + 1
  endwhile
  let choice = inputlist(prompt_encs)
  if choice >= 0 && choice < len(encodings)
    execute 'e ++enc='.encodings[choice].' %:p'
  endif
endf
nmap <F8> :call ChangeFileencoding()<CR>



set fileencodings=utf-8,cp1251,koi8-r,cp866
set spelllang=ru,en
"set spell

autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>


autocmd FileType go map <buffer> <F9> :w<CR>:exec '!go run' shellescape(@%, 1)<CR>
autocmd FileType go imap <buffer> <F9> <esc>:w<CR>:exec '!go run' shellescape(@%, 1)<CR>

autocmd FileType java map <buffer> <F9> :w<CR>:exec '!java' shellescape(@%, 1)<CR>
autocmd FileType java imap <buffer> <F9> <esc>:w<CR>:exec '!java' shellescape(@%, 1)<CR>

autocmd FileType javascript map <buffer> <F9> :w<CR>:exec '!node' shellescape(@%, 1)<CR>
autocmd FileType javascript imap <buffer> <F9> <esc>:w<CR>:exec '!node' shellescape(@%, 1)<CR>




autocmd FileType cpp map <buffer> <F9> :w<CR>:AsyncRun g++ -std=c++17 -O0 -g3 "%" -o "%<.exe" && "%<.exe"<CR>
autocmd FileType cpp imap <buffer> <F9> <esc>:w<CR>:AsyncRun g++ -std=c++17 -O0 -g3 "%" -o "%<.exe" && "%<.exe"<CR>

let g:asyncrun_open=10


if !has('nvim')
    set termguicolors
    set term=xterm
    "set t_Co=256
    set t_Co=16
    let &t_AB="\e[48;5;%dm"
    let &t_AF="\e[38;5;%dm"





    let g:gruvbox_termcolors=256
    set background=dark
    let g:airline_theme='gruvbox'


    colorscheme gruvbox


    set nocursorline
"else
"    set termguicolors
    "set cterm=xterm
 
"    set t_Co=256
    "set t_Co=16
"    let &t_AB="\e[48;5;%dm"
"    let &t_AF="\e[38;5;%dm"

"    let g:gruvbox_termcolors=16
"    set background=dark
"    let g:airline_theme='gruvbox'


"    colorscheme gruvbox

endif

"if !has("gui_running")
"    set term=xterm
"    set t_Co=256
"    let &t_AB="\e[48;5;%dm"
"    let &t_AF="\e[38;5;%dm"
"    colorscheme zenburn
"endif



"map <C-K> :pyf C:\coding\llvm\share\clang\clang-format.py<cr>
"imap <C-K> <c-o>:pyf C:\coding\llvm\share\clang\clang-format.py<cr>

let g:vinarise_enable_auto_detect=1


"set shell=\"C:/Program\ Files/PowerShell/7-preview/pwsh.exe\"
"set shellcmdflag=' -NoLogo -NonInteractive -Command'
""set shellquote=\"
"set shellxquote=set shellpipe=|
"set shellredir=>




set termguicolors




nnoremap <leader>s :<C-u>Denite buffer<CR>






autocmd FileType denite call s:denite_my_settings()
function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
                \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
                \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
                \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
                \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
                \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
                \ denite#do_map('toggle_select').'j'
endfunction

autocmd FileType denite-filter call s:denite_filter_my_settings()
function! s:denite_filter_my_settings() abort
    imap <silent><buffer> <C-o> <Plug>(denite_filter_quit)
endfunction

" Change file/rec command.
call denite#custom#var('file/rec', 'command',
            \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
" For ripgrep
" Note: It is slower than ag
call denite#custom#var('file/rec', 'command',
            \ ['rg', '--files', '--glob', '!.git'])
" For Pt(the platinum searcher)
" NOTE: It also supports windows.
call denite#custom#var('file/rec', 'command',
            \ ['pt', '--follow', '--nocolor', '--nogroup',
            \  (has('win32') ? '-g:' : '-g='), ''])
" For python script scantree.py
" Read bellow on this file to learn more about scantree.py
call denite#custom#var('file/rec', 'command',
            \ ['scantree.py', '--path', ':directory'])

" Change matchers.
call denite#custom#source(
            \ 'file_mru', 'matchers', ['matcher/fuzzy', 'matcher/project_files'])
call denite#custom#source(
            \ 'file/rec', 'matchers', ['matcher/cpsm'])

" Change sorters.
call denite#custom#source(
            \ 'file/rec', 'sorters', ['sorter/sublime'])

" Change default action.
call denite#custom#kind('file', 'default_action', 'split')

" Ag command on grep source
call denite#custom#var('grep', {
            \ 'command': ['ag'],
            \ 'default_opts': ['-i', '--vimgrep'],
            \ 'recursive_opts': [],
            \ 'pattern_opt': [],
            \ 'separator': ['--'],
            \ 'final_opts': [],
            \ })

" Ack command on grep source
call denite#custom#var('grep', {
            \ 'command': ['ack'],
            \ 'default_opts': [
            \   '--ackrc', $HOME.'/.ackrc', '-H', '-i',
            \   '--nopager', '--nocolor', '--nogroup', '--column'
            \ ],
            \ 'recursive_opts': [],
            \ 'pattern_opt': ['--match'],
            \ 'separator': ['--'],
            \ 'final_opts': [],
            \ })

" Ripgrep command on grep source
call denite#custom#var('grep', {
            \ 'command': ['rg'],
            \ 'default_opts': ['-i', '--vimgrep', '--no-heading'],
            \ 'recursive_opts': [],
            \ 'pattern_opt': ['--regexp'],
            \ 'separator': ['--'],
            \ 'final_opts': [],
            \ })

" Specify multiple paths in grep source
"call denite#start([{'name': 'grep',
"      \ 'args': [['a.vim', 'b.vim'], '', 'pattern']}])

" Define alias
call denite#custom#alias('source', 'file/rec/git', 'file/rec')
call denite#custom#var('file/rec/git', 'command',
            \ ['git', 'ls-files', '-co', '--exclude-standard'])

call denite#custom#alias('source', 'file/rec/py', 'file/rec')
call denite#custom#var('file/rec/py', 'command',
            \ ['scantree.py', '--path', ':directory'])

" Change ignore_globs
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
            \ [ '.git/', '.ropeproject/', '__pycache__/',
            \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])


"nmap <leader>n :NERDTreeToggle<CR>
"nmap <leader>f :NERDTreeFind<CR>




