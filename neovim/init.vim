syntax on
filetype plugin indent on
colorscheme murphy

au BufNewFile,BufRead *.tpp set filetype=cpp
au BufNewFile,BufRead *.f set filetype=verilog

syntax enable
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
let python_highlight_all = 1

:imap jk <Esc>

set hidden

" set options for folding
set foldmethod=syntax
set foldlevelstart=20

" put leader to space
map <space> <leader>
map <space><space> <leader><leader>

" airline settings
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#whitespace#enabled = 0

" NERDTree
let NERDTreeChDirMode = 2
let NERDTreeQuitOnOpen = 1

" Custom key bindings general
nmap <leader>n :NERDTreeToggle <CR>
map <leader>t :TagbarToggle <CR>
map <leader>u :MundoToggle <CR>
nnoremap <leader>l <C-w>l

tnoremap <Esc> <C-\><C-n>
noremap <Esc> <Esc>:noh <CR>

nnoremap <F4> :call vimterm#toggle() <CR>
tnoremap <F4> <C-\><C-n>:call vimterm#toggle() <CR>

" YouCompleteMe settings
let g:ycm_confirm_extra_conf = 0 "Stop asking me every time to confirm

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>gd :YcmCompleter GetDoc<CR>

" Fix colors of YCM
highlight YcmWarningLine guibg=Cyan ctermbg=Cyan
highlight YcmWarningSign guibg=Cyan ctermbg=Cyan
highlight YcmWarningSection guibg=Cyan ctermbg=Cyan
highlight YcmErrorSection guibg=Red ctermbg=Red
highlight YcmErrorLine guibg=Red ctermbg=Red
highlight YcmErrorSign guibg=Red ctermbg=Red

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Other colors
hi Search ctermfg=232 ctermbg=154 guifg=#141413 guibg=#aeee00

" Custom function to Toggle Tagbar and NERDTree
let s:hidden_all = 0
function! ToggleHiddenAll()
	NERDTreeToggle
	wincmd l
	TagbarToggle
endfunction

nnoremap <silent> <leader>; :call ToggleHiddenAll()<CR>

" Rust debugging
let g:ycm_rust_src_path = '/home/dennis/code/rust/src'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_rust_checkers = ['cargo']

" Indent settings
let g:indentLine_char = '┆'
let g:indentLine_color_term = 239

call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ervandew/supertab'

" general
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'bling/vim-bufferline'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'simnalamburt/vim-mundo', {'on': 'MundoToggle'}
Plug 'wvffle/vimterm'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --rust-completer' }
Plug 'rdnetto/YCM-generator', { 'branch': 'stable'}
Plug 'chrisbra/Recover.vim'
Plug 'Yggdroot/indentLine'
Plug 'tpope/vim-surround'
Plug 'Shougo/denite.nvim'
Plug 'editorconfig/editorconfig-vim'

Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}

" versioning
Plug 'tpope/vim-fugitive'

" python
Plug 'bfredl/nvim-ipy'

" rust
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'

" debugging
Plug 'sakhnik/nvim-gdb'
Plug 'vhda/verilog_systemverilog.vim'
call plug#end()

" Denite settings
nnoremap <space>e :Denite file_rec <cr>

call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#filter('matcher_ignore_globs', 'ignore_globs', [ '.git/', '.gradle/', 'build/', '.idea/', 'app/', '*.png', '*.so', '*.a', '*.jar', 'target/' ])
call denite#custom#source('file_rec', 'matchers', ['matcher_ignore_globs', 'matcher/fuzzy'])
