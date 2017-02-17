" Highlight long lines (>80)

autocmd BufEnter * highlight OverLength ctermbg=grey guibg=#592929 
autocmd BufEnter * match OverLength /\%81v.*/
autocmd BufEnter * let w:long_line_match = 1

fu! LongLineHighlightToggle()
  highlight OverLength ctermbg=grey guibg=#592929 
  if exists('w:long_line_match') 
    match OverLength //
    unlet w:long_line_match
  else 
    match OverLength /\%81v.*/
    let w:long_line_match = 1
  endif
endfunction
map <Leader>l :call LongLineHighlightToggle()<CR>
