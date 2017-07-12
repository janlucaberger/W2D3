require 'card'

describe Card do
  subject(:card) {Card.new(2, :spade)}
  describe "#initalize" do
    it "takes in a face value" do
      expect(card.face).to eq(2)
    end
    it "face is value is integer" do
      expect(card.face.is_a?(Integer)).to be true
    end
    it "takes in a suit" do
      expect(card.suit).to eq(:spade)
    end
    it "suit is a symbol" do
      expect(card.suit.is_a?(Symbol)).to be true
    end
  end

  describe "#value" do
    it "returns the cards' display value" do
      expect(card.to_s).to eq("2♠️")
    end

  end

end
