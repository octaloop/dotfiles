set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

let g:miniBufExplMapWindowNavVim = 1 
  let g:miniBufExplMapWindowNavArrows = 1 
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1 

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
call pathogen#helptags()
call pathogen#infect()

" change the mapleader from \ to ,
let mapleader=','


" Basic Setup
set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set ls=2                        " always show status bar
set noswapfile                  " no swap file
set nobackup                    " no backup
set number                      " enable line numbering
set hidden                      " background unsaved buffers
 
"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode
 
"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase     

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Run my init-html.rb script
nmap <silent> <leader>eh :! d:\programming\ruby\ruby-programs\2013\init-html\init-html.rb<CR>

" Go to ruby programs dir with ,er
nmap <silent> <leader>er :cd d:\programming\ruby\ruby-programs\2014\<CR>

" Let you switch tab without saving
set hidden

" Run current ruby file with pry rescue
nmap <silent> <leader>rr :!rescue %<CR>
imap jj <Esc>

" Remap ; to : to make entering commands easier
nnoremap ; :

"folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use

  let g:miniBufExplMapWindowNavVim = 1 
  let g:miniBufExplMapWindowNavArrows = 1 
  let g:miniBufExplMapCTabSwitchBufs = 1 
  let g:miniBufExplModSelTarget = 1 


let g:syntastic_enable_highlighting = 1
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
let g:syntastic_enable_highlighting = 1

let g:EasyMotion_leader_key = '<Leader>'

" Powerline options
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'fancy'
if has ('gui_running')
  " Maximize gvim window.
  set lines=32 columns=110
	" Set font
	set guifont=Consolas_for_Powerline_FixedD:h11
	" Set Solarized theme - https://github.com/altercation/vim-colors-solarized
  "  colorscheme solarized
  set background=dark
	colorscheme jellybeans
	let g:Powerline_colorscheme = 'solarized256'
endif

:set guioptions-=T  "remove toolbar
:set guioptions-=r  "remove right-hand scroll bar
:set guioptions-=l  "remove left-hand scroll bar
:set guioptions-=L  "remove left-hand scroll bar

" Set Ruby Path
let g:ruby_path="c:/Ruby193/bin"

" Conque
let g:ConqueTerm_PyExe = 'C:\Python33\python.exe'
let g:ConqueTerm_ColorMode = 'conceal'
let g:ConqueTerm_Color = 1

":set shell=\"C:\Console2\Console.exe\"
":set shell=C:\Windows\System32\cmd.exe

" Open file location with F5
map <F5> :execute 'silent !start explorer /select,'.shellescape(expand('%:p'),1)<CR>


function RunIrbConque()
	execute "ConqueTermSplit cmd.exe /k irb.exe" 
endfunction

autocmd BufReadPost fugitive://* set bufhidden=delete


:setlocal spell spelllang=en_us

" Mapping for quick Conque terminal
nmap <leader>cm :ConqueTermSplit cmd<CR>
" Make Conque close buffer when application is closed
let g:ConqueTerm_CloseOnEnd = 1

" Supress warning about CursorHoldI, CursorMovedI for Conque
let g:ConqueTerm_StartMessages = 0

" Let you use Ctrl W navigation in Conque
let g:ConqueTerm_CWInsert = 0

" Send selected text to Conque 
let g:ConqueTerm_SendVisKey = '<F9>'

" Change the leader key to space
let mapleader = " "

" Splits
map :vs :vsplit<cr><c-w>l

" Tabs
nmap <leader>[ :tabprevious<cr>
nmap <leader>] :tabNext<cr>
map T :tabnew<cr>

" Shift-enter to do "end" and move the cursor to correct position (ruby)
imap <S-CR> <CR><CR>end<Esc>-cc

"Open nerdtree with F3
silent! nmap <silent><f3> :NERDTreeToggle<CR>

:nnoremap <F2> :!start "c:\conemu\conemu.exe"<CR>
