set nocompatible "vi非互換モード
set backupskip=/tmp/*,/private/tmp/*

set belloff=all

"#######################
" 表示系
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
" set vim scroll faster
set ttyfast
set lazyredraw
set scrolljump=10

"#######################
" 操作系
"#######################
noremap j gj
noremap k gk
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"#######################
" プログラミングヘルプ系
"#######################
set smartindent "オートインデント
" tab関連
set expandtab "タブの代わりに空白文字挿入
set ts=2 sw=2 sts=0 "タブは半角2文字分のスペース
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif
" 保存時に行末の空白を削除する
autocmd BufWritePre * :%s/\s\+$//ge

" ペーストするときにインデントさせない
" http://qiita.com/items/019250dbca167985fe32
imap <F5> <nop>
set pastetoggle=<F5>

" Enable mouse support in console
set mouse=a

"#######################
" 検索系
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set noincsearch "検索文字列入力時に順次対象文字列にヒットさせない
set nohlsearch "検索結果文字列の非ハイライト表示

" dein settings {{{
if &compatible
  set nocompatible
endif
" dein.vimのディレクトリ
let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" なければgit clone
if !isdirectory(s:dein_repo_dir)
  execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " 管理するプラグインを記述したファイル
  let s:toml = '~/.config/nvim/dein/dein.toml'
  let s:lazy_toml = '~/.config/nvim/dein/dein_lazy.toml'
  call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

" その他インストールしていないものはこちらに入れる
if dein#check_install()
  call dein#install()
endif
" }}}

" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

"set snippet file dir
let g:neosnippet#snippets_directory='~/.cache/dein/repos/github.com/Shougo/neosnippet-snippets/neosnippets/'

" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
" 隠しファイルを表示する
let g:fern#default_hidden=1

syntax on
"colorscheme tender
colorscheme japanesque
set t_Co=256
" truecolor
set termguicolors
" 背景色
set background=dark
" ダブルクォート表示
set conceallevel=0
