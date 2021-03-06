"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [OS Detection]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Version Check & Pathogen]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if v:version < 800
    execute pathogen#infect()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [General]
" most common options already set in sensible.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nobackup
set fileformats=unix,dos
set fileformat=unix
set textwidth=96
set linebreak
set wrap
set wrapmargin=96
set nolist
set tabstop=4
set shiftwidth=4
set expandtab
set foldenable
set foldlevelstart=99
" set relativenumber
set cursorline
let g:netrw_dirhistmax = 0  "disable `.netrwhist`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [User Interface]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme ir_black
set background=dark

if has("gui_running")
    set guioptions-=T
    if     g:os == "Windows"
        set guifont=Ubuntu_Mono:h14
    elseif g:os == "Darwin"
        set guifont=OperatorMonoNerdFontCompl-Light:h14
    elseif g:os == "Linux"
        set guifont=Ubuntu\ Mono\ 12
    endif
endif

" mark the right margin
set colorcolumn=+1

" change cursor shape in different modes (iTerm2 on OSX)
" if g:os == "Darwin"
"     let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"     let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"     let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Custom Shortcuts]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
let g:mapleader=","

" Quick saving/undo
map <leader>x :w<enter>
map <leader>z :redo<enter>

" Switch to the directory of current open buffer
map <leader>cd :cd %:p:h<enter>

" Tab operations
map <right>    :tabnext<enter>
map <left>     :tabprev<enter>

" Key mapping for quick substitution
nmap S :%s//g<Left><Left>
xmap S :s//g<Left><Left>

" Quickly escape to normal mode
inoremap jj <Esc>

" Spell checking
map <leader>ss :setlocal spell!<cr>  " toggle spell-checking
map <leader>sn ]s  " move to next
map <leader>sp [s  " move to last
map <leader>sa zg  " add new word
map <leader>s? z=  " suggest word

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Chinese]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set fileencoding=utf-8
set encoding=utf-8
set formatoptions+=BmM  " better line wrap/break for CJK wide-char

" Convert and save current buffer to utf-8 encoding
map <leader>v :w ++enc=utf-8 %<enter>

" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>dm mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Function: TwiddleCase]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! TwiddleCase(str)
  if a:str ==# toupper(a:str)
    let result = tolower(a:str)
  elseif a:str ==# tolower(a:str)
    let result = substitute(a:str,'\(\<\w\+\>\)', '\u\1', 'g')
  else
    let result = toupper(a:str)
  endif
  return result
endfunction
vnoremap ~ y:call setreg('', TwiddleCase(@"), getregtype(''))<CR>gv""Pgv

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Plugin: Indent-Guides]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Plugin: Powerline]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if g:os == "Darwin"
"     python from powerline.vim import setup as powerline_setup
"     python powerline_setup()
"     python del powerline_setup
" endif



" vim: set syntax=vim:
