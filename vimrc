" use true color instead of 256 color palette
if (has("termguicolors"))
  set termguicolors
endif

" I never want :W or :Q and it's too easy to keep holding shift
command! W w
command! Q q

" my pinky muscles are weak
imap jj <Esc>
imap Jj <Esc>
imap JJ <Esc>

set clipboard=unnamed " share system clipboard
set expandtab " replace tabs with spaces
set tabstop=2 " set tab width to 2 spaces
set shiftwidth=2 " set indent width to 2 spaces
set shiftround " when at 3 spaces and I hit >>, go to 4, not 5
set list listchars=tab:»·,trail:·,nbsp:· " show trailing whitespace
set number relativenumber " show relative line numbers
syntax enable " enable syntax highlighting
set backspace=indent,eol,start " allow backspacing in insert mode
set mouse=a " enable mouse clicks and scrolling
set noswapfile " disable swapfiles; they're annoying
set statusline=%F " show filenames in the status line
set statusline+=\ col:\ %c " show column numbers in the status line
set statusline+=\ %m " show whether there are changes since the last save in the status line

call plug#begin()
" Move between tmux panes & tmux panes w/ open vim buffers (more in tmux.conf):
Plug 'christoomey/vim-tmux-navigator'
" comment lines & blocks w/ control (held) and -- (- tapped twice):
Plug 'tomtom/tcomment_vim'
" I use this for special rails syntax highlighting (like rspec files):
Plug 'tpope/vim-rails'
" run tests from vim buffers:
Plug 'vim-test/vim-test'
" run tests from vim buffers in other tmux panes:
Plug 'jgdavey/tslime.vim'
" I use this mostly for `:Git blame` in open vim buffers
Plug 'tpope/vim-fugitive'
" format files according to prettier's rules:
Plug 'prettier/vim-prettier', { 'do': 'yarn install --frozen-lockfile --production' }
" everforest is my terminal & vim color scheme
Plug 'sainnhe/everforest'
" coc is for linting and autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" format go files on save
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

" apply prettier when files are saved
" https://github.com/prettier/vim-prettier#configuration
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" setup for vim-test & tslime to run tests in sibling tmux panes:
let mapleader=" "
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
let test#strategy = "tslime"
let g:tslime_always_current_session = 1
let g:tslime_always_current_window = 1
map <leader>tv <Plug>SetTmuxVars
nnoremap <leader>r :call Send_to_Tmux("./" . @% . "\n")<CR>

" use the everforest colorscheme
set background=dark
autocmd vimenter * ++nested colorscheme everforest

" format elm files on save
autocmd BufWritePre *.elm execute ":call CocAction('format')"

" :w in dirWhichDoesntExist/myNewFile.txt will create the dir and then save
" the file instead of erroring because the dir doesn't exist
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END

" coc defaults from https://github.com/neoclide/coc.nvim#example-vim-configuration
source ~/.config/nvim/coc-defaults.vim
