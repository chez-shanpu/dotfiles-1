" required
"" nobackup
set nobackup
set noswapfile

"" appearance
set number
set cursorline
set virtualedit=onemore
set smartindent
set showmatch
set noshowmode
syntax on

"" font config
" set ambiwidth=double

"" Tab
set autoindent
set smartindent
set cindent
set smarttab

set tabstop=4
set shiftwidth=4
set expandtab

filetype indent on
autocmd FileType yaml setlocal sw=2 sts=2 ts=2 et

"" key remap
nnoremap j gj
nnoremap k gk

"" search
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" clipboard
set clipboard+=unnamedplus

" ============== dein =================
" Pythonインタプリタへのパスを指定
if has("mac")
    let g:python3_host_prog = '/usr/local/var/pyenv/versions/neovim3/bin/python3'
    let g:python_host_prog = '/usr/local/var/pyenv/versions/neovim2/bin/python'
else
    let g:python3_host_prog = '/usr/bin/python3'
    let g:python_host_prog = '/usr/bin/python'
endif

let s:dein_cache_dir = $XDG_CACHE_HOME . '/dein'
let s:dein_config_dir = $XDG_CONFIG_HOME . '/nvim'
let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'
let s:toml = s:dein_config_dir . '/dein.toml'
let s:toml_lazy = s:dein_config_dir . '/dein_lazy.toml'

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
let &runtimepath = s:dein_repo_dir .",". &runtimepath

" Required:
if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  " Let dein manage dein
  " Required:
  call dein#add(s:dein_repo_dir)
  
  " Load from toml
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml_lazy, {'lazy': 1})
  
  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

" truecolor¬
set termguicolors

" Color theme
colorscheme tender

" for NERDTree
"" 引数無し起動でNERDTree起動
autocmd vimenter * if !argc() | NERDTree | endif

"" バッファがないとき自動で閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
