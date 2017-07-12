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

class Card

  attr_reader :face, :suit

  def initialize(face, suit)
    @face = face
    @suit = suit
  end

  def to_s
    "#{CARD_FACES[face]}#{SUITS[suit]}"
  end

end
