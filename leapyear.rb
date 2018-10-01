#!/usr/bin/env ruby
# From a range of years specified, outputs each year that is also a leap year. 

puts "Enter starting year"
s_year = gets.chomp.to_i

puts "Enter ending year"
e_year = gets.chomp.to_i
puts ""
while s_year <= e_year
  if s_year % 4 == 0 and (s_year % 100 != 0 or s_year % 400 == 0)
    puts s_year

  end
  s_year += 1
end
