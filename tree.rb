class OrangeTree
  def initialize
    @age = 0
    @height = 0
    @fruit_count = 0
    puts "A new orange tree is planted"
  end

  def oneYearPasses
    @age += 1
    @fruit_count = 0
    @height += 1

    if dead?
      puts "The tree has died"
      exit
    end

    if @age >= 2
      @fruit_count = @age * 5
    end
  end

  def countTheOranges
    puts "There are #{@fruit_count.to_s} oranges on the tree"
  end

  def height
    puts "The tree is #{@height.to_s} meter tall."
  end

  def pickAnOrange
    countTheOranges
    if @fruit_count >= 1
      puts "You pick an orange."
      @fruit_count -= 1
      countTheOranges
    else
      puts "there are no oranges to pick"
    end
  end

private

  def dead?
    @age > 5
  end

end

puts ""
tree = OrangeTree.new
tree.height
tree.countTheOranges
tree.pickAnOrange
puts ""
tree.oneYearPasses
tree.height
tree.countTheOranges
puts ""
tree.oneYearPasses
tree.height
tree.pickAnOrange
tree.pickAnOrange
puts ""
tree.oneYearPasses
tree.oneYearPasses
tree.height
puts ""
tree.oneYearPasses
tree.height
tree.pickAnOrange
puts ""
tree.oneYearPasses
