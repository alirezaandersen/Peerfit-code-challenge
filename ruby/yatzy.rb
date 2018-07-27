require 'pry'
class Yatzy

  def initialize(d1, d2, d3, d4, d5)
    @dice = [d1, d2, d3, d4, d5]
  end

  def chance
    @dice.sum
  end

  def yatzy
    a = @dice.group_by { |v| v }.values
    if a.size == 1
      return 50
    else
      return 0
    end
  end

  def ones
    @dice.count(1)
  end

  def twos
    2 * @dice.count(2)
  end

  def threes
    3 * @dice.count(3)
  end

  def fours
    4 * @dice.count(4)
  end

  def fives
    5 * @dice.count(5)
  end

  def sixes
    6 * @dice.count(6)
  end

  def score_pair
      yatzy_sets.each do | num |
      if num.length > 1
        return yatzy_sets.max.sum
      else
        return 0
      end
    end
  end

  def yatzy_sets
    @dice.group_by {|x| x}.values
  end

  def two_pair
    a = @dice.group_by {|x| x}.values
    b = a.each  do |x|
      if x.size > 2
        x.pop
      end
    end
    hightest_pair_score =  b.map{ |num| num.sum}.take(2).sum
    return hightest_pair_score
  end

  def four_of_a_kind
    a = @dice.group_by {|x| x}.values
    a.first.take(4).sum
  end

  def three_of_a_kind
    a = @dice.group_by {|x| x}.values
     b = a.sort_by { |x| x.length }
     if b.last.take(3).length == 3
       return b.last.take(3).sum
     else
       return 0
     end
  end

  def smallStraight
    if @dice.sum == 15
      @dice.sum
    else
      return 0
    end
  end

  def largeStraight
    if @dice.sum == 20
      @dice.sum
    else
      return 0
    end
  end

  def fullHouse
    three_of_a_kind + score_pair
  end
end
