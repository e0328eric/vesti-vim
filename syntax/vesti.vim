" Vim syntax file
" Language: vesti

" Usage Instructions
" Put this file in .vim/syntax/vesti.vim
" and add in your .vimrc file the next line:
" autocmd BufRead,BufNewFile *.ves set filetype=vesti

if exists("b:current_syntax")
  finish
endif

syn region vestiBrackets       contained extend keepend matchgroup=Bold start=+\(\\\)\@<!\[+ end=+]\|$+ skip=+\\\s*$\|\(\\\)\@<!\\]+ contains=@tclCommandCluster

syn keyword vestiKeyword       docclass begenv useenv defenv redefenv nextgroup=vestiEnv skipwhite
syn keyword vestiKeyword       defun nextgroup=vestiEnv skipwhite
syn keyword vestiKeyword       startdoc endenv importpkg importves importfile importmod pycode
syn keyword vestiKeyword       mainvesfile nonstopmode endswith enddef enddef*
syn keyword vestiKeyword       importltx3 makeatletter makeatother ltx3on ltx3off

syn match   vestiFunction        "\v\\([a-zA-Z_]+)|\\\$|\\\\|\\\#"
syn match   vestiEnv             "\v[a-zA-Z_]+\*?" contained
syn match   vestiArgSplitter     "@"
syn match   vestiSharp           "#"
syn match   vestiDollar          "$!"
syn region  vestiComment         start="%" end="$" contains=vestiTodo
syn region  vestiComment         start="%\*" end="\*%" contains=vestiTodo,@Spell
syn region  vestiVerbatim        start="%-" end="-%"
syn region  vestiVerbatim        start="%-#" end="$"
syn match   vestiLatexComment    "%!"
syn region  vestiBrackets        start="%\[" end="\]"
syn region  vestiTextMath        start="\$" end="\$" contains=vestiMathKeyword,vestiFunction
syn region  vestiInlineMath      start="\$\$" end="\$\$" contains=vestiMathKeyword,vestiFunction
syn keyword vestiTodo            TODO FIXME XXX contained

" numbers (including longs and complex)
let s:dec_num = '-?\d%(_?\d)*'
let s:int_suf = '%(''%(%(i|I|u|U)%(8|16|32|64)|u|U))'
let s:float_suf = '%(''%(%(f|F)%(32|64|128)?|d|D))'
let s:exp = '%([eE][+-]?'.s:dec_num.')'
exe 'syn match vestiNumber /\v<0[bB][01]%(_?[01])*%('.s:int_suf.'|'.s:float_suf.')?>/'
exe 'syn match vestiNumber /\v<0[ocC]\o%(_?\o)*%('.s:int_suf.'|'.s:float_suf.')?>/'
exe 'syn match vestiNumber /\v<0[xX]\x%(_?\x)*%('.s:int_suf.'|'.s:float_suf.')?>/'
exe 'syn match vestiNumber /\v<'.s:dec_num.'%('.s:int_suf.'|'.s:exp.'?'.s:float_suf.'?)>/'
exe 'syn match vestiNumber /\v<'.s:dec_num.'\.'.s:dec_num.s:exp.'?'.s:float_suf.'?>/'
unlet s:dec_num s:int_suf s:float_suf s:exp

syn sync match vestiSync grouphere NONE "):$"
syn sync maxlines=200
syn sync minlines=2000

command -nargs=+ HiLink hi link <args>

" The default methods for highlighting.  Can be overridden later
HiLink vestiBrackets Operator
HiLink vestiKeyword	Keyword
HiLink vestiMathKeyword	Keyword
HiLink vestiFunction Function
HiLink vestiEnv Function
HiLink vestiComment Comment
HiLink vestiTodo Todo
HiLink vestiNumber Number
HiLink vestiVerbatim PreProc
HiLink vestiTextMath PreProc
HiLink vestiInlineMath PreProc
hi vestiArgSplitter      ctermfg=37   guifg=#00afaf
hi vestiSharp            ctermfg=180  guifg=#d7af87
hi vestiSharp            ctermfg=180  guifg=#d7af87
hi vestiAt               ctermfg=180  guifg=#d7af87
hi vestiDollar           ctermfg=180  guifg=#d7af87
hi vestiLatexComment     ctermfg=180  guifg=#d7af87

delcommand HiLink

let b:current_syntax = 'vesti'
