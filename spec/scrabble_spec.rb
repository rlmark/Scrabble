require './scrabble'
require 'simplecov'

SimpleCov.start do
  add_filter "/spec/"
end

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

  describe ".score(word)" do
    it "responds to self.score(word)" do
      expect(Scrabble).to respond_to :score
    end

    let(:word) { "Scrabble" }
    it "returns the sum of a given word" do
      expect(Scrabble.score(word)).to eq 14
    end
  end

  describe ".highest_score_from(array_of_words)" do
    it "responds to self.highest_score_from" do
      expect(Scrabble).to respond_to :highest_score_from
    end

    let(:array) { ["Pleasework", "Aaaeee", "Aee"] }
    it "correctly identifies largest word in array" do
      expect(Scrabble.highest_score_from(array)).to eq "Pleasework"
    end
  end

  describe ".tie_checker" do
    it "responds to a class method to check ties in word total" do
      expect(Scrabble).to respond_to :tie_checker
    end

    context "when a tie occurs" do
      let(:array_with_tie) { ["hippo", "yellow", "hi"] }
      it "returns the value of the longer word" do
        expect(Scrabble.highest_score_from(array_with_tie)).to eq "yellow"
      end
    end

    context "when a tie occurs and two words are the same length" do
      let(:array_doubly_tied) { ["aaaaaatttttt", "Ssaaaaaaaaaa", "Yellow", "Aaaaaaaaaaaa", "Hi"] }
      it "returns the first word in the series" do
        expect(Scrabble.highest_score_from(array_doubly_tied)).to eq "aaaaaatttttt"
      end
    end
  end

  ##### NOTE: Tests are broken... it keep pulling from original array on line 37

end
