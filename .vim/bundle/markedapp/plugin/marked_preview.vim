" h/t @stevenharman
" https://github.com/stevenharman/config/blob/a6c2f63aa4fe4e18e2a2853b2446faa63c35935d/vimrc.symlink#L309-L320
function! MarkedPreview()
  :w
  let s:markedApp = "/usr/bin/open -a 'Marked 2.app'"
  let s:currentFile = expand("%")
  let s:cmd = "silent ! " . s:markedApp . " " . s:currentFile
  execute s:cmd
  redraw!
endfunction
