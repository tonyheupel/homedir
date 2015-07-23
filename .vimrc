""
"" Basic Setup
""
call pathogen#infect() " Use pathogen to manage runtime path/plugins
set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax on             " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

set guifont=Menlo\ Regular:h14

if has("gui_running")
  " Use Twilight in GUI
  "colorscheme twilight
  " Only set size in GUI (let terminal version fill space)
  set lines=35
  set columns=120

  if has("gui_win32")
    set guifont=Consolas:h12:cANSI
  endif
else
  "set background=dark
  "colorscheme twilight256
  " solarized options
"  let g:solarized_termcolors = 256
"  let g:solarized_visibility = "high"
"  let g:solarized_contrast = "high"
"  colorscheme solarized
endif
colorscheme molokai
set cursorline

set laststatus=2      " keep the status line on
set statusline=\ %f%m%r%h%w%<\ %{&ff}\ %Y\ %{fugitive#statusline()}\ %=%L\ lines\ %l,%v\ %p%%\

filetype plugin indent on

""
"" Whitespace
""
set nowrap                        " don't wrap lines
set tabstop=2                     " a tab is two spaces
set shiftwidth=2                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode
let mapleader="," " map leader to , instead of \
nnoremap <leader>w :%s/\s\+$//<cr>:let @/=''<CR>
" Map <leader>w to 'remove all trailing whitespace'

""
"" Make {<cr> create open/close brackets with a line in between
"" and place the cursor there
imap {<cr> {<cr>}<c-o>O

" List chars
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as " ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""
"set hlsearch    " highlight matches
set incsearch   " incremental searching
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter

""
"" Wild settings
""
" TODO: Investigate the precise meaning of these settings
" set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""
set backupdir=~/.vim/_backup/    " where to put backup files.
set directory=~/.vim/_temp/      " where to put swap files.

""
"" NERDTree
""
map <leader>n :NERDTreeToggle<CR>

""
"" Task List
""
map <leader>td <Plug>TaskList

""
"" PEP8 for Python
""
let g:pep8_map='<leader>8'
""
"" Exuberant CTags
""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

"""
""" closetag plugin - filetype mappings
"""
""" b:closetag_html_style=1 means it knows about <b>, <input>, etc.
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag.vim/plugin/closetag.vim

"""
""" go settings for use with vim-go plugin
"""
let g:go_fmt_command = "goimports"

"" Show interfaces the type under the cursor implements
au FileType go nmap <Leader>s <Plug>(go-implements)
"" Show type info for symbol under cursor
au FileType go nmap <Leader>i <Plug>(go-info)
"" Open godoc horizontally or vertically
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
"" Open godoc in browser
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
"" go build, run, test, coverage
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
"" Like gd for opening definition in current buffer, but these open in:
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
"" Rename identifier under cursor to new name (refactor)
au FileType go nmap <Leader>e <Plug>(go-rename)

"""
""" File Type specific indentation rules
"""
au FileType python,erlang,fs setl shiftwidth=4 tabstop=4
au FileType go setl shiftwidth=8 tabstop=8 noexpandtab nolist
au FileType javascript setl shiftwidth=4 tabstop=4
au FileType c,java,rust,xml,ant,javascript setl shiftwidth=4 tabstop=4 noexpandtab
