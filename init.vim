call plug#begin('~/.vim/plugged')
  Plug 'jiangmiao/auto-pairs'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tweekmonster/deoplete-clang2'
  Plug 'sebastianmarkow/deoplete-rust'
  Plug 'Shougo/neco-syntax'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'nathanaelkane/vim-indent-guides'
  Plug 'rust-lang/rust.vim'
  Plug 'artur-shaik/vim-javacomplete2'
call plug#end()

set completeopt=menuone,longest,noinsert

inoremap <expr><TAB> pumvisible() ? "<C-n>" : "<TAB>"
inoremap <expr><C-TAB> pumvisible() ? "<C-p>" : "<TAB>"
inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

let g:deoplete#enable_at_startup = 1
let g:indent_guides_enable_on_vim_startup = 1

autocmd FileType java setlocal omnifunc=javacomplete#Complete

let g:deoplete#sources#rust#racer_binary='/home/pygar/.cargo/bin/cargo'
let g:deoplete#sources#rust#rust_source_path='/home/pygar/rust-src'
let g:deoplete#sources#rust#show_duplicates=1
syn on 
set nu
set tabstop=2 shiftwidth=2 softtabstop=2 expandtab
filetype plugin indent on
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = "hard"
