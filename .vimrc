" important settings
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" important mappings
vmap <C-c> "+yi
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <C-r><C-o>+
imap <C-l> <ESC>
vmap <C-l> <ESC>
inoremap jk <ESC>
map <C-n> :NERDTreeToggle<CR>
nnoremap <C-j> <C-d>
nnoremap <C-k> <C-u>

" line numbers
highlight LineNr ctermfg=grey
set number

" max 80 chars per line
set colorcolumn=80

" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" Plug 'morhetz/gruvbox'
" Plug 'crusoexia/vim-monokai'
" Plug 'joshdick/onedark.vim'
" Plug 'liuchengxu/space-vim-dark'
Plug 'ycm-core/YouCompleteMe'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ncm2/ncm2'
Plug 'tpope/vim-haml'
Plug 'roxma/nvim-yarp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'rust-lang/rust.vim'
set completeopt=noinsert,menuone,noselect
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'lervag/vimtex'
call plug#end()

" syntax highlighting
syntax on

" vim multiple cursor keybinds
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_start_word_key      = '<C-d>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-d>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" vim easymotion keybinds
let gLEasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1
nmap s <Plug>(easymotion-s2)
map fj <Plug>(easymotion-j)
map fk <Plug>(easymotion-k)

" colorscheme and airline theme
" colorscheme gruvbox
" let g:airline_theme='gruvbox'
let g:airline_theme='bubblegum'
hi Normal guibg=NONE ctermbg=NONE
hi Comment cterm=italic

function! Snp(s)
    exe 'r' . '~/.vim/snippets/' . a:s
endfunction

command! -nargs=1 Snip call Snp(<q-args>)
