puts"Enter something:"
word = gets.chomp
word_list = []

while word != ""
  word = gets.chomp
  word_list.push word

end
puts word_list.sort
