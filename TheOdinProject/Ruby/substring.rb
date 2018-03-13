dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def substrings(words, dictionary)
  result = Hash.new(0)
  words= words.downcase.split(" ")
  words.each { |word|
    dictionary.each { |i| result[i] += 1 if word[i] }
  }
  result.sort
end



print substrings("Howdy partner, sit down! How's it going?", dictionary)
