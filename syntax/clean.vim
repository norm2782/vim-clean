" Clean syntax file
" Language: Clean
" Maintainer: Jurriën Stutterheim
" Latest Revision: 2013 June 25

if exists("b:clean_syntax")
  finish
endif

syn keyword cleanTodo TODO FIXME XXX contained

syn region cleanComment start="//.*" end="$" contains=cleanTodo
syn region cleanComment start="/\*" end="\*/" contains=cleanTodo fold

syn keyword cleanConditional if case
syn keyword cleanLabel let! let with where in of
syn match cleanLabel "\s\+#\(!\)\?\s\+" display
syn keyword cleanKeyword infixl infixr infix
syn keyword cleanTypeClass class instance export
syn keyword cleanBasicType Int Real Char Bool String
syn keyword cleanSpecialType World ProcId Void Files File

syn match cleanCharDenot "'.'" display
syn match cleanCharsDenot "'[^'\\]*\(\\.[^'\\]\)*'" contained display
syn match cleanIntegerDenot "[+-~]\=\<\(\d\+\|0[0-7]\+\|0x[0-9A-Fa-f]\+\)\>" display
syn match cleanRealDenot "[+-~]\=\<\d\+\.\d+\(E[+-~]\=\d+\)\=" display
syn region cleanStringDenot start=/"/ skip=/\\"/ end=/"/ fold
syn keyword cleanBoolDenot True False

syn match cleanModuleSystem "^\(implementation\|definition\|system\)\?\s\+module" display

syn region cleanIncludeRegion start="^\s*\(from\|import\|\s\+\(as\|qualified\)\)" end="$" contains=cleanIncludeKeyword keepend
syn keyword cleanIncludeKeyword contained from import as qualified

syn match cleanDelimiters "(\|)\|\[\|\]\|{\(:\)\?\|\(:\)\?}\|,\||"

syn match cleanFuncTypeDef "\([a-zA-Z].*\|(\=[-~@#$%^?!+*<>\/|&=:]\+)\=\)[ \t]*\(infix[lr]\=\)\=[ \t]*\d\=[ \t]*::.*->.*" contains=cleanSpecialType,cleanBasicType,cleanDelimiters

command -nargs=+ HiLink hi def link <args>

HiLink cleanTodo            Todo

HiLink cleanComment         Comment
HiLink cleanConditional     Conditional

HiLink cleanLabel           Label
HiLink cleanKeyword         Keyword
HiLink cleanTypeClass       Keyword
HiLink cleanIncludeKeyword  Include
HiLink cleanBasicType       Type
HiLink cleanSpecialType     Type

HiLink cleanModuleSystem    Keyword
HiLink cleanIncludeKeyword  Include

HiLink cleanCharDenot       Character
HiLink cleanCharsDenot      String
HiLink cleanStringDenot     String
HiLink cleanIntegerDenot    Number
HiLink cleanRealDenot       Float
HiLink cleanBoolDenot       Boolean

HiLink cleanDelimiters      Special

HiLink cleanFuncTypeDef     Typedef

delcommand HiLink

let b:current_syntax = "clean"