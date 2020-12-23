"=================================
" Leaden
let mapleader = "\<Space>"
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
nnoremap <Leader>e :wq<CR>

" Buffer switch
map <Leader>bn :bn<cr>
map <Leader>bp :bp<cr>
map <Leader>bd :bd<cr> 
" toggles between the current and most recently used buffers
map <Leader>bb :b#<cr>

" fix polyglot plugin issue
" - it will set js filetype to jasmine.javascript
" - it cannot recognize vtl file
"au BufRead,BufNewFile *.js setfiletype javscript
au BufNewFile,BufRead *.vm,*.vtl set ft=velocity
let g:polyglot_disabled = ['yaml']

" reload
set autoread

" Turn off swap files
set hidden
set noswapfile
set nobackup
set nowb

set pastetoggle=<F2>

" Indent
set autoindent
set smartindent
set shiftwidth=2
set tabstop=2
set smarttab
set expandtab

" Search
set ignorecase
set incsearch
set smartcase
set hlsearch
nnoremap <silent> <Leader>s :nohlsearch<CR> 

" GUI
set noshowmode
set splitbelow
set splitright
set encoding=UTF-8

" Folding
set foldmethod=indent   
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Copy paste cut
noremap <Leader>y "+y
noremap <Leader>p "+p
noremap <Leader>x "+d

"=================================
" Plugins
call plug#begin('~/.vim/plugged')

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" GUI
Plug 'perfectspr/dracula-vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'benmills/vimux'
Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Editor
Plug 'sgur/vim-editorconfig'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" [count]<leader>cc [count]<leader>c<space>
Plug 'preservim/nerdcommenter' 
Plug 'honza/vim-snippets'

" Search
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

" Filetype
Plug 'sheerun/vim-polyglot'

" Testing
Plug 'janko/vim-test'

" Document generator
Plug 'kkoomen/vim-doge', {'do': { -> doge#install({ 'headless': 1 }) }}

call plug#end()

"=================================
" Vimux Settings
 map <Leader>vl :VimuxRunLastCommand<CR>
 map <Leader>vp :VimuxPromptCommand<CR>
"=================================
" NERDTree Settings
map <C-n> :NERDTreeToggle<CR>
nmap <Leader>n :NERDTreeFind<cr>
let NERDTreeShowHidden=1
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"=================================
" open browser Settings
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap <silent>gx <Plug>(openbrowser-smart-search)
vmap <silent>gx <Plug>(openbrowser-smart-search)

"=================================
" Vim Test Settings
let test#python#runner = 'pytest'
let test#strategy = 'vimux'
let test#javascript#mocha#options = '--exit --timeout 20000'
nmap <silent> tn :TestNearest<CR>
nmap <silent> tf :TestFile<CR>
nmap <silent> ts :TestSuite<CR>
nmap <silent> tl :TestLast<CR>
nmap <silent> tg :TestVisit<CR>

"=================================
" FZF Settings
let $FZF_DEFAULT_COMMAND = "fdfind --type f -H -E .git"
let g:fzf_layout = { 'down': '~20%' }
nmap <C-p> :FZF<CR>
nmap <C-m> :Rg<Space>

"================================
" coc Settings
let g:coc_global_extensions = ['coc-snippets','coc-prettier','coc-eslint','coc-lists','coc-css','coc-json','coc-pyright','coc-tsserver','coc-sh','coc-tabnine','coc-vetur','coc-xml','coc-yaml','coc-html']
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes "always keep the signcolumn open
highlight clear SignColumn

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

" Refactor
nmap <Leader>rn <Plug>(coc-rename)

" Format
xmap <Leader>fo <Plug>(coc-format)
nmap <Leader>fo <Plug>(coc-format)
xmap <Leader>fs <Plug>(coc-format-selected)<cr>
nmap <Leader>fs <Plug>(coc-format-selected)<cr>

" Completion
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next='<TAB>'
let g:coc_snippet_prev='<S-TAB>'

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use `:OR` for organize import of current buffer
command! -nargs=0 OR :call CocAction('runCommand', 'editor.action.organizeImport')

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Using CocList
" Find symbol of current document
nmap <silent> fo :<C-u>CocList outline<cr>
" Search workspace symbols
nmap <silent> fs :<C-u>CocList -I symbols<cr>
" Resume latest coc list
nmap <silent> fl :<C-u>CocListResume<CR>

"================================
" fugitive Settings
nmap <silent> gs :<C-u>Gstatus<cr>

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --glob "!.git" --hidden --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

syntax on
colorscheme dracula
