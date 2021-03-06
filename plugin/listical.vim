if exists("g:loaded_listical") || &cp
  finish
endif
let g:loaded_listical = 1

nnoremap <silent> <Plug>(listical_toggle)        :call listical#toggle()<CR>
nnoremap <silent> <Plug>(listical_quickfix)      :call listical#toggle_quickfix()<CR>
nnoremap <silent> <Plug>(listical_loclist)       :call listical#toggle_loclist()<CR>
nnoremap <silent> <Plug>(listical_next)          :call listical#next()<CR>
nnoremap <silent> <Plug>(listical_next_file)     :call listical#next_file()<CR>
nnoremap <silent> <Plug>(listical_previous)      :call listical#previous()<CR>
nnoremap <silent> <Plug>(listical_previous_file) :call listical#previous_file()<CR>
nnoremap <silent> <Plug>(listical_newer)         :call listical#newer()<CR>
nnoremap <silent> <Plug>(listical_older)         :call listical#older()<CR>

func! s:is_list() abort
  return &filetype == 'qf'
endf

func! s:just_list() abort
  return s:is_list() && winnr('$') == 1
endf

augroup Listical
  autocmd QuitPre  * if !<SID>is_list() | silent! lclose | endif
  autocmd WinEnter * if <SID>just_list() | quit | endif
augroup END
