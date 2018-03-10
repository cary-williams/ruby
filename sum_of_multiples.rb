class Multiples

  def get_multiples
    (1.999).select do |mult|
    mult % 3 == 0 || mult % 5 == 0
  end


  def get_sum
    total = get_multiples.inject(&:+)
  end
end

multiples = Multiples.new
multiples = get_sum(multiples.multiples)
