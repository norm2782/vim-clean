" Vim plugin for Clean development
" Last Change:  2015 Feb. 21
" Maintainer:   Jurriën Stutterheim <j.stutterheim@cs.ru.nl>
" License:      This file is placed in the public domain.

if exists("g:loaded_clean")
  finish
endif
let g:loaded_clean = 1

let s:save_cpo = &cpo
set cpo&vim

function! SwitchCleanModule()
  let file_name = expand("%:r")
  if expand("%:e") == "icl"
    let newfn = file_name . "." . "dcl"
  else
    let newfn = file_name . "." . "icl"
  endif
  execute ("edit " . newfn)
endfunction

map <leader>m :call SwitchCleanModule()<CR>

command CpmMake !cpm make

let all_tag_files = split(globpath('./Clean\ System\ Files/ctags', '*_tags'), '\n')
for tag_file_name in all_tag_files
  exec "set tags+=" . substitute(tag_file_name, "Clean System Files", "Clean\\\\\\\\\\\\\ System\\\\\\\\\\\\ Files", "") . ";"
endfor

setlocal tabstop=2
setlocal shiftwidth=2
setlocal expandtab

let &cpo = s:save_cpo
