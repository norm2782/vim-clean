" Clean syntax file
" Language: Clean
" Maintainer: Jurriën Stutterheim
" Latest Revision: 2013 June 25

if exists("b:clean_syntax")
  finish
endif

syn keyword cleanTodo TODO FIXME XXX contained

syn region cleanComment start="//.*" end="$" display contains=cleanTodo
syn region cleanComment start="/\*" end="\*/" contains=cleanTodo fold

syn keyword cleanConditional if case
syn keyword cleanLabel let! let with where in of
syn match cleanLabel "\s\+#\(!\)\?\s\+" display
syn keyword cleanKeyword infixl infixr infix
syn keyword cleanTypeClass class instance export special
syn keyword cleanBasicType Int Real Char Bool String
syn keyword cleanSpecialType World ProcId Void Files File
syn keyword cleanFFI foreign code

syn match cleanCharDenot "'.'" display
syn match cleanCharsDenot "'[^'\\]*\(\\.[^'\\]\)*'" contained display
syn match cleanIntegerDenot "[+-~]\=\<\(\d\+\|0[0-7]\+\|0x[0-9A-Fa-f]\+\)\>" display
syn match cleanRealDenot "[+-~]\=\<\d\+\.\d+\(E[+-~]\=\d+\)\=" display
syn region cleanStringDenot start=/"/ skip=/\\"/ end=/"/ fold
syn keyword cleanBoolDenot True False

syn match cleanModuleSystem "^\(implementation\|definition\|system\)\?\s\+module" display

syn region cleanIncludeRegion start="^\s*\(from\|import\|\s\+\(as\|qualified\)\)" end="$" contains=cleanIncludeKeyword,cleanDelimiters,cleanTypeDef keepend
syn keyword cleanIncludeKeyword contained from import as qualified

syn match cleanQualified "'[A-Za-z0-9_\.]\+'\." display

syn match cleanDelimiters "(\|)\|\[\(:\|#\|!\)\?\|\]\|{\(:\|#\|!\)\?\|\(:\)\?}\|,\||\|&\|;\|_" display

syn match cleanTypeDef "\s*::\s*" display
syn match cleanFuncTypeDef "\((\?\a\+[a-zA-Z0-9_`]*)\?\|(\?[-~@#$%^?!+*<>\/|&=:]\+)\?\)\(\s\+infix[lr]\?\s\+\d\)\?\s*::.*" contains=cleanSpecialType,cleanBasicType,cleanDelimiters,cleanTypeAnnot,cleanFuncDef,cleanTypeDef,cleanComment
syn match cleanFuncDef "\((\?\a\+[a-zA-Z0-9_`]*)\?\|(\?[-~@#$%^?!+*<>\/|&=:]\+)\?\)\(\s\+infix[lr]\?\s\+\d\)\?\s*::" contained contains=cleanTypeDef,cleanComment
syn match cleanTypeAnnot "\(!\|\*\|\.\|\:\|<=\)" contained
syn keyword cleanDeriving deriving

syn match cleanOperators "=\(:\)\?\|:==\|\s\+o\s\+\|\\\|->\|\(<-\(:\)\?\)" display

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
HiLink cleanFFI             Keyword

HiLink cleanModuleSystem    Keyword
HiLink cleanIncludeKeyword  Include

HiLink cleanQualified       Identifier

HiLink cleanCharDenot       Character
HiLink cleanCharsDenot      String
HiLink cleanStringDenot     String
HiLink cleanIntegerDenot    Number
HiLink cleanRealDenot       Float
HiLink cleanBoolDenot       Boolean

HiLink cleanDelimiters      Delimiter

HiLink cleanTypeDef         Typedef
HiLink cleanFuncTypeDef     Type
HiLink cleanFuncDef         Function
HiLink cleanTypeAnnot       Special
HiLink cleanDeriving        Keyword

HiLink cleanOperators       Operator

delcommand HiLink

syntax sync fromstart
setlocal foldmethod=syntax

let b:current_syntax = "clean"


