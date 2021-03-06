let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

"TODO: jshint
"TODO:按指定字符对齐

set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

"设置工作目录为当前编辑文件的目录
set bsdir=buffer
set autochdir

"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936

"语言设置
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8

if g:iswindows
set guifont=Monaco:h9
endif

"更改临时文件生成位置
if g:iswindows
set directory=$HOME
else 
set directory=~/tmp,/tmp
endif

"set guifont=NSimSun:h10

"set gfw=YaHei\ Consolas\ Hybrid:h9
"set guifont=Consolas:h12
"set guifont=YaHei\ Consolas\ Hybrid:h12
"set guifont=Yahei\ Mono:h12

set helplang=cn
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"禁止生成临时文件
set nobackup

"搜索忽略大小写
set ignorecase

"搜索逐字符高亮
set incsearch

"行内替换
set gdefault

"始终显示行号
set number

"显示光标的坐标
set ruler

"高亮整行
set cursorline


"自动缩进
set noautoindent
set cindent
set smartindent

"Tab键的宽度
set shiftwidth=4
set tabstop=4

"使用4个空格代替Tab
set expandtab
set softtabstop=4
"Tab键插入四个空格,仅PHP
autocmd FileType php set shiftwidth=4 tabstop=4 expandtab softtabstop=4



"输入法设置
if has('multi_byte_ime')
	"未开启IME时光标背景色
	hi Cursor guifg=bg guibg=Orange gui=NONE
	"开启IME时光标背景色
	hi CursorIM guifg=NONE guibg=Skyblue gui=NONE
	" 关闭Vim的自动切换IME输入法(插入模式和检索模式)
	set iminsert=0 imsearch=0
	" 插入模式输入法状态未被记录时，默认关闭IME
	"inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif



"与Windows共享剪贴板
set clipboard+=unnamed


"编辑vimrc之后，重新加载
if g:iswindows
autocmd! bufwritepost _vimrc source $VIM/_vimrc
else
endif


"配色方案
syntax enable
set background=dark
if g:iswindows
colorscheme solarized
else
    if g:isGUI
        colorscheme solarized
    else
        colorscheme torte
    endif
endif


"##########插件管理 开始#############
filetype off
set rtp+=$VIM/vimfiles/bundle/vundle/
call vundle#rc('$VIM/vimfiles/bundle/')

"插件管理核心库
Bundle 'gmarik/vundle'

"代码补全
Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"代码段自动生成
"Bundle 'snipMate'

"快速查找
Bundle 'kien/ctrlp.vim'

Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
"Bundle "snipmate-snippets"
"Bundle "garbas/vim-snipmate"

"插件 语法/高亮
Bundle 'JavaScript-syntax'
Bundle 'jQuery'
Bundle 'othree/html5.vim'
Bundle 'groenewege/vim-less'
"Bundle 'Markdown'
"Bundle 'Markdown-syntax'
"Bundle 'plasticboy/vim-markdown'
Bundle 'StanAngeloff/php.vim'
Bundle 'php.vim-html-enhanced'
"HTML混排缩进改善
Bundle "pangloss/vim-javascript"

"按特殊字符对其， 需要修改源码以支持中文字符 https://github.com/muzuiget/hacking-patches/blob/master/tabular_cjk_width.patch
Bundle 'Tabular'

"statuslines 增强
Bundle 'scrooloose/vim-statline'

"文件管理器
Bundle 'scrooloose/nerdtree'
"Nerdtree 增强
Bundle 'jistr/vim-nerdtree-tabs'
"autocmd vimenter * NERDTree

"在()、""、甚至HTML标签之间快速跳转；
Bundle 'matchit.zip'
"显示行末的空格；
Bundle 'ShowTrailingWhitespace'
"JS代码格式化插件；
Bundle '_jsbeautify'

"Code check for most languages
Bundle 'scrooloose/syntastic'
let g:syntastic_php_checkers = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_post_args='--standard=psr2'
let g:syntastic_javascript_checkers = ['eslint']

"PHP CodeSniffer
"Bundle 'joonty/vim-phpqa'
Bundle 'jcf/vim-latex'

Bundle 'thinca/vim-quickrun'
Bundle 'mattn/webapi-vim'
Bundle 'tyru/open-browser.vim'
Bundle 'superbrothers/vim-quickrun-markdown-gfm'

"python 
Bundle 'klen/python-mode'
"代码折叠起始的层数
set foldlevelstart=10

"Bundle 'hallettj/jslint.vim'

"即时预览CSS颜色
"Bundle 'skammer/vim-css-color'
"Bundle 'ZenCoding.vim'
"Bundle 'The-NERD-tree'
"Bundle 'SuperTab'

"语法检查
"Bundle 'scrooloose/syntastic'

"颜色管理
Bundle 'altercation/vim-colors-solarized'
"激活插件与文件类型的依赖关系
filetype plugin indent on
"##########插件管理 结束#############

"自定义关联文件类型
au BufNewFile,BufRead *.less set filetype=css
au BufNewFile,BufRead *.phtml set filetype=php
au BufRead,BufNewFile *.js set ft=javascript.jquery

"--------插件设置

"---NeoComplCache 启动并使用Tab触发
let g:neocomplcache_enable_at_startup = 1 

" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 2
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
"if has('conceal')
"  set conceallevel=2 concealcursor=i
"endif


autocmd FileType php,phtml setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType css,less setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" vim markdown
let g:vim_markdown_folding_disabled=1

" ctrlp
noremap <C-W><C-U> :CtrlPMRU<CR>
nnoremap <C-W>u :CtrlPMRU<CR>
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1



let g:quickrun_config = {
\   'markdown': {
\     'type': 'markdown/gfm',
\     'outputter': 'browser'
\   }
\ }



"--------自定义快捷键


" 编辑模式进行光标移动
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <C-o>gj
inoremap <C-k> <C-o>gk


"A-t : 打开NERDTree
map <silent> <C-t>   <ESC>:NERDTree<CR>
" 以打开NERDTree时的目录为工作目录
let NERDTreeChDirMode=1
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
"自动开启Nerdtree
autocmd vimenter * NERDTree
"切换Nerdtree焦点到文件编辑
autocmd VimEnter * wincmd p

"mm : 规范行首空格<cr>去除多余字符<cr>删除空白行<cr>规范行数
nmap mm :%s/\r//g<cr>

"ff : 前后补全
"vmap ff <Esc>`>i')?><Esc>`<i<?=$this->_('<Esc>
vmap ff "zdi<?=$this->tag->_('<C-R>z');?><ESC>



