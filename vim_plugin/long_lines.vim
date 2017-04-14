" Highlight long lines (>80)

autocmd BufEnter * call LongLineHighlight()

function! LongLineHighlightToggle()
  if exists('w:long_line_match') && w:long_line_match == 1
    call LongLineHighlightOff()
  else
    call LongLineHighlightOn()
  endif
endfunction

fu! LongLineHighlightOn()
  let w:long_line_match = 1
  call LongLineHighlight()
endfunction

fu! LongLineHighlightOff()
  let w:long_line_match = 0
  call LongLineHighlight()
endfunction

fu! LongLineHighlight()
  " highlight link OverLength ColorColumn
  highlight OverLength ctermbg=grey guibg=#592929
  if !exists('w:long_line_match')
    let w:long_line_match = 1
  endif
  if (w:long_line_match == 1)
    match OverLength /\%81v./
  else
    match OverLength //
  endif
endfunction
