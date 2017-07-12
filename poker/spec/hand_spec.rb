require "hand"
require "card"

describe Hand do
  let(:deck) {double("Deck")}
  let(:card1) { Card.new(5, :spade) }
  let(:card2) { Card.new(2, :heart) }
  let(:card3) { Card.new(5, :club) }
  let(:card4) { Card.new(13, :diamond) }
  let(:card5) { Card.new(5, :heart) }
  let(:card6) { Card.new(7, :heart) }
  let(:card7) { Card.new(11, :heart) }
  let(:card8) { Card.new(9, :heart) }
  let(:card9) { Card.new(8, :heart) }
  let(:card10) { Card.new(10, :spade) }
  let(:card11) { Card.new(10, :heart) }
  let(:card12) { Card.new(1, :heart) }
  let(:card13) { Card.new(13, :heart) }
  let(:card14) { Card.new(12, :heart) }
  let(:cards) {[card1, card2, card3, card4, card5]}
  let(:flush_cards) {[card2, card5, card6, card7, card8]}
  let(:straight_cards) {[card6, card7, card8, card9, card10]}
  let(:straight_flush_cards) {[card6, card7, card8, card9, card11]}
  let(:royal_flush_cards) {[card11, card7, card14, card13, card12]}
  subject(:hand) {Hand.new(deck)}

  # before(:each) do
  #   hand.cards = cards
  # end

  # describe "#initialize" do
  #   it "creates a hand with 5 cards" do
  #     expect(hand.cards.count).to eq(5)
  #   end
  # end

  describe "#generate_face_hash" do
    it "creates a hash, counting instances of the faces" do
      hand.cards = cards
      expect(hand.generate_face_hash).to eq({5=>3, 2=>1, 13=>1})
    end
  end

  describe "#check_for_pairs" do
    context "when pairs exist" do
      it "returns an array of pairs" do

      end
    end
  end

  describe "#hand_is_flush?" do
    context "when hand is flush" do
      it "returns true" do
        hand.cards = flush_cards
        expect(hand.hand_is_flush?).to be true
      end
    end
  end

  describe "#hand_is_straight?" do
    context "when hand is staight" do
      it "returns true" do
        hand.cards = straight_cards
        expect(hand.hand_is_straight?).to be true
      end
    end
  end

  describe "#hand_is_straight_flush?" do
    context "when hand is staight flush" do
      it "returns true" do
        hand.cards = straight_flush_cards
        expect(hand.hand_is_straight_flush?).to be true
      end
    end
  end

  describe "#hand_is_royal_flush?" do
    context "when hand is royal flush" do
      it "returns true" do
        hand.cards = royal_flush_cards
        expect(hand.hand_is_royal_flush?).to be true
      end
    end
  end


end
