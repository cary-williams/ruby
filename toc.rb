linewidth = 60
chapters = ["Numbers", "Letters", "Variables"]
pages = ["1", "72", "118"]

puts "Table of Contents".center linewidth

chapters.each do |chap|
  index = chapters.index(chap)
  puts "Chapter #{chapters.index(chap) + 1}: " + chap.ljust(linewidth/2) +
    "Page #{pages[index]}".rjust(linewidth / 2)


end
