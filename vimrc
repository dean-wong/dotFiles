"
" 配置文件
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'Chiel92/vim-autoformat'
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/neoyank.vim'
Plugin 'Shougo/unite-outline'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'
Plugin 'Valloric/ListToggle'
if v:version > 705
    Plugin 'Valloric/YouCompleteMe'
endif
Plugin 'Yggdroot/indentLine'
Plugin 'bling/vim-airline'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'flazz/vim-colorschemes'
Plugin 'godlygeek/tabular'
Plugin 'junegunn/goyo.vim'
Plugin 'keith/swift.vim'
Plugin 'kshenoy/vim-signature'
Plugin 'mhinz/vim-signify'
Plugin 'moll/vim-node'
Plugin 'morhetz/gruvbox'
Plugin 'rizzatti/dash.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-latex/vim-latex'
Plugin 'vim-syntastic/syntastic'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

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

" ------------------------------------------------------------------
" 基础配置
set nocompatible nobackup autoread nowritebackup noswapfile hidden
set tabstop=4 softtabstop=4 shiftwidth=4 expandtab
set number showcmd ruler showmode showmatch cursorline "relativenumber
set incsearch hlsearch ignorecase smartcase
set autoindent smartindent

" zsh 类型的自动补全菜单
set wildmenu wildmode=full

" 增加命令行记录条数
set history=300

" ------------------------------------------------------------------
"设置文件编码和语法显示
syntax on
filetype plugin indent on " 文件类型的detection、plugin、indent 全开

" 自动折叠
set foldmethod=syntax foldlevel=3

" ------------------------------------------------------------------
" indentLines
" let g:indentLine_char = '│'
" let g:indentLine_char = '┆'
" if has("gui_running")
    " let g:indentLine_setColors = 0
" endif

" ------------------------------------------------------------------
" 增强%命令的功能，可以在HTML TAG之间跳转
let loaded_matchit = 1
let loaded_matchparen = 1

" 启用:Man命令查看各类man信息
source $VIMRUNTIME/ftplugin/man.vim

" ------------------------------------------------------------------
"  设置增强的grep搜索，用GNU egrep代替grep
set grepprg=egrep\ -n\ $*\ /dev/null

"use the system clipboard
"set clipboard=unnamed

