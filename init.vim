" :CocInstall coc-tsserver coc-eslint coc-json coc-prettier coc-css coc-angular coc-emmet coc-html coc-git coc-markdown-preview-enhanced coc-webview

:set relativenumber
:set autoindent
:set tabstop=2
:set shiftwidth=2
:set smarttab
:set softtabstop=2
:set mouse=a
:set encoding=utf8
set noshowmode
set winbl=0
set guifont=Firacode\14

call plug#begin()

Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'ryanoasis/vim-devicons'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'APZelos/blamer.nvim' " Git lens functionality
Plug 'jreybert/vimagit'
Plug 'https://github.com/tpope/vim-fugitive'
"For denite need also ripgrep to ge installed (sudo apt install ripgrep)
" Plug 'Shougo/denite.nvim'
Plug 'https://github.com/rbgrouleff/bclose.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'https://github.com/jremmen/vim-ripgrep'
" Telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

:colorscheme gruvbox
" :colorscheme base16-sweet
hi Normal guibg=NONE ctermbg=NONE

inoremap jk <esc>

" ctrlp
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Simplify work with vim buffers
map gn :bn<cr>
map gp :bp<cr>
map gw :Bclose<cr>

" turn off search highlight
nnoremap ,<space> :nohlsearch<CR>

"===== COC Prettier ====="
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
autocmd BufWritePre *.ts,*.js,*.css,*.scss,*.html Prettier
"===== /COC Prettier ====="

"===== Airline ====="
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#ignore_bufadd_pat = '!|coc-explorer|defx|gundo|nerd_tree|startify|tagbar|term://|undotree|vimfiler'
let g:airline#extensions#tabline#formatter = 'unique_tail'
"=====/Airline ====="

"===== Git Blamer ====="
let g:blamer_enabled = 1
"===== /Git Blamer ====="

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" coc-explorer settings
:nmap <space>e <Cmd>CocCommand explorer --toggle --sources=buffer+,file+ <CR>
:nmap <space>f <Cmd>CocCommand explorer --preset floating<CR>
:nmap <space>v <Cmd>CocCommand markdown-preview-enhanced.openPreview<CR>
" Auto close coc-explorer after las buffer was closed
autocmd BufEnter * if (winnr("$") == 1 && &filetype == 'coc-explorer') | q | endif
let g:coc_explorer_global_presets = {
\   '.vim': {
\     'root-uri': '~/.vim',
\   },
\   'cocConfig': {
\      'root-uri': '~/.config/coc',
\   },
\   'tab': {
\     'position': 'tab',
\     'quit-on-open': v:true,
\   },
\   'tab:$': {
\     'position': 'tab:$',
\     'quit-on-open': v:true,
\   },
\   'floating': {
\     'position': 'floating',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingTop': {
\     'position': 'floating',
\     'floating-position': 'center-top',
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingLeftside': {
\     'position': 'floating',
\     'floating-position': 'left-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'floatingRightside': {
\     'position': 'floating',
\     'floating-position': 'right-center',
\     'floating-width': 50,
\     'open-action-strategy': 'sourceWindow',
\   },
\   'simplify': {
\     'file-child-template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   },
\   'buffer': {
\     'sources': [{'name': 'buffer', 'expand': v:true}]
\   },
\ }
