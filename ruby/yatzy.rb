require 'pry'
class Yatzy

  def initialize(d1, d2, d3, d4, d5)
    # @dice = [0]*5
    @dice = [d1, d2, d3, d4, d5]
    # @dice[0] = d1
    # @dice[1] = d2
    # @dice[2] = d3
    # @dice[3] = d4
    # @dice[4] = _5
  end

  def chance
    @dice.sum
  end

  def self.yatzy(dice)
    counts = [0]*(dice.length+1)
    for die in dice do
      counts[die-1] += 1
    end
    for i in 0..counts.size do
      if counts[i] == 5
        return 50
      end
    end
    return 0
  end

  def ones
    @dice.count(1)
  end

  def twos
    num_of_twos = @dice.count(2)
    sum = 2 * num_of_twos
    return sum
  end

  def threes
    num_of_threes = @dice.count(3)
    sum = 3 * num_of_threes
    return sum
  end

  def fours
    num_of_fours = @dice.count(4)
    sum = 4 * num_of_fours
    return sum
  end

  def fives
    num_of_fives = @dice.count(5)
    sum = 5 * num_of_fives
    return sum
  end

  def sixes
    num_of_sixes = @dice.count(6)
    sum = 6 * num_of_sixes
    return sum
  end

  def score_pair
    highest_pair = @dice.group_by {|x| x}.values
      highest_pair.each do | num |
      if num.length > 1
      return highest_pair.max.sum
      else
        return 0
      end
    end
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
