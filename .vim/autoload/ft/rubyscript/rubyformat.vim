function! ft#rubyscript#rubyformat#RubyAutoFormat()
  write
  !rubocop --auto-correct %
  write
endfunction
