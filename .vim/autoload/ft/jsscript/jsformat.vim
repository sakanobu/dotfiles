function! ft#jsscript#jsformat#JSAutoFormat()
  write
  !eslint --fix %
  write
endfunction
