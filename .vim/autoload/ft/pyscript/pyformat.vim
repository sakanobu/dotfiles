function! ft#pyscript#pyformat#PyAutoFormat()
  write
  !python3 -m isort %
  !python3 -m black %
  write
endfunction
