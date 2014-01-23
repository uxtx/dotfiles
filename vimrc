execute pathogen#infect()
syntax on
filetype plugin indent on


    syntax enable
    set background=dark
    colorscheme solarized

set nomodeline

set vb
set number
set tw=79
set formatoptions=croq

if has("gui_running")
    :color ir_black
else
    " :color ir_black
    ":color coffee
endif



:filetype on


:au BufEnter *.py set sw=4 sts=4 et ai 
:au BufEnter *.rb set sw=2 ts=2 et ai
:au BufEnter *.yml set sw=2 ts=2 et ai
:au BufEnter *.haml set sw=2 ts=2 et ai
:au BufEnter *.html set sw=2 ts=2 et ai
:au BufNewFile,BufRead *.less set filetype=less
:set tabstop=4
:set shiftwidth=4
:set expandtab



:au BufEnter *.java set sw=4 sts=4 et ai 

augroup mkd
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
augroup END


let python_highlight_all = 1

function! SuperCleverTab()
  if pumvisible()
    return "\<C-N>"
  endif
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction
" inoremap <Tab> <C-R>=SuperCleverTab()<cr>
nmap <Tab> <C-R>=SuperCleverTab()<cr>

set tags+=./tags


" tab navigation like ffox
nmap <S-tab> :tabprevious<cr>
nmap <C-tab> :tabnext<cr>
map <S-tab> :tabprevious<cr>
map <C-tab> :tabnext<cr>
imap <S-tab> <ESC>:tabprevious<cr>i
imap <C-tab> <ESC>:tabnext<cr>i
nmap <C-t> :tabnew<cr>
imap <C-t> <ESC>:tabnew<cr>
nnoremap <Leader>" ciw"<C-r>""<Esc>
vnoremap <Leader>" c"<C-r>""<Esc>
nnoremap <Leader>" ciw'<C-r>''<Esc>
vnoremap <Leader>" c'<C-r>''<Esc>
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

:let mapleader = ","
map <silent> <leader>j :JSHint<CR>
