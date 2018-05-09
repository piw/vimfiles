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
" [General]
" most common options already set in sensible.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set nobackup
set fileformats=unix,dos
set fileformat=unix
set textwidth=80
set linebreak
set wrap
set wrapmargin=80
set nolist
set tabstop=4
set shiftwidth=4
set expandtab
set foldenable
set foldlevelstart=99
set relativenumber
set cursorline
let g:netrw_dirhistmax = 0  "disable `.netrwhist`

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [User Interface]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme default
set background=dark

if has("gui_running")
    set guioptions-=T
    colorscheme base16-harmonic-dark
    set background=light
    if     g:os == "Windows"
        set guifont=Noto_Mono:h11
    elseif g:os == "Darwin"
        set guifont=Fura\ Code\ Light\ Nerd\ Font\ Complete:h12
    elseif g:os == "Linux"
        set guifont=Noto\ Mono\ 10
    endif
endif

" mark the right margin
set colorcolumn=+1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Custom Shortcuts]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader=","
let g:mapleader=","

" Quick saving/undo
map <leader>x :w<enter>
map <leader>q :redo<enter>
map <leader>z :quit<enter>

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
inoremap jw <Esc>

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
" [Plugin: Indent-Guides]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Plugin: Vimwiki]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let wiki_todo = {}
if g:os == "Windows"
    let wiki_todo.path = 'd:\Dropbox\wiki\TODO'
elseif g:os == "Darwin" || g:os == "Linux"
    let wiki_todo.path = '~/Documents/Drive/wiki/todo'
endif

let wiki_pim = {}
if g:os == "Windows"
    let wiki_pim.path = 'd:\Dropbox\wiki\pim'
elseif g:os == "Darwin" || g:os == "Linux"
    let wiki_pim.path = '~/Documents/Drive/wiki/pim'
endif

let wiki_note = {}
if g:os == "Windows"
    let wiki_note.path = 'd:\Dropbox\wiki\note'
elseif g:os == "Darwin" || g:os == "Linux"
    let wiki_note.path = '~/Documents/Drive/wiki/note'
endif

let g:vimwiki_list = [wiki_todo, wiki_pim, wiki_note]

let g:vimwiki_folding = 'expr'
let g:vimwiki_table_mappings = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" [Plugin: Python-mode]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if g:os == "Windows"
    set pythonthreedll=C:\Users\phe01\AppData\Local\Programs\Python\Python36\python36.dll
endif

let g:pymode_python = 'python3'



" vim: set syntax=vim:
