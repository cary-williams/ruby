
class Book

  def title=(book)
   words = book.split(' ')
   words.map! { |word| cap(word)}
   words[0].capitalize!
   @title = words.join(' ')

  end

  def cap word
    exclude_words = ['a', 'an', 'and', 'the', 'of', 'in']
    if !exclude_words.include? word
      word.capitalize
    else
      word
    end

  end

  def title
    @title
  end
end
