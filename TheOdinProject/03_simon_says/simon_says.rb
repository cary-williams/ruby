#write your code here
def echo s
  s
end

def shout s
  s.upcase
end

def repeat(s, times = 2)
  ([s] * times).join(" ")
end

def start_of_word(s, t)
  s[0, t]
end

def first_word s
  s.split(' ')[0]
end

def titleize word
  title = ""
  if(word.include?(" ")==true)
    word = word.split
    title = word.fetch(0).to_s.capitalize
    word = word.slice(1, word.length)
    word.each do |i|
      if(i == "and" || i == "or" || i == "over" || i == "the")
        title = title + " " + i.to_s
      else
        title = title + " "+i.to_s.capitalize
      end
    end
    return title
  else
    return word.to_s.capitalize
  end
end
