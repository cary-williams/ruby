#99 bottles
require_relative 'englishNumber'
count = 10


while count >= 1
  puts "#{englishNumber(count)} bottles of beer on the wall."
  puts "#{englishNumber(count)} bottles of beer."
  puts "take one down, pass it around."
  count = count -1
  puts "#{englishNumber(count)} bottles of beer on the wall"
end
