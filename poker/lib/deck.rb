require_relative 'card'
CARD_FACES = {
  1 => "A",
  2 => "2",
  3 => "3",
  4 => "4",
  5 => "5",
  6 => "6",
  7 => "7",
  8 => "8",
  9 => "9",
  10 => "10",
  11 => "J",
  12 => "Q",
  13 => "K"
}
SUITS = {
  spade: "♠️",
  heart: "♥️",
  diamond: "♦️",
  club: "♣️"
}

class Deck
  attr_accessor :cards

  def initialize
    @cards = []
    gen_deck
  end

  def gen_deck
    CARD_FACES.each do |face, _|
      SUITS.each do |suit, _|
        self.cards << Card.new(face, suit)
      end
    end
  end

  def remove_cards(num)
    removed_cards = []
    num.times do
      removed_cards << self.cards.shift
    end
    removed_cards
  end

  def shuffle
    # puts self.cards.class
    self.cards = self.cards.shuffle
  end

end
#
# deck = Deck.new
# # deck.remove_cards(50)
# p deck.cards.map{|card| card.to_s}
# deck.shuffle
# p deck.cards.map{|card| card.to_s}
