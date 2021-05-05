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
set number

" max 80 chars per line
" set colorcolumn=80

" PLUGINS
call plug#begin('~/.local/share/nvim/plugged')
" THEMES
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'morhetz/gruvbox'
" Plug 'crusoexia/vim-monokai'
" Plug 'joshdick/onedark.vim'
" Plug 'liuchengxu/space-vim-dark'

" UTILITY
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-surround'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'mzlogin/vim-markdown-toc'
Plug 'SidOfc/mkdx'

" PROGRAMMING LANGUAGES
Plug 'vim-python/python-syntax'
Plug 'lervag/vimtex'
let g:polyglot_disabled = ['markdown']
Plug 'sheerun/vim-polyglot'
Plug 'alaviss/nim.nvim'
" Plug 'rust-lang/rust.vim'
" Plug 'tpope/vim-haml'
" Plug 'wlangstroth/vim-racket'
" Plug 'dart-lang/dart-vim-plugin'

" OBSOLETE
" Plug 'roxma/nvim-yarp'
" Plug 'ncm2/ncm2'
" Plug 'ncm2/ncm2-bufword'
" Plug 'ncm2/ncm2-path'
" Plug 'ycm-core/YouCompleteMe'
call plug#end()

" theme settings
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" colorscheme base16-default-dark

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" syntax highlighting
let g:python_highlight_all = 1
syntax on

colorscheme dracula
let g:airline_theme='dracula'
set background=dark
set termguicolors
" colorscheme gruvbox
" let g:gruvbox_contrast_dark = "hard"
" hi! Normal guibg=NONE ctermbg=NONE
" hi Comment cterm=italic ctermfg=green

" fix line number background colour
highlight clear LineNr

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

" use python filetype for sage
autocmd BufRead,BufNewFile *.sage set filetype=python
augroup filetypedetect
  au! BufRead,BufNewFile *.sage,*.spyx,*.pyx setfiletype python
augroup END

" Latex specification
let g:tex_flavor = 'latex'

au BufNewFile,BufRead *.tex
    \ set nocursorline |
    \ set nornu |
    \ set number |
    \ let g:loaded_matchparen=1 |

let g:vimtex_compiler_latexmk = {
    \ 'build_dir': 'build',
    \ 'options' : [
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}

let g:Tex_BibtexFlavor = 'biber'
let g:Tex_DefaultTargetFormat="pdf"
let g:Tex_MultipleCompileFormats='pdf,dvi'

" inkscape-figures
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

" markdown preview everywhere
let g:mkdp_command_for_global = 1

" :h mkdx-setting-map-prefix
let g:mkdx#settings = { 'map': { 'prefix': 'z' } }

" coc.nvim STUFF ============
" set hidden
" set nobackup
" set nowritebackup
" set updatetime=300
" set shortmess+=c
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <c-space> coc#refresh()
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <C-j> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <C-j> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" " coc snippets ======
" Use <C-l> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-l>'
" Use <C-h> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-h>'
" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
