require 'deck'

describe Deck do
  subject(:deck) {Deck.new}

  describe "#gen_deck" do
    it "generates 52 card deck" do
      expect(deck.cards.length).to eq(52)
    end
    it "returns an array of cards of the Card Class" do
      result = deck.cards.all? {|card| card.is_a?(Card)}
      expect(result).to be true
    end
  end

  describe "#remove_cards" do
    it "removes a specific amount of cards from the deck" do
      removed_cards = deck.remove_cards(2)
      deck.cards.concat(removed_cards)
      expect(deck.cards.count).to eq(52)
    end
  end

  describe "#shuffle" do
    it "shuffles the deck" do
      deck1 = Deck.new
      deck2 = Deck.new
      deck1.shuffle
      deck1_vals = deck1.cards.map{|card| card.to_s}
      deck2_vals = deck2.cards.map{|card| card.to_s}
      expect(deck1_vals).not_to eq(deck2_vals)
    end
  end
end
