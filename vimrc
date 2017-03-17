let mapleader = " "
let maplocalleader = "\\"

set nocompatible              " be iMproved, required

set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " Highlight all matches after entering search pattern
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase    " Case insensitive pattern matching
set smartcase     " Overrides ignorecase if pattern contains upcase

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'scrooloose/syntastic'

" TODO: try Plugin 'AndrewRadev/splitjoin'

" All of your Plugins must be added before the following line
call vundle#end()            " required

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:».,trail:·,nbsp:⎵

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
"set colorcolumn=+1

" Numbers
set relativenumber
set number
function! NumberToggle()
  if(&relativenumber ==1)
    set norelativenumber
    set number
  else
    set relativenumber
    set number
  endif
endfunction

nnoremap <leader>n :call NumberToggle()<cr>

" Use tab as escape character
inoremap <esc> <nop>
inoremap <tab> <esc>
inoremap jk <esc>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Tmux-compatible window movement
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>p :TmuxNavigatePrevious<cr>

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
      \ {"regex": "possibly useless use of a variable in void context"}

" use rubocop instead of mri
let g:syntastic_ruby_checkers = ['rubocop']

" RSpec.vim mappings
nnoremap <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
" use dispatch
" let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = "Dispatch bundle exec rspec {spec}"

" fugitive key mappings

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit -av<cr>
nnoremap <leader>gp :Gpush<cr>

" Turn on matchit
runtime macros/matchit.vim

" Make Y act like C and D, not like yy
nnoremap Y y$

"make the first two vertical splits 85 columns wide
nnoremap <leader>v 3h:vertical resize 85<cr>l:vertical resize 85<cr>

" Tentative - stuff recommended in "Learn Vimscript the Hard Way"

" move the current line up or down
noremap <leader>- kmzjdd`zP
noremap <leader>_ ddp

" turn word to uppercase in insert mode
inoremap <c-u> <esc>viwUea
nnoremap <leader><c-u> mzviwU`z

" quickly edit and source vimrc file
" TODO: figure out how to connect with fugitive
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"abbreviations

iabbrev @@ mciul@ldc.upenn.edu
iabbrev teh the

"settings for plain text files
augroup myvimrc
  autocmd!
  autocmd FileType text setlocal wrap linebreak nolist
augroup END
