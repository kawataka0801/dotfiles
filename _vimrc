" ハイライト
"----------------------------------------
syntax on
highlight NonText ctermfg=darkgrey gui=NONE guifg=darkcyan
highlight Folded ctermfg=blue
highlight SpecialKey cterm=underline ctermfg=darkgrey guifg=darkcyan
highlight SpecialKey cterm=underline ctermfg=darkgrey guifg=darkcyan

if has("syntax")
    syntax on
    function! ActivateInvisibleIndicator()
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=darkgrey guibg=Blue
        syntax match InvisibleTrailedSpace "[ \t]\+$" display containedin=ALL
        highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=Red
        syntax match InvisibleTab "$" display containedin=ALL
        highlight InvisibleTab term=underline ctermbg=Red guibg=Red
    endf

    augroup invisible
    autocmd! invisible
    autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif

" highlight Cursor ctermbg=darkyellow guibg=darkyellow
" highlight CursorIM ctermbg=red guibg=red

" カーソル位置
"----------------------------------------
augroup cch
autocmd! cch
autocmd WinLeave * set nocursorcolumn nocursorline
autocmd WinEnter,BufRead * set cursorcolumn cursorline
augroup END

" タブ設定
"----------------------------------------
set expandtab ts=4 sw=4 sts=4
set list listchars=tab:>\-,eol:$,trail:*


set t_Co=256
colorscheme desert

" インデント
set autoindent
set cindent
set smartindent
set backspace=indent,eol,start
set showmatch
set wildmenu
set formatoptions+=mM
set ambiwidth=double

" マウス
"----------------------------------------
set mouse=a
set ttymouse=xterm2

" サーチオプション
"----------------------------------------
set hlsearch
set incsearch

" ステータスライン
"----------------------------------------
set number
set statusline=\[%n%{bufnr('$')>1?'/'.bufnr('$'):''}%{winnr('$')>1?':'.winnr().'/'.winnr('$'):''}\]\ %<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l/%L,%c%V%8P

" エンコーディング
"----------------------------------------
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set fenc=utf-8

set browsedir=current
set shellslash
set scrolloff=5
set display=lastline

hi Pmenu guibg=#666666
hi PmenuSel guibg=#8cd0d3 guifg=#666666
hi PmenuSbar guibg=#333333

" My keymap
"----------------------------------------
cmap <C-A> <Home>
cmap <C-E> <End>
cmap <C-F> <Right>
cmap <C-B> <Left>

" date on insert mode
"----------------------------------------
inoremap <F5> <C-r>=strftime('%Y%m%d')<CR>
inoremap <F6> <C-r>=strftime('%Y%m%d-%H%M')<CR>

" 英字配列キーボード用
"----------------------------------------
noremap ; :
noremap : ;


"新しい行を作ったときに高度な自動インデントを行う
"----------------------------------------
set smartindent


"入力モード時、ステータスラインのカラーを変更
"----------------------------------------
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END





