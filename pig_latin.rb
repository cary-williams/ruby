def translate(sentence)
    words = sentence.split(' ')
    words.map! { |word| pig(word)}
    words.join(' ')
end


def pig word
vowels = ['a', 'e', 'i', 'o', 'u']
  if vowels.include? word[0].downcase
    word + "ay"

  elsif !vowels.include? word[2].downcase and !vowels.include? word[1].downcase
    word[3..-1] + word[0..2] + "ay"

  elsif !vowels.include? word[1].downcase or word[0..1].downcase == "qu"
      if word[1].downcase == "q"
        word[3..-1] + word[0..2] + "ay"
      else
        word[2..-1] + word[0..1] + "ay"
      end

  else
    word[1..-1] + word[0] + "ay"
  end
end
