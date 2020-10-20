function! ft#jsscript#jsformat#JSAutoFormat()
  write
  !eslint --fix %
  " !prettier --write %
  " tsc --noEmit
  write
endfunction
