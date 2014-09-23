require './player'

describe "Player" do
  describe ".new(name)" do
    it "responds to .new" do
      expect(Player).to respond_to :new
    end

    let(:name) { "Rebecca" }
    it "returns name" do
      expect(Player.new(name)).to eq "Rebecca"
    end
  end
end