" Include搜索路径
set path=.,/usr/include,/usr/include/*,/usr/include/c++/4.2.1,/usr/include/c++/4.2.1/*,/usr/local/include,/usr/local/include/*,,

"设置默认文件编码格式为UTF-8，同时可以打开中文文档
set encoding           =utf-8
setglobal fileencoding =utf-8
"setglobal bomb
set fileencodings=ucs-bom,utf-8,cp936,euc-cn,cp950,big5,euc-tw
if &termencoding == ""
    let &termencoding = &encoding
endif

" 设置tags的查找文件，“；”代表向上搜索
set tags+=./tags;,tags,./.tags;,.tags

" ------------------------------------------------------------------
"设置外观
" ------------------------------------------------------------------
set showtabline=1
set laststatus=2

" ------------------------------------------------------------------
"  Airline 状态栏
let g:airline_detect_paste      =1
let g:airline_detect_iminsert   =1
let g:airline#extensions#ycm#enabled =1
"控制台需要安装Powerline-status for zsh
let g:airline_powerline_fonts                   =1
let g:airline#extensions#tabline#enabled        =1
let g:airline#extensions#tabline#buffer_nr_show =1

" ------------------------------------------------------------------
function! s:UseNormalFont()
    if has("gui_running")
        set antialias guifont =PragmataProMono:h14 linespace=2
        " set antialias guifont =Monaco\ for\ Powerline:h12 linespace=0

        " 设置合适的中文字体
        set guifontwide =PingFangSC-Regular "苹方
        " set guifontwide =HiraginoSansGB-W3 " 冬青黑体
    endif
endfunction
com! SetNormalFont call s:UseNormalFont()

function! s:UseBigFont()
    if has("gui_running")
        set antialias guifont=Operator\ Mono\ Light:h22 linespace=3
        "set antialias guifont=Sauce\ Code\ Powerline\ Light:h20 linespace=3
        set guifontwide  =SourceHanSansSC-Light "思源黑体
    endif
endfunction
com! SetBigFont call s:UseBigFont()

function! s:UsePixmapFont()
    if has("gui_running")
        set noantialias guifont=Terminus\ (TTF):h12 linespace=1
        " set guifontwide =AR-PL-New-Sung "文鼎新宋
        " set guifontwide =WenQuanYiZenHeiMono "文泉驿等宽正黑
        set guifontwide =Zfull-GB
    endif
endfunction
com! SetPixmapFont call s:UsePixmapFont()


if has("gui_running")
    colorscheme gruvbox " PapayaWhip
    let g:gruvbox_contrast_dark='hard'
    set guioptions   =cgim
    set transparency =20            " Makes the background window 80% opaque
    set columns      =138
    set lines        =42  "38
    set noimdisable noimcmdline iminsert=0 imsearch=-1  " 自动退出输入法
    "inoremap <ESC> <ESC>:set iminsert=0<CR>
    "autocmd! InsertLeave * set   imdisable
    "autocmd! InsertEnter * set noimdisable

    :SetNormalFont
else
    colorscheme desertink

    set mouse=a
    if exists('$TMUX')
        set ttymouse=xterm2
        let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
        if v:version > 705
            let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=2\x7\<Esc>\\"
        endif
        let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    else
        let &t_SI = "\<Esc>]50;CursorShape=1\x7"
        if v:version > 705
            let &t_SR = "\<Esc>]50;CursorShape=2\x7"
        endif
        let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    endif

endif

" ------------------------------------------------------------------
"  AutoFormat
" ------------------------------------------------------------------
let g:autoformat_verbosemode=1
let g:formatdef_clang_format = '"clang-format -style=llvm"'
let g:formatters_objcpp = ['clang_format']

" ------------------------------------------------------------------
"  Dash
" ------------------------------------------------------------------
:nmap <silent> <leader>? <Plug>DashSearch

" ------------------------------------------------------------------
"  EasyMotion
" ------------------------------------------------------------------
"<leader><leader> was used for Esc
nmap <leader><leader> <Plug>(easymotion-prefix)
vmap <leader><leader> <Plug>(easymotion-prefix)
" map ;; <Plug>(easymotion-prefix)

" ------------------------------------------------------------------
"  Signify
"
let g:signify_sign_delete            = '✗'
let g:signify_sign_change            = '≠'

" ------------------------------------------------------------------
" 设置目录树参数
" Netrw {
let g:netrw_liststyle    = 3
let g:netrw_banner       = 0
let g:netrw_alto         = 1
let g:netrw_altv         = 1 "置位此变量后，分割后的新窗口出现在右方而不是左
let g:netrw_browse_split = 2 " 浏览时，这样打开文件: 先垂直分割窗口
let g:netrw_winsize      = 25
" }

" NERDTree {
let g:NERDTreeWinPos     = "left"
let g:NERDTreeWinSize    = 31
" }

" ------------------------------------------------------------------
" NERD_commenter {
" 注释处理插件
let NERDSpaceDelims       = 1                        " 自动添加前置空格
let NERDRemoveExtraSpaces = 1
" }

" ------------------------------------------------------------------
" CtrlP
"
" nnoremap <silent><leader>r :<C-u>CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dylib)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }
" let g:ctrlp_match_window = 'top,order:btt,min:1,max:10,results:20' " order:ttb 查找文件光标从上到下 order:btt 从下到上
" let g:ctrlp_use_migemo = 1
let g:ctrlp_regexp = 1

" ------------------------------------------------------------------
" Unite
"
let g:unite_source_history_yank_enable     = 1
let g:unite_kind_file_preview_max_filesize = 50000
call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent><leader>r :<C-u>Unite -buffer-name=Buffer -winheight=10 -start-insert buffer bookmark file_mru file<cr>
nnoremap <silent><leader>t :<C-u>Unite -buffer-name=Outline -winwidth=35 -vertical -direction=botright -no-quit -toggle outline<cr>
nnoremap <silent><leader>m :<C-u>Unite -buffer-name=Jump -winheight=15 -vertical-preview -auto-preview jump<cr>
nnoremap <silent><leader>v :<C-u>Unite -buffer-name=Register -winheight=15 register history/yank<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
    " Play nice with supertab
    let b:SuperTabDisabled=1

    " Quick leave
    nmap <buffer> <leader><leader> <Plug>(unite_all_exit)
    nmap <buffer> <Space> <C-f>

    " Enable navigation with control-j and control-k in insert mode
    imap <buffer> <C-j>   <Plug>(unite_select_next_line)
    imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

" ------------------------------------------------------------------
"  Markdown
"
" let g:vim_markdown_no_default_key_mappings = 1
" let g:vim_markdown_toc_autofit             = 1
" let g:vim_markdown_math                    = 1
" let g:vim_markdown_frontmatter             = 1
" let g:vim_markdown_toml_frontmatter        = 1
" let g:vim_markdown_json_frontmatter        = 1

" ------------------------------------------------------------------
"  Tabularize
"
"if exists(":Tabularize")
" 在‘=’两边加上正则表达式，防止分割 >= 和 ==
nmap <Leader>a          :Tabularize /
vmap <Leader>a          :Tabularize /
nmap <silent><Leader>a= :Tabularize /[<\|>]*==*<CR>
vmap <silent><Leader>a= :Tabularize /[<\|>]*==*<CR>
nmap <silent><Leader>a: :Tabularize /:\zs<CR>
vmap <silent><Leader>a: :Tabularize /:\zs<CR>
"endif

" ------------------------------------------------------------------
"  ListToggle
"
let g:lt_location_list_toggle_map = '<leader>l'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" ------------------------------------------------------------------
"  Goyo
"
let g:goyo_width = 85
function! s:goyo_enter()
    if has("gui_running")
        :SetBigFont
        set fullscreen nocursorline guicursor+=a:blinkon0
    endif

    " 在显示行内移动光标，而不是实际行
    noremap j gj
    noremap k gk
    noremap ^ g^
    noremap $ g$
    "打字机模式
    "inoremap <CR> <C-o>zz<CR>
endfunction

function! s:goyo_leave()
    if has("gui_running")
        :SetNormalFont
        set nofullscreen cursorline guicursor&
    endif

    unmap j
    unmap k
    unmap ^
    unmap $
    "iunmap <CR> " 退出打字机模式
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ------------------------------------------------------------------
" YouComplete
"
let g:ycm_python_binary_path = '/usr/local/bin/python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugin/global_ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_error_symbol = '✘'
let g:ycm_warning_symbol = '⚠︎'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" ------------------------------------------------------------------
" Syntastic options
"
" Syntastic {
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }

" ------------------------------------------------------------------
" 自定义键盘映射
" Fast saving
nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>x :bd<CR>
nnoremap <silent><leader>z :qa<CR>

" Copy and Paste
nnoremap <silent><leader>c "+Y
vnoremap <silent><leader>c "+y
" Paste use Unite funtion <leader>v

" 消除高亮搜索
nnoremap <silent><leader>n   :nohlsearch<CR>

" 模拟OS X的空格键翻页，
"   但是Shift+Space工作不正常，在GUI模式中必须退出输入法，
"   在控制台模式中，必须在iTerm2中模拟发送Hex code: 0x15(Ctrl+U) 或者 0x02(Ctrl+B)
"   M 的Hex code: 0x4D
nnoremap <Space> <C-f>M
nnoremap <S-Space> <C-b>M

" 跳转tags，用<leader>键代替ctrl键
noremap <leader>]  g<C-]>
noremap <leader>[  <C-t>
noremap <leader>g  :YcmCompleter GoTo<CR>
noremap <leader>b  <C-o>
noremap <leader>f  <C-i>

noremap <silent>[l  :lprevious<CR>
noremap <silent>]l  :lnext<CR>
noremap <silent>[L  :lfirst<CR>
noremap <silent>]L  :llast<CR>

noremap <silent>[q  :cprevious<CR>
noremap <silent>]q  :cnext<CR>
noremap <silent>[Q  :cfirst<CR>
noremap <silent>]Q  :clast<CR>


"在多种模式下(v,l,i)用\\执行ESC命令
inoremap <silent><leader><leader>           <Esc>
cnoremap <silent><leader><leader>           <C-u><Esc>
"autocmd BufReadPost quickfix
"\ nnoremap <buffer> <leader><leader> :cclose<CR>

" 添加Bookmarks
noremap <silent><F2> :UniteBookmarkAdd<CR><CR>

" 用F3来打开目录树
noremap <silent><F3> :NERDTreeToggle<CR>
" 定位到目录树中 :cd %:p:h
noremap <silent><F4> :NERDTreeFind<CR>

" 用关联程序打开当前文件，适用于Markdown、html等文件的预览
noremap <silent><F5> :!open %<CR>

" Format
noremap <silent><F8> :Autoformat<CR>

"用F9 进行语法检查
noremap <silent><F9> :SyntasticCheck<CR>

" 专注模式
noremap <silent><F11> :Goyo<CR>

" 快速更改主题
noremap <silent><F12> :colorscheme random<CR>:AirlineRefresh<CR>:colorscheme<CR>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
" Remember info about open buffers on close
set viminfo^=%

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" ------------------------------------------------------------------
" 配置文件.vimrc更改后自动重新载入使设置生效
" autocmd! bufwritepost .vimrc source ~/.vimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! DeleteTrailingWS()
    " 删除每行末尾的空格
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
    " 增加一行用于取消标记位置
    exe "normal mz"
endfunction

function! s:PreviewDotFile()
    " 预览当前打开的dot graphic文件
    exe "!dot % -Tpdf -o /tmp/%:t.pdf; picview /tmp/%:t.pdf; rm /tmp/%:t.pdf"
endfunction
com! PreviewDotFile call s:PreviewDotFile()

function! ReplaceCNQuotemarks()
    %s/‘\|’/'/ge
    %s/“\|”/"/ge
endfunction

" Diff current buffer and the original file
function! s:DiffWithSaved()
    let filetype=&ft
    diffthis
    vnew | r # | normal! 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSaved call s:DiffWithSaved()

"function! s:DiffWithCVSCheckedOut()
"let filetype=&ft
"diffthis
"vnew | r !cvs up -pr BASE #
"1,6d
"diffthis
"exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
"endfunction
"com! DiffCVS call s:DiffWithCVSCheckedOut()

function! s:DiffWithSVNCheckedOut()
    let filetype=&ft
    diffthis
    vnew | exe "%!svn cat " . expand("#:p")
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffSvn call s:DiffWithSVNCheckedOut()

function! s:DiffWithGITCheckedOut()
    let filetype=&ft
    diffthis
    vnew | exe "%!git diff " . expand("#:p:h") . "| patch -p 1 -Rs -o /dev/stdout"
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
    diffthis
endfunction
com! DiffGit call s:DiffWithGITCheckedOut()

