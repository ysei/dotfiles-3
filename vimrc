"
" Personal preference .vimrc file
" Maintained by Adam Bair <adambair@gmail.com>
"
"
" My main editor is MacVim though this will work in standard Vim.
" Currently disorganized, will improve. I promise.
"
" Resources
" http://nvie.com/posts/how-i-boosted-my-vim/
" http://github.com/nvie/vimrc/blob/master/vimrc
"

" Pathogen
" Eases installation of runtime files and plugins
" https://github.com/tpope/vim-pathogen
call pathogen#infect()

set runtimepath^=~/.vim/bundle/ctrlp.vim

" Persistent undo across exits
"================================
au BufWritePre /tmp/* setlocal noundofile
set undodir=~/.vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer
"================================

set nocompatible  " We don't want vi compatibility.
set visualbell
set linebreak
set autoread
set laststatus=2
"let statusline="%f %y%([%R%M]%)%{'!'[&ff=='".&ff."']}%{'$'[!&list]}%{'~'[&pm=='']}%=#%n %l/%L,%c%V "
set statusline=%<%F%=\ [%M%R%H%Y]\ (%(%l,%c%))
set grepprg=ack
set scrolloff=5

set nobackup
set nowritebackup
set noswapfile

set undofile
set undodir=~/tmp

let Tlist_Ctags_Cmd='/usr/local/bin/ctags'

let NERDSpaceDelims=1
let mapleader = ","

let wiki = {}
let wiki.path = '~/vimwiki'
let wiki.diary_index = 'daily'
let wiki.diary_rel_path = 'daily/'
let wiki.nested_syntaxes = {'ruby': 'ruby', 'eruby': 'eruby'}
let g:vimwiki_list = [wiki]

let g:vimwiki_browsers=['open']
let vimwiki_folding=0
let vimwiki_use_calendar=1

map <leader>wn :VimwikiDiaryNextDay<CR>
map <leader>wp :VimwikiDiaryPrevDay<CR>

syntax on
syntax enable
filetype plugin indent on  " Automatically detect file types.
colorscheme monokai " dark, standard
set t_Co=256
" colorscheme pyte  " light, for presenting

" spellchecker configuration
setlocal spell spelllang=en_us
autocmd BufNewFile,BufRead *.txt,*.html,README,*.rdoc,*.wiki set spell

set showtabline=2
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
" set number
set nu

set cursorline " underline current line in console

set incsearch
set ignorecase
set smartcase
set showmatch
set wildmode=longest,list,full
set wildignore+=*.swp,*.bak,*.pyc,*/log/*,*/images/*,*/public/*,*/vendor/*

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$',
  \ 'file': '\.exe$\|\.so$\|\.dll$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

set smarttab

set hidden " hide buffers instead of closing them
           "   the current buffer can be put in the background without being
           "   written.

set switchbuf=useopen " reveal already opened files from the quickfix window instead of opening new buffers

set history=1000    " remember more commands
set undolevels=1000 " remember more levels of undo"

set guioptions-=T " remove toolbar
set guioptions-=l " remove left scrollbar
set guioptions-=L " remove left scrollbar
set guioptions-=r " remove right scrollbar
set guioptions-=R " remove right scrollbar
set guioptions-=b " remove bottom scrollbar
set guioptions-=h " remove bottom scrollbar

" if has("autocmd")
  " autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
  " autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
  " autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
" endif

if has("gui_running")
  highlight ColorColumn ctermbg=7
  set colorcolumn=80

  set fuoptions=maxvert,maxhorz
      
  "GUI is running or is about to start.
  "Maximize gvim window.
  "set guifont=Monaco:h18
  " set guifont=Inconsolata-dz:h18
  set guifont=Inconsolata-dz:h20
  " set guifont=Inconsolata-dz:h26
  " set guifont=Inconsolata-dz:h22
  "set guifont=Monofur:h22
  set lines=90 columns=130
endif

set linespace=1

map -a :call SyntaxAttr()<CR>
map -r :CommandTFlush<CR>

map <leader>nn :NERDTreeToggle<CR>
map <leader>mm :TlistToggle<CR>

set path+=**
map <silent> <F5> :source ~/.vimrc<CR>

map H ^
map L $

" Shortcuts
noremap ; :

" Quick alignment of text
nmap <leader>al :left<CR>
nmap <leader>ar :right<CR>
nmap <leader>ac :center<CR>

" Strip all trailing whitespace from a file, using ,w
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Swap implementations of ` and ' jump to markers
" By default, ' jumps to the marked line, ` jumps to the marked line and
" column, so swap them
nnoremap ' `
nnoremap ` '

" Yank/paste to the OS clipboard with ,y and ,p
nmap <leader>y "+y
nmap <leader>Y "+yy
nmap <leader>p "+p
nmap <leader>P "+P
" nmap <leader>r :registers<CR>
set clipboard=unnamed

" au FocusLost * :wa " save all buffers when the active window loses focus 

map ,sdate :let @z=strftime("%Y-%m-%d")<Cr>"zp
map ,stime :let @z=strftime("%l:%M %p")<Cr>"zp
map ,sdt   :let @z=strftime("%Y-%m-%d %l:%M %p")<Cr>"zp

map ,sfdate :let @z=strftime("= %Y-%m-%d =")<Cr>"zp
map ,sftime :let @z=strftime("=== %l:%M %p ===")<Cr>"zp

silent! call repeat#set("\<Plug>MyWonderfulMap",v:count) 

" toggle relative line numbers
function! g:ToggleNuMode()
  if(&rnu == 1)
    set nu
  else
    set rnu
  endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>

map th :tabfirst<CR>
map tn :tabnext<CR>
map tp :tabprev<CR>
map tl :tablast<CR>
map tc :tabnew<CR>

nmap <leader>t :CtrlP '/'<CR>
nnoremap <leader><leader> <c-^>


command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
set winheight=5
set winminheight=5
set winheight=999

