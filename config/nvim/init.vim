" use true color instead of 256 color palette
if (has("termguicolors"))
  set termguicolors
endif

" I never want :W or :Q and it's too easy to keep holding shift
command! W w
command! Q q

" my pinky muscles are weak
imap jj <Esc>

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

" before: Plug 'sheerun/vim-polyglot'
set nocompatible

call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'sainnhe/everforest'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-rails'
Plug 'sheerun/vim-polyglot'
Plug 'vim-test/vim-test'
Plug 'jgdavey/tslime.vim'
call plug#end()

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

" colorscheme config
let g:everforest_material_background = 'hard'
colorscheme everforest
