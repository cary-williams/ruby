def caesar(input,shift)
  input = input.split(//)
  letters = ('a'..'z').to_a
  cipher = []

  input.each { |letter|
  	if letters.include? letter
	    cipher.push(letters[(letters.index(letter)+shift)%letters.size])
	  elsif letters.include? letter.downcase
	    cipher.push(letters[(letters.index(letter.downcase)+shift)%letters.size].upcase)
	  else
	    cipher.push(letter)

	  end
  }
  puts cipher.join

end
