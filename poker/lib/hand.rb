require 'byebug'
require_relative 'deck'

class Hand

  attr_accessor :cards, :deck, :card_score, :face_hash

  def initialize(deck)
    @deck = deck
    @cards = []
    @hand_score = 0
    @card_score = 0
    @score = @hand_score.to_f + @card_score
    @face_hash = {}
    generate_face_hash
  end

  def generate_face_hash
    hash = Hash.new { |hash, key| hash[key] = 0 }
    self.cards.each do |card|
      hash[card.face] += 1
    end
    self.face_hash = hash
  end

  def pairs(num)
    self.face_hash.values.any?{|val| val == num}
  end

  def hand_is_royal_flush?
    return false unless hand_is_flush? && hand_is_straight?
    test_rf = self.cards.map{|card| card.face}
    test_rf.sort!
    test_rf.first == 1  && test_rf.last == 13
  end


  def hand_is_straight_flush?
    hand_is_flush? && hand_is_straight?
  end

  def hand_is_four_of_a_kind?
    pairs(4)
  end

  def hand_is_full_house?
    hand_is_three_of_a_kind? && hand_is_pair?
  end

  def hand_is_flush?
    test_suit = self.cards[0].suit
    self.cards.all? { |card| card.suit == test_suit }
  end

  def hand_is_straight?
    test_straight = self.cards.map{|card| card.face}
    test_straight.sort!
    if test_straight.first == 1 && test_straight.last == 13
      true
    elsif test_straight.first == test_straight.last - 4
      true
    else
      false
    end
  end

  def hand_is_three_of_a_kind?
    pairs(3)
  end

  def hand_is_two_pairs?
    return true if self.face_hash.values.count(2) == 2
    false
  end

  def hand_is_pair?
    pairs(2)
  end

  def high_card
    test_high = self.cards.map{|card| card.face}
    test_high.sort
    return 14 if test_high[first] == 1
    test_high.last
  end


  def evaluate_hand
    debugger
    if hand_is_royal_flush?
      self.card_score = 10
    elsif hand_is_straight_flush?
      self.card_score = 9
    elsif hand_is_four_of_a_kind?
      self.card_score = 8
    elsif hand_is_full_house?
      self.card_score = 7
    elsif hand_is_flush?
      self.card_score = 6
    elsif hand_is_straight?
      self.card_score = 5
    elsif hand_is_three_of_a_kind?
      self.card_score = 4
    elsif hand_is_two_pairs?
      self.card_score = 3
    elsif hand_is_pair?
      self.card_score = 2
    else
      self.card_score = 1
    end
  end

  # private

  def initial_cards
    self.cards += self.deck.remove_cards(5)
  end

end

if __FILE__ == $PROGRAM_NAME
  deck2 = Deck.new
  hand = Hand.new(deck2)
  hand.initial_cards
  p hand.cards.map {|card| card.to_s}
  hand.evaluate_hand
  p hand.card_score
end
