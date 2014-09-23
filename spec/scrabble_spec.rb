require './scrabble'

describe "Scrabble" do
  describe "responds to '.new'" do
    it "has a working initialize function" do
      expect(Scrabble).to respond_to :new
    end
  end

  describe ".values" do
    it "has a hash of values in a class method" do
      expect(Scrabble.values.first[1]).to eq 1
    end
  end

  # describe "initializes with hash" do
  #   let(:s) { Scrabble.new }
  #   it "creates hash of values of letters when intializing" do
  #     expect(s.letter_val[10]).to eq ["Q", "Z"]
  #   end
  # end

  describe ".score(word)" do
    it "responds to self.score(word)" do
      expect(Scrabble).to respond_to :score
    end

    word = "Scrabble"
    it "returns the sum of a given word" do
      expect(Scrabble.score(word)).to eq 14
    end
  end

  describe ".highest_score_from(array_of_words)" do
    it "responds to self.highest_score_from" do
      expect(Scrabble).to respond_to :highest_score_from
    end

    array = ["Scrabble", "Aaaeee", "Aee"]
    it "correctly identifies largest word in array" do
      expect(Scrabble.highest_score_from(array)).to eq "Scrabble"
    end
  end

  # think about this, should it really be a class method??
  describe ".tie_checker" do
    it "responds to a class method to check ties in word total" do
      expect(Scrabble).to respond_to :tie_checker
    end

    context "when a tie occurs" do
      it "returns the value of the longer word" do
        expect(Scrabble.tie_checker(array)).to eq
      end
    end
  end


end
