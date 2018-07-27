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
    duces = yatzy_sets.sort_by { |x| x.length }
    pairs = []
    odds = []
    duces.each do |x|
      if x.length == 2
        pairs << x
      else
        odds << x
      end
    end
    if odds.length == 5
      return 0
    else
      return pairs.max.sum
    end
  end

  def yatzy_sets
    @dice.group_by {|x| x}.values
  end

  def two_pair
    duces = yatzy_sets.each  do |x|
      if x.size > 2
        x.pop
      end
    end
    if yatzy_sets.first.length == 2
     duces.map{ |num| num.sum}.take(2).sum
    else
      return 0
    end
  end

  def four_of_a_kind
    if yatzy_sets.first.length >= 4
      yatzy_sets.first.take(4).sum
    else
      return 0
    end
  end

  def three_of_a_kind
     threes_company = yatzy_sets.sort_by { |x| x.length }
     if threes_company.last.take(3).length == 3
       return threes_company.last.take(3).sum
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
