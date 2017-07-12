require 'hanoi'

describe Hanoi do
  subject(:hanoi) { Hanoi.new }

  describe "#initialize" do
    it "creates a board" do
      inital_array = [[1, 2, 3],[], []]
      expect(hanoi.board).to eq(inital_array)
    end
  end

  describe "#move" do
    context "when move is valid" do
      it "moves the disc" do
        hanoi.move(0, 1)
        expect(hanoi.board).to eq([[2, 3],[1], []])
      end

    end

    context "when move is invalid" do
      it "should raise an error" do
        hanoi.move(0,1)
        expect{hanoi.move(0,1)}.to raise_error(NotValidMoveError)
      end
    end

    context "when starting tower is empty" do
      it "should raise an error" do
        expect{hanoi.move(1,0)}.to raise_error(NotValidMoveError)
      end
    end
  end

  describe "#won?" do
    context "when all discs have been moved to one post" do
      it "should return true" do
        hanoi.move(0,2)
        hanoi.move(0,1
        hanoi.move(2,1)
        hanoi.move(0,2)
        hanoi.move(1,0)
        hanoi.move(1,2)
        hanoi.move(0,2)
        # let(:winning_board) { double("HanoiGame", :board => [[],[1, 2, 3],[]]) }
        expect(hanoi.won?).to be true
      end
    end

    context "when more than one post has discs" do
      it "should return false" do
        hanoi.move(0,2)
        expect(hanoi.won?).to be false
      end
    end
  end

  describe "#get_input" do
    before do
      $stdin = StringIO.new("0,1")
    end

    after do
      $stdin = STDIN
    end

    it "should be an array of two numbers" do
      expect(hanoi.get_input).to be == [0,1]
    end
  end




end
