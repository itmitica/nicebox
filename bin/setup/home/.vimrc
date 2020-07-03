set backupdir=~/bin/vim/tmp//
set directory=~/bin/vim/tmp//
set undodir=~/bin/vim/tmp//

syntax on

set autoindent             " Indent according to previous line.
set background=light
set backspace   =indent,eol,start  " Make backspace work as you would expect.
set cursorline             " Find the current line quickly.
set display     =lastline  " Show as much as possible of the last line.
set expandtab              " Use spaces instead of tabs.
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp1252,default
set hidden                 " Switch between buffers without having to save first.
set hlsearch               " Keep matches highlighted.
set incsearch              " Highlight while searching with / or ?.
set laststatus  =2         " Always show statusline.
set lazyredraw             " Only redraw when necessary.
set list                   " Show non-printable characters.
set nocompatible
set noshowmode
set number
set report      =0         " Always report changed lines.
set ruler
set shiftwidth  =4         " >> indents by 4 spaces.
set shiftround             " >> indents to next multiple of 'shiftwidth'.
set showcmd                " Show already typed keys when more are expected.
set showmatch
set showmode               " Show current mode in command-line.
set splitbelow             " Open new windows below the current window.
set splitright             " Open new windows right of the current window.
set softtabstop =4         " Tab key indents by 4 spaces.
set synmaxcol   =200       " Only highlight the first 200 columns.
set t_Co=256               " This is may or may not needed.
set ttyfast                " Faster redrawing.
set wildmenu
set wrapscan               " Searches wrap around end-of-file.

colorscheme PaperColor
filetype plugin indent on
hi Visual ctermbg=16

if has('multi_byte') && &encoding ==# 'utf-8'
  let &listchars = 'tab:? ,extends:?,precedes:?,nbsp:±'
else
  let &listchars = 'tab:> ,extends:>,precedes:<,nbsp:.'
endif

nnoremap <leader>b :ls<cr>:b

