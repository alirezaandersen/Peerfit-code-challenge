require_relative 'yatzy'
require 'test/unit'
require 'rspec/autorun'

class YatzyTest < Test::Unit::TestCase
  def test_chance_scores_sum_of_all_dice
    expected = 15
    actual = Yatzy.new(2,3,4,5,1).chance()
    assert expected == actual
    assert 16 == Yatzy.new(3,3,4,5,1).chance()
  end

  def test_yatzy_scores_50
    expected = 50
    actual = Yatzy.yatzy([4,4,4,4,4])
    assert expected == actual
    assert 50 == Yatzy.yatzy([6,6,6,6,6])
    assert 0 == Yatzy.yatzy([6,6,6,6,3])
  end

  def test_1s
    assert 1 == Yatzy.new(1,2,3,4,5).ones
    assert 2 == Yatzy.new(1,2,1,4,5).ones
    assert 0 == Yatzy.new(6,2,2,4,5).ones
    assert 4 == Yatzy.new(1,2,1,1,1).ones
  end

  def test_2s
    assert 4 == Yatzy.new(1,2,3,2,6).twos
    assert 10 == Yatzy.new(2,2,2,2,2).twos
  end

  def test_threes
    assert 6 == Yatzy.new(1,2,3,2,3).threes
    assert 12 == Yatzy.new(2,3,3,3,3).threes
  end

  def test_fours_test
    assert 12 == Yatzy.new(4,4,4,5,5).fours
    assert 8 == Yatzy.new(4,4,5,5,5).fours
    assert 4 == Yatzy.new(4,5,5,5,5).fours
  end

  def test_fives()
    assert 10 == Yatzy.new(4,4,4,5,5).fives
    assert 15 == Yatzy.new(4,4,5,5,5).fives
    assert 20 == Yatzy.new(4,5,5,5,5).fives
  end

  def test_sixes_test
    assert 0 == Yatzy.new(4,4,4,5,5).sixes
    assert 6 == Yatzy.new(4,4,6,5,5).sixes
    assert 18 == Yatzy.new(6,5,6,6,5).sixes
  end

  def test_one_pair
    assert 6 == Yatzy.new(3,4,3,5,6).score_pair
    assert 10 == Yatzy.new(5,3,3,3,5).score_pair
    assert 12 == Yatzy.new(5,3,6,6,5).score_pair
  end

  def test_two_Pair
    assert_equal 16, Yatzy.new(3,3,5,5,5).two_pair
    assert_equal 16, Yatzy.new(3,3,5,4,5).two_pair
  end

  def test_three_of_a_kind()
    assert 9 == Yatzy.new(3,3,3,4,5).three_of_a_kind
    assert 15 == Yatzy.new(5,3,5,4,5).three_of_a_kind
    assert 9 == Yatzy.new(3,3,3,3,5).three_of_a_kind
    assert 9 == Yatzy.new(3,3,3,3,3).three_of_a_kind
  end

  def test_four_of_a_knd
    assert 12 == Yatzy.new(3,3,3,3,5).four_of_a_kind
    assert 20 == Yatzy.new(5,5,5,4,5).four_of_a_kind
    assert 12 == Yatzy.new(3,3,3,3,3).four_of_a_kind
  end

  def test_smallStraight()
    assert 15 == Yatzy.smallStraight(1,2,3,4,5)
    assert 15 == Yatzy.smallStraight(2,3,4,5,1)
    assert 0 == Yatzy.smallStraight(1,2,2,4,5)
  end

  def test_largeStraight
    assert 20 == Yatzy.largeStraight(6,2,3,4,5)
    assert 20 == Yatzy.largeStraight(2,3,4,5,6)
    assert 0 == Yatzy.largeStraight(1,2,2,4,5)
  end

  def test_fullHouse()
    assert 18 == Yatzy.fullHouse(6,2,2,2,6)
    assert 0 == Yatzy.fullHouse(2,3,4,5,6)
  end
end
