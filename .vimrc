
syntax on
set background=dark
set t_Co=256
"let g:solarized_termcolors=256
"colorscheme solarized
"colorscheme sublimemonokai
"colorscheme molokai
colorscheme abstract
"colorscheme monokai_pro


set nu
set ai
set tabstop=4
set shiftwidth=4
set mouse=a
set backspace=2
set history=100
set incsearch
set hlsearch
set number
set relativenumber

set foldmethod=marker
set foldmarker={{{,}}}

"inoremap ( ()<Esc>i
"inoremap [ []<Esc>i
"inoremap < <><Esc>i
inoremap {} {}<Esc>i
inoremap {<CR> {<CR>}<Esc>ko
"inoremap ) <C-R>=ClosePair(')')<CR>
"inoremap ] <C-R>=ClosePair(']')<CR>
"inoremap > <C-R>=ClosePair('>')<CR>
"inoremap } <C-R>=ClosePair('}')<CR>
"inoremap " <C-R>=QuoteDelim('"')<CR>
"inoremap ' <C-R>=QuoteDelim("'")<CR>





function ClosePair(char)
    if getline('.')[col('.') - 1] == a:char
        return "\<Right>"
    else
        return a:char
    endif
endf


function QuoteDelim(char)
    let line = getline('.')
    let col = col('.')
    if line[col - 2] == "\\"
        "Inserting a quoted quotation mark into the string
        return a:char
    elseif line[col - 1] == a:char
        "Escaping out of the string
        return "\<Right>"
    else
        "Starting a string
        return a:char.a:char."\<Esc>i"
    endif
endf
func! Smart_brace()
if getline(".") == '' || strpart(getline("."), col(".") - 1, 1) == '\<tab>'
call feedkeys("i}\<left>{\<cr>\<up>\<right>\<cr>")
else
"call feedkeys("a\<c-u>{\<left>\<space>\<right>}
"\\<left>\<cr>\<up>\<c-u>\<cr>")
call feedkeys("o}\<left>{\<cr>\<up>\<right>\<cr>")
endif
endfunc
filetype indent on
map <f5> :call CompileRunGcc()<cr>
func! CompileRunGcc()
	exec "w"
	exec "!gcc % -o %<"
	exec "! ./%<"
endfunc
map <f6> :call CompileRunGpp()<cr>
func! CompileRunGpp()
	exec "w"
	exec "!g++ -std=c++17 % -o %<"
	exec "! ./%<"
endfunc
map <f4> :w<cr>:!python3 %<cr>
set foldmethod=marker
nnoremap <space> za
set clipboard=unnamed
autocmd FileType c call Stream()
fu! Stream()
    if line("$") == 1
        call append(0, "#include <stdio.h>")
        call append(1, "#define ll long long")
        call append(2, "#define F(n) FI(i,n)")
        call append(3, "#define FI(i,n) FL(i,0,n)")
        call append(4, "#define FL(i,l,n) for(int i=l;i<n;++i)")
        call append(5, "")
        call append(6, "int main(){")
        call append(7, "    return 0;")
        call append(8, "}")
    endif
endfu
