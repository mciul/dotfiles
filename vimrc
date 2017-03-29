let mapleader = " "
let maplocalleader = "\\"

" Basic settings -------------------------------------------------- {{{
set nocompatible              " be iMproved, required

set backspace=2   " Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set hlsearch      " Highlight all matches after entering search pattern
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set ignorecase    " Case insensitive pattern matching
set smartcase     " Overrides ignorecase if pattern contains upcase
set path+=**      " search the current directory for file arg
set wildmenu      " list wildcard matches

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif
" }}}

" Vundle -------------------------------------------------------- {{{
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
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-commentary'
Plugin 'thoughtbot/vim-rspec'
Plugin 'tpope/vim-dispatch'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-unimpaired'

" plugins to try (again) later
"
" Plugin 'ctrlpvim/ctrlp.vim'
"
" Having lots of trouble with syntastic right now.
" Try again later maybe?
" Also, make sure Rubocop is installed
" Plugin 'scrooloose/syntastic'
"
" Plugin 'AndrewRadev/splitjoin'

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
" }}}

" syntastic ------------------------------------------------------- {{{
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]
let g:syntastic_eruby_ruby_quiet_messages =
      \ {"regex": "possibly useless use of a variable in void context"}

" use rubocop instead of mri
let g:syntastic_ruby_checkers = ['rubocop']
" }}}

" matchit --------------------------------------------------------- {{{

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Turn on matchit
runtime macros/matchit.vim
" }}}

" Tmux-compatible window movement ------------------------------- {{{
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
nnoremap <silent> <C-w>p :TmuxNavigatePrevious<cr>
" }}}

" whitespace and columns ------------------------------------ {{{

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
" }}}

" line numbers ------------------------------------------------- {{{
function! NumberToggle()
  if(&relativenumber ==1)
    set norelativenumber
    set number
  else
    set number
    " TODO: make sure this does the right thing in version 8
    set relativenumber
  endif
endfunction

if (v:version < 703)
else
  set relativenumber
  nnoremap <leader>n :call NumberToggle()<cr>
end

set number
" }}}

" RSpec.vim mappings ------------------------------------------- {{{
" TODO: make the rspec command work everywhere
nnoremap <Leader>t :w<cr>:call RunCurrentSpecFile()<CR>
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>l :call RunLastSpec()<CR>
nnoremap <Leader>a :call RunAllSpecs()<CR>
" use dispatch
" let g:rspec_command = "Dispatch rspec {spec}"
let g:rspec_command = "Dispatch bundle exec rspec {spec}"
" }}}

" fugitive key mappings --------------------------------------- {{{

nnoremap <leader>gb :Gblame<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gc :Gcommit -av<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gu :Gpull<cr>
" }}}

" make the first two vertical splits 85 columns wide
nnoremap <leader>v 3h:vertical resize 85<cr>l:vertical resize 85<cr>

" Switching modes ------------------------------------------ {{{
" Escape alternatives
inoremap jk <esc>
" }}}

" Editing in normal mode ------------------------------------------ {{{

" scroll with the space bar
nnoremap <leader><space> <C-f>

" quick save without chording
nnoremap <leader>w :w<cr>

" insert a space without leaving normal mode
" note that this will still use space even if I change the leader
nnoremap <space>p a <esc>
nnoremap <space>P i <esc>

" Make Y act like C and D, not like yy
nnoremap Y y$
" }}}

" status line ----------------------------------------------------- {{{
set statusline=%f         " Path to the file
set statusline+=%4m         " modified flag
set statusline+=\         " Separator space
set statusline+=%y        " Filetype of the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=,         " Separator
set statusline+=%-6.c     " Current column
" }}}

" filetype settings ---------------------------------------------- {{{
" text filetype settings ----------------------------------- {{{
augroup filetype_text
  autocmd!
  autocmd BufRead,BufNewFile *.txt setfiletype text
  autocmd FileType text setlocal wrap linebreak nolist
augroup END
" }}}

" ruby filetype settings ---------------------------------- {{{
augroup filetype_ruby
  autocmd!
  " create a function definition
  autocmd FileType ruby nnoremap <localleader>d o<cr>def <cr>end<esc>kA
  " create a class from the word under the cursor
  autocmd FileType ruby nnoremap <localleader>c yiw?\v^\s+class\s<cr>Oclass <esc>po<cr>end<cr><esc>kkk
augroup END
" }}}

" vimscript filetype settings ------------------------------------- {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}
" }}}

" Tentative - stuff recommended in "Learn Vimscript the Hard Way" - {{{

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

" TODO - settings for lhaskell?
" normal mode: ^ > < " insert mode: C-T, C-D
" }}}
