say = 'hi grammy'
while say != 'BYE'
  say = gets.chomp
  while say != say.upcase
    puts 'HUH? SPEAK UP SONNY!'
    say = gets.chomp
  end
year = rand(21) + 1930
  if say == "BYE"
    puts "BYE BYE"
  else puts 'NO, NOT SINCE ' + year.to_s
end
end
